require_relative "film"
require "uri"
require "net/http"
require "nokogiri"

class FilmCollection
  KINOPOISK_FILE_PATH = "#{__dir__}/../data/kinopoisk.xml"

  def self.from_kinopoisk!
    uri = URI.parse("https://www.kinopoisk.ru/lists/movies/top250/")
    response = Net::HTTP.get_response(uri)
    doc = Nokogiri::HTML(response.body)

    File.write(KINOPOISK_FILE_PATH, doc) unless File.exist?(KINOPOISK_FILE_PATH)

    doc = Nokogiri::XML(File.read(KINOPOISK_FILE_PATH)) unless response.code == "200" || !response.body.empty?

    films_filmmakers =
      doc.css("span.desktop-list-main-info_truncatedText__IMQRP").text.split("Режиссёр: ").drop(1).map do |filmmaker|
        filmmaker.gsub(/В ролях:.+/, "")
      end

    films_years =
      doc.css("span.desktop-list-main-info_secondaryText__M_aus").text.scan(/\d{4}/)

    films_titles =
      doc.css("span.styles_mainTitle__IFQyZ").map(&:text)

    films = []
    films_filmmakers.each_index do |i|
      films.push(Film.new(title: films_titles[i], filmmaker: films_filmmakers[i], year: films_years[i]))
    end
    new(films)
  end

  def initialize(films)
    @films = films
  end

  def filmmakers
    @films.map(&:filmmaker).uniq
  end

  def filmmaker_films(filmmaker)
    @films.select { |film| film.filmmaker == filmmaker }
  end
end
