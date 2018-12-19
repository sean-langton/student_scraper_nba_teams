require_relative "team_scraper.rb"
require_relative "team.rb"

class CLI
  BASE_PATH = "https://www.basketball-reference.com/teams/"


  def make_teams
    teams_array = Scraper.scrape_teams(BASE_PATH)
  end
end
