class Vampire

@@coven = []
attr_reader :name, :age, :in_coffin, :drank_blood_today

def initialize(name, age)
  @name = name
  @age = age
  @in_coffin = true
  @drank_blood_today = false
end

def self.create(name, age)
    new_vampire = Vampire.new(name, age)

    coven << new_vampire
end
 def drink_blood
   @drank_blood_today = true if @drank_blood_today == false
 end


def self.sunrise
  @@coven.each |vampire|
    if vampire.in_coffin == false || vampire.drank_blood_today == false
      @@coven.delete(vampire)
    end

  end
end

def sunset
end

def go_home
end














end
