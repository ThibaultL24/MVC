require_relative 'controller'
require_relative 'router'

class View
attr_reader :number

   def initialize
    @number = 0  # Initialisation de number à 0
   end

    def create_gossip
        puts "Quel est ton nom, gossipeur ?"
        input1 = gets.chomp
        puts " Et le contenu de ton gossip ?"
        input2 = gets.chomp
        @number += 1
        return params = {author:input1, content:input2}
    end

end