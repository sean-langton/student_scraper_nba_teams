class Season

  attr_accessor :year, :league, :team_name, :wins, :losses, :playoffs, :team

  @@all = []

  def initialize(season_hash, team)
    self.team = team
    team.add_season(self)
    season_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all.push(self)
  end

  def self.create_from_collection(season_array, team)
    season_array.each {|season_hash| Season.new(season_hash, team)}
  end

  def self.all
    @@all
  end

  def self.find(year_input)
    @@all.select{|season| season.year == year_input}
  end
end
