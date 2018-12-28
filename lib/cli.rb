require_relative "scraper.rb"
require_relative "team.rb"
require_relative "season.rb"

class CLI

  BASE_PATH = "https://www.basketball-reference.com/teams/"

  def run
    make_teams
    add_seasons
    menu
  end

  def make_teams
    teams_array = Scraper.scrape_teams(BASE_PATH)
    Team.create_from_collection(teams_array)
  end

  def add_seasons
    Team.all.each do |team|
      seasons_array = Scraper.scrape_seasons(BASE_PATH + team.team_link.gsub("/teams/", ""))
      team = team
      Season.create_from_collection(seasons_array, team)
    end
  end

  def menu
    puts "Welcome to the Main Menu. What Can I Do For You?".colorize(:color => :black, :background => :white)
    puts "1. List All Teams"
    puts "2. Historical Summary"
    puts "3. Search By Team Name"
    puts "4. Search By Season"
    puts "Or type " + "EXIT ".colorize(:red) + "to Exit."
    input = gets.strip
      if input == "1" then list_teams
      elsif input == "2" then historical_summary
      elsif input == "3" then search_team
      elsif input == "4" then search_season
      elsif input == "EXIT" then exit!
      end
    menu
  end

  def list_teams
    Team.all.each do |team|
      puts "#{team.name}".colorize(:light_green)
    end
  end

  def historical_summary
    Team.all.each do |team|
      best_performance =
        if team.league_champ.to_i > 0 then "League Champions (#{team.league_champ} times)"
        elsif team.conf_champ.to_i > 0 then "Conference Champions (#{team.conf_champ} times)"
        elsif team.div_champ.to_i > 0 then "Divison Champions (#{team.div_champ} times)"
        else "making (#{team.playoff_app} playoff appearences)"
        end
      puts "#{team.name}".colorize(:cyan)
      puts "Founded In: " + "#{team.founded}".colorize(:green)
      puts "Best Performance: " + "#{best_performance}".colorize(:green)
      puts "Historical Performance: " + "#{team.historic_wins} - #{team.historic_losses} (#{team.historic_win_pct})".colorize(:green)
      puts "-----------------------".colorize(:blue)
    end
  end

  def search_team
    puts "Please Input Full Team Name" + " E.G. New York Knicks".colorize(light_blue)
    input = gets.strip
    if Team.find(input) == nil then puts "Sorry, That Was Not A Value Team Team"
    else team = Team.find(input)
      best_performance =
        if team.league_champ.to_i > 0 then "League Champions (#{team.league_champ} times)"
        elsif team.conf_champ.to_i > 0 then "Conference Champions (#{team.conf_champ} times)"
        elsif team.div_champ.to_i > 0 then "Divison Champions (#{team.div_champ} times)"
        else "making (#{team.playoff_app} playoff appearences)"
        end
      puts "#{team.name}".colorize(:cyan)
      puts "Founded In: " + "#{team.founded}".colorize(:green)
      puts "Best Performance: " + "#{best_performance}".colorize(:green)
      puts "Historical Performance: " + "#{team.historic_wins} - #{team.historic_losses} (#{team.historic_win_pct})".colorize(:green)
      puts "-----------------------".colorize(:blue)
      end
    end

    def search_season
      puts "Please Input 7 Character Season" + " E.G. 2001-02".colorize(light_blue)
      input = gets.strip
      if Season.find(input) == nil then puts "Sorry, That Was Not A Value Team Team"
      else sel_seasons_array = Season.find(input)
        sel_seasons_array.each {|season|
        puts "#{season.team}   #{season.wins}-#{season.losses}   #{season.playoffs}"
        }
      end
    end


end
