#require "student_scraper_nba_teams/version"
#change back to environment when done
require_relative "../config/environment.rb"

class Scraper

  def self.scrape_teams(url)
    scraped_teams = []
    begin
    doc = Nokogiri::HTML(open(url)) if open(url)
    rescue
      raise InternetError
    end
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
      team = {name:name, team_link:team_link, founded:year_started, historic_win_pct:historic_win_pct, historic_wins:historic_wins, historic_losses:historic_losses, playoff_app:playoff_app, div_champ:div_champ, conf_champ:conf_champ, league_champ:league_champ}
      scraped_teams.push(team)
    end
  scraped_teams
  end

  def self.scrape_seasons(team_link)
    seasons = []
    doc = Nokogiri::HTML(open(team_link))
    doc.css("tbody").css("tr").each do |season|
    year = season.css("th").text
    league = season.css("td")[0].text
    team_name = season.css("td")[1].text
    wins = season.css("td")[2].text
    losses = season.css("td")[3].text
    playoffs = season.css("td")[15].text
    season = {year:year, league:league, team_name:team_name, wins:wins, losses:losses, playoffs:playoffs}
    seasons.push(season)
  end
  seasons
  end
end

class InternetError < StandardError

end
