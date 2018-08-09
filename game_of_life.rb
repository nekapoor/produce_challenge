require './cellular_automata'

FIVE_BY_FIVE = [[nil, nil, 1, nil, nil], [nil, nil, 1, 1, nil], [nil, 2, 2, 1, nil], [nil, nil, nil, 1, nil], [nil, nil, nil, nil, nil]]
TEN_BY_TEN = [[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil], [nil, nil, 1, 1, nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, 2, nil, nil, nil, nil, nil], [nil, nil, nil, 1, 2, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil], [nil, nil, 1, nil, nil, nil, nil, nil, nil, nil], [nil, 2, 1, nil, nil, nil, nil, nil, nil, nil], [nil, 2, nil, nil, nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]]

generations = 20
@ca = CellularAutomata.new(TEN_BY_TEN, generations)
@ca.cells_after_generation!
puts "ORIGINAL CELLS"
@ca.pretty_print_original_cells

puts "CELLS AFTER #{generations} GENERATIONS"
@ca.pretty_print_cells