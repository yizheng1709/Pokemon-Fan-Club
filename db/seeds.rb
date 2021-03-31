require 'nokogiri'
require 'open-uri'
require 'pry'

def get_page
    doc = Nokogiri::HTML(URI.open("https://www.pokemon.com/us/pokedex/"))
    doc2 = doc.css("li")
    array = []
    doc2.each do |li|
        if li.css("a").attribute("href")
            hash = {
                :profile => li.css("a").attribute("href").children.text
            }
            array << hash
        end 
    end
    array = array[37,934]
    array.collect {|pokemon| pokemon[:profile].prepend("https://www.pokemon.com")}
    array.each do |pokemon|
        page = Nokogiri::HTML(URI.open(pokemon[:profile]))
        name = page.css(".pokedex-pokemon-pagination-title").children.text.strip.split("#")[0].strip
        pokedex_number = page.css(".pokedex-pokemon-pagination-title").children.text.strip.split("#")[1]
        types = page.css(".dtm-type").children.children.children.text.strip.split(' ').uniq.join(", ")
        weaknesses = page.css(".dtm-weaknesses").children.children.text.strip.split(' ').uniq
        weaknesses.shift
        weaknesses = weaknesses.join(", ")
        abilities = page.css(".attribute-list").children.children.children.text.strip
        if abilities.include?('  ')
            abilities = abilities.split('  ').collect {|a| a.strip}.delete_if{|a| a.length < 2}.uniq
        end
        if abilities.include?("[")
            abilities = abilities.split(",").collect{|a| a.gsub!(/\W+/, ' ').strip}.join(", ")
        end
        description = page.css(".version-descriptions").text.strip.gsub("\n", "").split("  ").delete_if{|a| a==""}.join(" ")
        image = page.css(".active").attribute("src").children.text
        height = page.css(".column-7").children.text.strip.split("  ").collect{|a| a.gsub("\n", "")}.delete_if{|a| a==""}[1].split("")
        height.pop
        height = height.join("")
        weight = page.css(".column-7").children.text.strip.split("  ").collect{|a| a.gsub("\n", "")}.delete_if{|a| a==""}[3]
        pk = Pokemon.create(name: name, pokedex_number: pokedex_number, types: types, weaknesses: weaknesses, abilities: abilities, description: description, image: image, height: height, weight: weight)


    end 
end


def get_movie_page 
    link ="https://www.pokemon.com/us/pokemon-episodes/pokemon-movies/"
    doc = Nokogiri::HTML(URI.open(link))
    doc2 = doc.css("li")
    array = []
    doc2.each do |movie|
        if movie.css("a").attribute("href") 
            hash = {
                :link => movie.css("a").attribute("href").children.text
            }
            array << hash
        end
    end 
    
    array = array.collect {|m| m[:link] if m[:link].include?("movie")}
    array = array.delete_if {|m| m.nil?}
    array = array.collect {|m| m.prepend("https://www.pokemon.com/")}
    array.each do |link|
        doc1 = Nokogiri::HTML(URI.open(link))
        doc = doc1.css(".content-block").text.strip.split("  ").collect{|m| m.strip}.delete_if{|m| m.empty?}
        doc = doc.delete_if {|m| m.include?("Previous Movie") || m.include?("Next Movie") || m.strip.empty?}
        # binding.pry
        if doc[0].include?("Release Date")
            release_date = doc[0] 
            title = doc[1].split("\t").collect {|e| e.strip}.delete_if{|n| n.empty?}[0]
            content = doc[1].split("\t").collect {|e| e.strip}.delete_if{|n| n.empty?}[1]
            image = doc1.css(".episode-detail").css("img").attribute("src").text
            Movie.create(title: title, release_date: release_date, content: content, image: image)
            # binding.pry
        end 
    end 
end

def scraper 
    get_movie_page 
    get_page 
end

scraper 

