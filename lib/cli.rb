require_relative "team_scraper.rb"
require_relative "team.rb"

class CLI
  BASE_PATH = "https://www.basketball-reference.com/teams/"

  def run
    make_teams
    display_historical
  end

  def make_teams
    teams_array = Scraper.scrape_teams(BASE_PATH)
    Team.create_from_collection(teams_array)
  end

  def display_historical
    Team.all.each do |team|
      best_performance =
        if team.league_champ.to_i > 0 then "League Champions (#{team.league_champ} times)"
        elsif team.conf_champ.to_i > 0 then "Conference  Champions (#{team.conf_champ} times)"
        elsif team.div_champ.to_i > 0 then "Divison  Champions (#{team.div_champ} times)"
        else "making (#{team.playoff_app} playoff appearences)"
        end
      puts "The " + "#{team.name}" + " were founded in " + "#{team.founded}" +"."
      puts "        Their best performance is " + "#{best_performance}"
  end

end
end
