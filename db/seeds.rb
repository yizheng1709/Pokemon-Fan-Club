# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'nokogiri'
require 'open-uri'
require 'pry'
# require 'httparty'

def get_page
    doc = Nokogiri::HTML(URI.open("https://www.pokemon.com/us/pokedex/"))
    # binding.pry
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
    # binding.pry
    array.each do |pokemon|
        page = Nokogiri::HTML(URI.open(pokemon[:profile]))
        # binding.pry
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
        # binding.pry
        description = page.css(".version-descriptions").text.strip.gsub("\n", "").split("  ").delete_if{|a| a==""}.join(" ")
        image = page.css(".active").attribute("src").children.text
        # category = page.css(".column-7").children.text.strip.split("  ").collect{|a| a.gsub("\n", "")}.delete_if{|a| a==""}[6]
        height = page.css(".column-7").children.text.strip.split("  ").collect{|a| a.gsub("\n", "")}.delete_if{|a| a==""}[1].split("")
        height.pop
        height = height.join("")
        weight = page.css(".column-7").children.text.strip.split("  ").collect{|a| a.gsub("\n", "")}.delete_if{|a| a==""}[3]
        # binding.pry
        pk = Pokemon.create(name: name, pokedex_number: pokedex_number, types: types, weaknesses: weaknesses, abilities: abilities, description: description, image: image, height: height, weight: weight)


    end 
end

get_page
# Scraper.new.get_page
