require 'nokogiri'
require 'open-uri'
require 'pry'

def episodes_scraper
    doc = Nokogiri::HTML(URI.open("https://www.pokemon.com/us/pokemon-episodes/pokemon-tv-seasons"))
    doc2 = doc.css(".column-12")
    array = []
    doc2.each do |box|
        if box.css(".match")
            i = box.css("li").children.css("a").attribute("href").children.text.split("season-").last.delete_suffix('/')
            # binding.pry
            hash = {
                "season #{i}" => box.css("a").attribute("href").children.text.prepend("https://www.pokemon.com")
                    }
            array << hash 
                
                # binding.pry
             
        end
    end
    binding.pry
    # doc = Nokogiri::HTML(URI.open("https://www.pokemon.com/us/pokemon-episodes/pokemon-tv-seasons/season-1/"))
    # # binding.pry
    # doc2 = doc.css(".match-height")
    # array = []
    # doc2.each do |li|
    #     if li.css("a").attribute("href")
    #         hash = {
    #             :video_link => li.css("a").attribute("href").children.text.prepend("https://www.pokemon.com")
    #         }
    #         array << hash
    #         binding.pry
    #     end
    # end
    # binding.pry
end

episodes_scraper