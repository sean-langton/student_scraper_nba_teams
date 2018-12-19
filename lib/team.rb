class Team

  attr_accessor :name, :team_link, :founded, :historic_win_pct, :playoff_app, :div_champ, :conf_champ, :league_champ, :year, :league, :team_name, :wins, :losses, :playoffs

  @@all = []

  def initialize(team_hash)
    team_hash.each {|key, value| self.send(("#{key}="), value)
    @@all.push(self)
    }
  end

  def self.create_from_collection(team_array)
    team_array.each {|team_hash| Team.new(team_hash)}
  end

  def self.all
    @@all
  end

end
