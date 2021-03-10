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
        array.each do |pokemon|
            page = Nokogiri::HTML(open(pokemon[:profile]))
            # pk = Pokemon.create
            name = page.css(".pokedex-pokemon-pagination-title").children.text.strip.split(' ')[0]
            types = page.css(".dtm-type").children.children.children.text.strip.split(' ').uniq
            weaknesses = page.css(".dtm-weaknesses").children.children.text.strip.split(' ').uniq
            weaknesses.shift
            abilities = page.css(".attribute-list").children.children.children.text.strip
            if abilities.include?('  ')
                abilities = abilities.split('  ').collect {|a| a.strip}.delete_if{|a| a.length < 2}.uniq
            end


        end 
    end

end