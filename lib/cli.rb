require_relative "team_scraper.rb"
require_relative "team.rb"

class CLI
  BASE_PATH = "https://www.basketball-reference.com/teams/"

  def run
    make_teams
    add_season
    display_teams
  end

  def make_teams
    teams_array = Scraper.scrape_teams(BASE_PATH)
    Team.create_from_collection(teams_array)
  end

  def add_season
    Team.all.each do |team|
      season = Scraper.scrape_season(BASE_PATH + team.team_link.gsub("/teams/", ""))
      Team.add_recent_season(season)
      bi
    end
  end

  def display_teams
    Team.all.each do |team|
      best_performance =
        if team.league_champ.to_i > 0 then "League Champions (#{team.league_champ} times)"
        elsif team.conf_champ.to_i > 0 then "Conference Champions (#{team.conf_champ} times)"
        elsif team.div_champ.to_i > 0 then "Divison Champions (#{team.div_champ} times)"
        else "making (#{team.playoff_app} playoff appearences)"
        end
      puts "#{team.name}".colorize(:light_blue)
      puts "Founded In: " + "#{team.founded}".colorize(:green)
      puts "Best Performance: " + "#{best_performance}".colorize(:green)
      puts "Historical Performance: " + "#{team.historic_wins} - #{team.historic_losses} (#{team.historic_win_pct})".colorize(:green)
      puts "Current Record: " + "#{team.wins} - #{team.losses} (#{team.win_pct})".colorize(:green)
  end

end
end
