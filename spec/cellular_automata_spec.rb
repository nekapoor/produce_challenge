require './cellular_automata'
require 'spec_helper'

describe CellularAutomata do
	before do
		TEN_BY_TEN = [[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil], [nil, nil, 1, 1, nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, 2, nil, nil, nil, nil, nil], [nil, nil, nil, 1, 2, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil], [nil, nil, 1, nil, nil, nil, nil, nil, nil, nil], [nil, 2, 1, nil, nil, nil, nil, nil, nil, nil], [nil, 2, nil, nil, nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]]
		@ca = CellularAutomata.new(TEN_BY_TEN)

	end

	describe "#is_valid_location?" do
		it "should return false for bad row and column" do
			expect(@ca.is_valid_location?(-1, -1)).to eq false
		end

		it "should return false for bad row and column" do
			expect(@ca.is_valid_location?(100, 100)).to eq false
		end
	end

	describe "#cell_type" do
		it "should return newborn for (1, 2)" do 
			expect(@ca.cell_type(1, 2)).to eq "newborn"
		end
		it "should return adult for (2, 4)" do 
			expect(@ca.cell_type(2, 4)).to eq "adult"
		end
		it "should return nil for (0, 0)" do 
			expect(@ca.cell_type(0, 0)).to eq nil
		end
	end

	describe "#surrounding_neighbor_locations" do
		it "should return 3 locations for (0, 0)" do
			expect(@ca.surrounding_neighbor_locations(0, 0)).to eq [[0, 1], [1, 0], [1, 1]]
		end
	end
end
