#### Some general notes

1. UPDATE: I got rspec to work. Just run `rspec spec/cellular_automata_spec.rb` (assuming rspec is installed. Run `gem install rspec` to install.)
2. Towards the end of this exercise, I refactored the code into a class because I felt like I was passing around this array over and over again and it felt like this grid should live inside an object. Not sure if that's the best approach but things seemed more organized after I refactored. 
3. This was a fun exercise! 

#### How to execute the code 
In the terminal, just type `ruby game_of_life.rb` and you should get an output of the original cells and the cells after 20 generations. Should you want to edit things, I didn't take the time to allow for inputs from the command line, but just open up game_of_life.rb and edit line 146 to see the cells after n generations. 

#### My output for the 10x10 grid
ORIGINAL CELLS  
[[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],  
 [nil, nil, 1, 1, nil, nil, nil, nil, nil, nil],  
 [nil, nil, nil, nil, 2, nil, nil, nil, nil, nil],  
 [nil, nil, nil, 1, 2, nil, nil, nil, nil, nil],  
 [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],  
 [nil, nil, 1, nil, nil, nil, nil, nil, nil, nil],  
 [nil, 2, 1, nil, nil, nil, nil, nil, nil, nil],  
 [nil, 2, nil, nil, nil, nil, nil, nil, nil, nil],  
 [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],  
 [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]]  
  
  
CELLS AFTER 20 GENERATIONS       
[[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],  
 [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],  
 [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],  
 [nil, 2, 2, nil, 2, 2, nil, nil, nil, nil],  
 [nil, nil, nil, nil, nil, nil, 1, 3, 1, nil],  
 [nil, nil, 2, nil, nil, nil, nil, 3, nil, nil],  
 [nil, nil, nil, 2, nil, nil, 1, 3, 1, nil],  
 [nil, nil, nil, nil, nil, nil, 2, nil, nil, nil],  
 [nil, nil, nil, nil, 2, 2, nil, nil, nil, nil],  
 [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]]  
