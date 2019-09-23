class Owner
  # code goes here
  attr_accessor :cat, :dog
  attr_reader :name, :species

  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @pets = []
    @@all << self
  end

  def say_species
    p "I am a human."
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def self.all
    @@all
  end

  def cats
    # Want to find all cats with self's name
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def pets
    @pets << dogs
    @pets << cats
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end
  
  def sell_pets
    pets.each do |pet|
      pet.each do |dog_or_cat|
        dog_or_cat.mood = "nervous"
        dog_or_cat.owner = nil
      end
    end
  end

  def list_pets
    num_cats = self.cats.length
    num_dogs = self.dogs.length
    p "I have #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end
end