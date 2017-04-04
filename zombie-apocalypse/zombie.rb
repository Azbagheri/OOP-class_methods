require 'pry'

class Zombie

@@horde = []
@@plague_level = 10
@@max_speed = 5
@@max_strength = 8
@@default_speed = 1
@@default_strength = 3

attr_accessor :speed, :strength

def initialize(speed, strength)
  @speed = speed
  @strength = strength

  if speed > @@max_speed
    @speed = @@default_speed
  end
  if strength > @@max_strength
    @strength = @@default_strength
  end

  @@horde << self
end

def encounter
    escape = self.outrun_zombie?
    survival = self.survive_attack?
  if escape == true
    puts "You escaped!"
  elsif escape == false && survival == false
    puts "You are killed by the Zombie."
  elsif escape ==false && survival == true
    you = Zombie.new(2,2)
    @@horde << you
    puts "You are turned into a zombie."
  end
end

def outrun_zombie?
  my_speed = rand(@@max_speed)
    if my_speed > @speed
      return true
    else
      return false
    end
end

def survive_attack?
  my_strength = rand(@@max_strength)
    if my_strength > @strength
      return true
    else
      return false
    end
end

def self.all
  @@horde
end

def self.new_day
 self.spawn
 self.increase_plague_level
 self.some_die_off
end

def self.some_die_off
  m = rand(10)
  @@horde = @@horde.drop(m)
  puts "#{m} zombies are dead."
end

def self.spawn
  number = rand(@@plague_level)
  # require 'pry'
  # binding.pry
  number.times do
    Zombie.new(rand(@@max_speed), rand(@@max_strength))
  end
end

def self.increase_plague_level
  @@plague_level = @@plague_level + rand(2)
end

end


puts Zombie.all.inspect
Zombie.new_day
puts Zombie.all.inspect
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter
puts zombie2.encounter
puts zombie3.encounter
