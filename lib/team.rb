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

  def add_season(season)
    @seasons << season
  end

  def self.all
    @@all
  end

  def self.find(name)
    @@all.find{|team| team if team.name == name}
  end

  def seasons
    @seasons
  end

  def summary
    best_performance =
      if self.league_champ.to_i > 0 then "League Champions (#{self.league_champ} times)"
      elsif self.conf_champ.to_i > 0 then "Conference Champions (#{self.conf_champ} times)"
      elsif self.div_champ.to_i > 0 then "Divison Champions (#{self.div_champ} times)"
      else "making (#{self.playoff_app} playoff appearences)"
      end
    puts "#{self.name}".colorize(:cyan)
    puts "Founded In: " + "#{self.founded}".colorize(:green)
    puts "Best Performance: " + "#{best_performance}".colorize(:green)
    puts "Historical Performance: " + "#{self.historic_wins} - #{self.historic_losses} (#{self.historic_win_pct})".colorize(:green)
  end

end
