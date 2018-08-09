
FIVE_BY_FIVE = [[nil, nil, 1, nil, nil], [nil, nil, 1, 1, nil], [nil, 2, 2, 1, nil], [nil, nil, nil, 1, nil], [nil, nil, nil, nil, nil]]

def cell_type(row, column, arr)
	return 'out of bounds' if row > 4 || column > 4
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

def is_valid_location?(row, column, arr)
	return false if row > 4 || column > 4
	return false if row < 0 || column < 0
	true
end


