require 'pry'

class Cat
  # code goes here
  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end
  
  attr_reader :name
  attr_accessor :owner, :mood
  
  def self.all
    @@all
  end
end

