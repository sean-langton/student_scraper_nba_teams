class Team

  attr_accessor :name, :team_link, :founded, :historic_wins, :historic_losses, :historic_win_pct, :playoff_app, :div_champ, :conf_champ, :league_champ, :wins, :losses, :win_pct

  @@all = []

  def initialize(team_hash)
    team_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all.push(self)
  end

  def self.create_from_collection(team_array)
    team_array.each {|team_hash| Team.new(team_hash)
    }
  end

  def self.add_recent_season(season_hash)
    season_hash.each {|key,value| self.send(("#{key}="), value)}
    self
  end

  def self.all
    @@all
  end

end
