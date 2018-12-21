#require "student_scraper_nba_teams/version"
#change back to environment when done
require_relative "../config/environment.rb"

class Scraper

  def self.scrape_teams(url)
    scraped_teams = []
    doc = Nokogiri::HTML(open(url))
    doc.css("#teams_active").css("tr.full_table").each do |team|
      name = team.css("th").text
      team_link = team.css("a").attribute("href").value
      year_started = team.css("td")[1].text
      historic_wins = team.css("td")[5].text
      historic_losses = team.css("td")[6].text
      historic_win_pct = team.css("td")[7].text
      playoff_app = team.css("td")[8].text
      div_champ = team.css("td")[9].text
      conf_champ = team.css("td")[10].text
      league_champ = team.css("td")[11].text
      team = {name:name, team_link:team_link, founded:year_started, historic_win_pct:historic_win_pct, playoff_app:playoff_app, div_champ:div_champ, conf_champ:conf_champ, league_champ:league_champ}
      scraped_teams.push(team)
    end
  scraped_teams
  end

  def self.scrape_season(team_link)
    season = Hash.new
    doc = Nokogiri::HTML(open(team_link))
    season[:wins] = doc.css("tbody").css("tr").first.css("td")[2].text
    season[:losses] = doc.css("tbody").css("tr").first.css("td")[3].text
    season[:win_pct] = doc.css("tbody").css("tr").first.css("td")[4].text
    season
  end
end
