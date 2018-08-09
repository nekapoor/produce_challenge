
FIVE_BY_FIVE = [[nil, nil, 1, nil, nil], [nil, nil, 1, 1, nil], [nil, 2, 2, 1, nil], [nil, nil, nil, 1, nil], [nil, nil, nil, nil, nil]]

def cell_type(row, column, arr)
	return 'out of bounds' if row > 4 or column > 4
	case arr[row][column]
	when 1
	  puts 'newborn'
	when 2
	  puts 'adult'
	when 3
	  puts 'senior'
	else
	  puts nil
	end
end

def neighbor_newborn_count(current_row, current_column, arr)

end

def neighbor_adult_count(current_row, current_column, arr)
end

def neighbor_senior_count(current_row, current_column, arr)
end

def surrounding_neighbor_locations(current_row, current_column, arr)
end

cell_type(0, 0, FIVE_BY_FIVE)
cell_type(3, 0, FIVE_BY_FIVE)
cell_type(0, 2, FIVE_BY_FIVE)
cell_type(2, 1, FIVE_BY_FIVE)
cell_type(2, 2, FIVE_BY_FIVE)