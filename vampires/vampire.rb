class Vampire

@@coven = []
attr_accessor :name, :age, :in_coffin, :drank_blood_today

def initialize(name, age)
  @name = name
  @age = age
  @in_coffin = true
  @drank_blood_today = false
end


def self.all
@@coven
end

def self.create(name, age)
  new_vampire = Vampire.new(name, age)

  @@coven << new_vampire
  new_vampire
end

 def drink_blood
   @drank_blood_today = true
 end


def self.sunrise
  @@coven.delete_if do |vampire|
    (vampire.in_coffin == false) or (vampire.drank_blood_today == false)
  end
# require 'pry'
#  binding.pry
end

def self.sunset
  @@coven.map do |vampire|
    vampire.in_coffin = false
    vampire.drank_blood_today = false
  end
end
# require 'pry'
#  binding.pry
def go_home
  @in_coffin = true
end

end

vampire1 = Vampire.create("ziga", 20)
vampire2 = Vampire.create("zich", 30)
puts Vampire.all.inspect
Vampire.sunset
vampire1.drink_blood
vampire1.go_home
vampire2.go_home
puts Vampire.all.inspect
Vampire.sunrise
puts Vampire.all.inspect
