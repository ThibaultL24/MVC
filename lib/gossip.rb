require_relative 'router'
require_relative 'controller'
require 'csv'
require 'bundler'
require 'pry'

class Gossip
attr_reader :author, :content

   def initialize(author, content)
  @author = author
  @content = content
   end

   def save_csv
    CSV.open('db/gossip.csv', 'a') do |csv|
      csv << [author, content]
    end
    puts "Gossip saved to gossip.csv"
  end

  def self.all
    all_gossips = []

    CSV.foreach('db/gossip.csv') do |author, content|
      gossip = Gossip.new(author, content)
      all_gossips << gossip
    end

    all_gossips
  end

  def self.destroy(author, *)
    gossips = CSV.read('db/gossip.csv')
    gossips.each do |gossip|
      gossips.delete(gossip) if gossip[0] == author
    end
    CSV.open('db/gossip.csv', 'w') do |csv|
      gossips.each do |gossip|
        csv << gossip
      end
    end
    puts "Gossips deleted from gossip.csv"
  end
end
