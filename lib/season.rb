class Season

  attr_accessor :year, :league, :team_name, :wins, :losses, :playoffs, :team

  @@all = []

  def initialize(season_hash)
    season_hash.each {|key, value| self.send(("#{key}="), value)}
#    self.send(:team, team)
    @@all.push(self)
  end

  def self.create_from_collection(season_array)
    season_array.each {|season_hash| Season.new(season_hash)}
  end

  def self.all
    @@all
  end
end
