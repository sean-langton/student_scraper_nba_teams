class Team

  attr_accessor :name, :team_link, :founded, :historic_wins, :historic_losses, :historic_win_pct, :playoff_app, :div_champ, :conf_champ, :league_champ

  @@all = []

  def initialize(team_hash)
    team_hash.each {|key, value| self.send(("#{key}="), value)}
    @seasons = []
    @@all.push(self)
  end

  def self.create_from_collection(team_array)
    team_array.each {|team_hash| Team.new(team_hash)
    }
  end

  def self.add_season(season)
    @season << season
  end

  def self.all
    @@all
  end

end
