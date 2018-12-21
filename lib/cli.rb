require_relative "team_scraper.rb"
require_relative "team.rb"

class CLI
  BASE_PATH = "https://www.basketball-reference.com/teams/"

  def run
    make_teams
#    add_recent_season
    display_teams
  end

  def make_teams
    teams_array = Scraper.scrape_teams(BASE_PATH)
    Team.create_from_collection(teams_array)
  end

#  def add_recent_season
#    Team.all.each do |team|
#      season = scrape_season(BASE_PATH + team.team_link)
#      add_recent_season(season)
#    end
#  end

  def display_teams
    Team.all.each do |team|
      best_performance =
        if team.league_champ.to_i > 0 then "League Champions (#{team.league_champ} times)"
        elsif team.conf_champ.to_i > 0 then "Conference Champions (#{team.conf_champ} times)"
        elsif team.div_champ.to_i > 0 then "Divison Champions (#{team.div_champ} times)"
        else "making (#{team.playoff_app} playoff appearences)"
        end
      puts "#{team.name}".colorize(:blue)
      puts "Founded In: " + "#{team.founded}".colorize(:green)
      puts "Best Performance: " + "#{best_performance}"
      puts "Current Record"
  end

  def add_recent_seasons
  end

end
end
