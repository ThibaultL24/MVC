require_relative 'controller'
require_relative 'router'

class View

    def create_gossip
        puts "Quel est ton nom, gossipeur ?"
        input1 = gets.chomp
        puts " Et le contenu de ton gossip ?"
        input2 = gets.chomp
        return params = {author:input1, content:input2}
    end

end