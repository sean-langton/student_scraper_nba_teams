#require "student_scraper_nba_teams/version"
#change back to environment when done
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_teams
    scraped_teams = []
    doc = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/"))
    doc.css(".full_table").each do |team|
      name = team.css("th").text
      team_link = team.css("a").attribute("href").value
      year_started = team.css("td")[1].text
      wins = team.css("td")[5].text
      losses = team.css("td")[6].text
      playoffs = team.css("td")[8].text
      div_champ = team.css("td")[9].text
      conf_champ = team.css("td")[10].text
      league_champ = team.css("td")[11].text
      team = {name:name, link:team_link, founded:year_started, wins:wins, losses:losses, playoff_app:playoffs, div_champ:div_champ, conf_champ:conf_champ, league_champ:league_champ}
      scraped_teams.push(team)
    end
    scraped_teams
  end

  def self.scrape_players

  end

end

binding.pry
