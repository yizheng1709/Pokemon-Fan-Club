require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
    def get_page
        doc = Nokogiri::HTML(open("https://www.pokemon.com/us/pokedex/"))
        doc2 = doc.css("li")

    end

end