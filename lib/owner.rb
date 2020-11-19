require 'pry'

class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end
   
  def self.count 
    self.all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.find_all { |cat| cat.owner == self}
  end

  def dogs
    Dog.all.find_all { |dog| dog.owner == self}
  end

  def buy_cat(new_cat)
    new_cat = Cat.new(new_cat,self)
  end

  def buy_dog(new_dog)
    new_dog = Dog.new(new_dog,self)
  end

  def walk_dogs
    dogs.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.map {|cat| cat.mood = "happy"}
  end

  def sell_pets
    cats.map do |cat| 
      cat.mood = "nervous"
      cat.owner = nil
    end
    dogs.map do |dog| 
      dog.owner = nil
      dog.mood = "nervous"
    end
  end

  def list_pets

    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end