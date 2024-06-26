require_relative 'gossip'
require_relative 'router'
require_relative 'view'

class Controller
    def initialize
      @view = View.new
    end
  
    def create_gossip
      params = @view.create_gossip
      gossip = Gossip.new(params[:author], params[:content], @view.number)
      gossip.save_csv
    end
  
    def index_gossips
      puts "Affichage de tous les gossips :"
      Gossip.all.each do |gossip|
        puts "#{gossip.number} : #{gossip.author} : #{gossip.content}"
      end
    end
  
    def destroy_gossip
        puts "Entrez le nom de l'auteur du gossip que vous souhaitez supprimer :"
        author = gets.chomp
        puts "Entrez le numéro du gossip que vous souhaitez supprimer :"
        number = gets.chomp
    
        Gossip.destroy(author, number)
    end
end