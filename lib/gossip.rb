class Gossip
    attr_reader :author, :content, :number
  
    def initialize(author, content, number)
      @author = author
      @content = content
      @number = number
    end
  
    def save_csv
      CSV.open('db/gossip.csv', 'a') do |csv|
        csv << [author, content, number]
      end
      puts "Gossip saved to gossip.csv"
    end
  
    def self.all
      all_gossips = []
  
      CSV.foreach('db/gossip.csv') do |author, content, number|
        gossip = Gossip.new(author, content, number)
        all_gossips << gossip
      end
  
      all_gossips
    end
  
    def self.destroy(author, number)
      gossips = CSV.read('db/gossip.csv')
      gossips.reject! { |gossip| gossip[0] == number && gossip[1] == author }
      
      CSV.open('db/gossip.csv', 'w') do |csv|
        gossips.each do |gossip|
          csv << gossip
        end
      end
      puts "Gossips deleted from gossip.csv"
    end
end