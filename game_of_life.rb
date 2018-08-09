require 'pp'

FIVE_BY_FIVE = [[nil, nil, 1, nil, nil], [nil, nil, 1, 1, nil], [nil, 2, 2, 1, nil], [nil, nil, nil, 1, nil], [nil, nil, nil, nil, nil]]
TEN_BY_TEN = [[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil], [nil, nil, 1, 1, nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, 2, nil, nil, nil, nil, nil], [nil, nil, nil, 1, 2, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil], [nil, nil, 1, nil, nil, nil, nil, nil, nil, nil], [nil, 2, 1, nil, nil, nil, nil, nil, nil, nil], [nil, 2, nil, nil, nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]]

class CellularAutomata

  def initialize(arr, generations = 1)
    @original_cells = arr
    @cells = arr
    @rows = arr.length
    @cols = arr[0].length
    @generations = generations
  end

  def cells_after_generation!
    return @cells if @generations == 0
    (@generations-1).times do 
      process_next_generation!
    end
  end

  def process_next_generation!
    gen_arr = Array.new(@rows) { Array.new(@cols)}
    @cells.each_with_index do |x, r|
      x.each_with_index do |y, c|
        gen_arr[r][c] = new_cell_for(r, c)
      end
    end
    @cells = gen_arr
  end

  def cells
    @cells
  end

  def pretty_print_cells
    pp @cells
  end

  def pretty_print_original_cells
    pp @original_cells
  end

  def new_cell_for(current_row, current_column)
    case cell_type(current_row, current_column)
    when nil
      generate_new_cell_for_empty(current_row, current_column)
    when 'newborn'
      generate_new_cell_for_newborn(current_row, current_column)
    when 'adult'
      generate_new_cell_for_adult(current_row, current_column)
    when 'senior' 
      return nil
    end
  end

  def generate_new_cell_for_empty(current_row, current_column)
    if neighbor_adult_count(current_row, current_column) == 2
      return 1
    else
      return nil
    end
  end

  def generate_new_cell_for_newborn(current_row, current_column)
    total = total_neighbor_count(current_row, current_column)
    if total >= 5 || total <= 1
      return nil
    else
      return 2
    end
  end

  def generate_new_cell_for_adult(current_row, current_column)
    total = total_neighbor_count(current_row, current_column)
    if total >= 3 || total == 0
      return nil
    else
      return 3
    end
  end

  def surrounding_neighbor_locations(current_row, current_column)
    locations = []
    starting_row = current_row - 1
    starting_col = current_column - 1
    starting_row.upto(starting_row+2) do |r|
      starting_col.upto(starting_col+2) do |c|
        locations << [r, c] if is_valid_location?(r, c)
      end
    end
    locations.delete([current_row, current_column])
    locations 
  end


  def neighbor_newborn_count(current_row, current_column)
    neighbor_type_count(current_row, current_column)[:newborn]
  end

  def neighbor_adult_count(current_row, current_column)
    neighbor_type_count(current_row, current_column)[:adult]
  end

  def neighbor_senior_count(current_row, current_column)
    neighbor_type_count(current_row, current_column)[:senior]
  end

  def neighbor_type_count(current_row, current_column)
    neighbor_hash = {:newborn => 0, :adult => 0, :senior => 0}
    neighbors = surrounding_neighbor_locations(current_row, current_column)
    neighbors.each do |r, c|
      type = cell_type(r, c)
      neighbor_hash[type.to_sym] += 1 if type
    end
    neighbor_hash
  end

  def total_neighbor_count(current_row, current_column)
    neighbor_type_count(current_row, current_column).values.inject(0, :+)
  end

  def cell_type(row, column)
    return false unless is_valid_location?(row, column)
    case @cells[row][column]
    when 1
      return 'newborn'
    when 2
      return 'adult'
    when 3
      return 'senior'
    else
      return nil
    end
  end

  def is_valid_location?(row, column)
    return false if row > @rows-1 || column > @cols-1
    return false if row < 0 || column < 0
    true
  end

end

generations = 20
@ca = CellularAutomata.new(TEN_BY_TEN, generations)
@ca.cells_after_generation!
puts "ORIGINAL CELLS"
@ca.pretty_print_original_cells

puts "CELLS AFTER #{generations} GENERATIONS"
@ca.pretty_print_cells