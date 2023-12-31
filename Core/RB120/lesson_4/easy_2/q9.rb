#If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

#What would happen if we added a play method to the Bingo class, keeping in mind that there is already a method of this name in the Game class that the Bingo class inherits from.

# defining another `play` method within the `Bingo` class while inheriting a `play` method from `Game` will simply shadow the inherited `play` method because it appears first in the lookup path.
#All other methods will still be inherited normally.