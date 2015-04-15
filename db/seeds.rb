# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'rubygems'
# require 'nokogiri'
# require 'open-uri'

def nokogiri_app_search   
 
  page = Nokogiri::HTML(open("db/sourcecodeapp.html"))

  app_list = page.css("table.tableWithFloatingHeader").css('a').collect {|node| node.text }

  app_list.each do |app|
  	MobileApp.find_or_create_by(:name => "#{app}")
  end


  puts app_list
  puts app_list.class
  puts app_list.count

end

nokogiri_app_search