require 'pp'

FIVE_BY_FIVE = [[nil, nil, 1, nil, nil], [nil, nil, 1, 1, nil], [nil, 2, 2, 1, nil], [nil, nil, nil, 1, nil], [nil, nil, nil, nil, nil]]

def cell_type(row, column, arr)
	return false unless is_valid_location?(row, column, arr)
	case arr[row][column]
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

def neighbor_newborn_count(current_row, current_column, arr)
	neighbor_type_count(current_row, current_column, arr)[:newborn]
end

def neighbor_adult_count(current_row, current_column, arr)
	neighbor_type_count(current_row, current_column, arr)[:adult]
end

def neighbor_senior_count(current_row, current_column, arr)
	neighbor_type_count(current_row, current_column, arr)[:senior]
end

def neighbor_type_count(current_row, current_column, arr)
	neighbor_hash = {:newborn => 0, :adult => 0, :senior => 0}
	neighbors = surrounding_neighbor_locations(current_row, current_column, arr)
	neighbors.each do |r, c|
		type = cell_type(r, c, arr)
		neighbor_hash[type.to_sym] += 1 if type
	end
	neighbor_hash
end

def total_neighbor_count(current_row, current_column, arr)
	neighbor_type_count(current_row, current_column, arr).values.inject(0, :+)
end

def surrounding_neighbor_locations(current_row, current_column, arr)
	locations = []
	starting_row = current_row - 1
	starting_col = current_column - 1
	starting_row.upto(starting_row+2) do |r|
		starting_col.upto(starting_col+2) do |c|
			locations << [r, c] if is_valid_location?(r, c, arr)
		end
	end
	locations.delete([current_row, current_column])
	locations 
end

def new_cell_for(current_row, current_column, arr)
	case cell_type(current_row, current_column, arr)
	when nil
	  generate_new_cell_for_empty(current_row, current_column, arr)
	when 'newborn'
	  generate_new_cell_for_newborn(current_row, current_column, arr)
	when 'adult'
	  generate_new_cell_for_adult(current_row, current_column, arr)
	else 
	  return nil
	end
end

def generate_new_cell_for_empty(current_row, current_column, arr)
	if neighbor_adult_count(current_row, current_column, arr) == 2
		return 1
	else
		return nil
	end
end

def generate_new_cell_for_newborn(current_row, current_column, arr)
	if total_neighbor_count(current_row, current_column, arr) >= 5 || total_neighbor_count(current_row, current_column, arr) <= 1
		return nil
	else
		return 2
	end
end

def generate_new_cell_for_adult(current_row, current_column, arr)
	if total_neighbor_count(current_row, current_column, arr) >= 3 || total_neighbor_count(current_row, current_column, arr) == 0
		return nil
	else
		return 3
	end
end

def is_valid_location?(row, column, arr)
	return false if row > 4 || column > 4
	return false if row < 0 || column < 0
	true
end

def process_next_generation(arr)
	next_generation = Array.new(5) { Array.new(5)}
	arr.each_with_index do |x, r|
	  x.each_with_index do |y, c|
			next_generation[r][c] = new_cell_for(r, c, arr)
	  end
	end
	next_generation
end

pp FIVE_BY_FIVE
pp process_next_generation(FIVE_BY_FIVE)


p new_cell_for(1, 1, FIVE_BY_FIVE)
