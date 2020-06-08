class Lifter
  attr_reader :name, :lift_total

  @@all = [ ]

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  # Get a list of all the memberships that a specific lifter has
  #instance method or class method?
  #name?
  def memberships
    Membership.all.select { |membership| membership.lifter == self }
    # binding.pry
  end

  # Get a list of all the gyms that a specific lifter has memberships to
  # instance method or class method?
  # name ? 
  def gyms
    # binding.pry
    memberships.collect { |membership| membership.gym } 
  end

  # Get the average lift total of all lifters
  def self.avg_total
    # binding.pry
    totals = all.map { |lifter| lifter.lift_total } 
    totals.sum / all.length
  end

  # Get the total cost of a specific lifter's gym memberships
  def cost
    total_cost = self.memberships.map { |membership| membership.cost }
    total_cost.sum
  end

  # Given a gym and a membership cost, sign a specific lifter up for a new gym
  # Look at the variables given to you
  # check the join, what variables it takes in
  # pay attention work, action of this deliverables.
  def sign_up(gym, cost)
    # binding.pry
    Membership.new(cost, self, gym)
  end

end
