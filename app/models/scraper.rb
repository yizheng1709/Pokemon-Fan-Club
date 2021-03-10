require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
    def get_page
        doc = Nokogiri::HTML(open("https://www.pokemon.com/us/pokedex/"))
        doc2 = doc.css("li")
        array = []
        doc2.each do |li|
            # binding.pry
            if li.css("a").attribute("href")
                hash = {
                    :profile => li.css("a").attribute("href").children.text
                }
                array << hash
            end 
            # binding.pry
        end
        array = array[37,934]
        array.collect {|pokemon| pokemon[:profile].prepend("https://www.pokemon.com")}

    end

end