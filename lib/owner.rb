require 'pry'



class Owner
  # code goes here
  @@all = []
  @@count = 0
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @@count += 1
  end

  attr_reader :name, :species

  def say_species
    "I am a human."
  end

  # Owner Class methods .all returns all instances of Owner that have been created
  def self.all
     @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@count = 0
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end
  
  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    pets = self.dogs + self.cats
    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end    
  end

  def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end