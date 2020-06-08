class Gym
  attr_reader :name

  @@all = [ ]

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select { |membership| membership.gym == self }
    # binding.pry
  end

  def lifters
    # binding.pry
    memberships.collect { |membership| membership.lifter } 
  end

  # Get a list of the names of all lifters that have a membership to that gym
  def names
    lifters.collect { |lifter| lifter.name}
  end

  def lift_total
    lifters.collect { |lifter| lifter.lift_total}.sum
  end
end

