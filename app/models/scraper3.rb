require 'nokogiri'
require 'open-uri'
require 'pry'

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
            a = Movie.new(title: title, release_date: release_date, content: content, image: image)
            binding.pry
        end 
    end 


end

get_movie_page