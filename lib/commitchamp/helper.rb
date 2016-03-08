require "httparty"
require "pry"

Module Commitchamp
	class helper
		def get_logincreds
		  puts "Please enter your github authorization code"
	      get_token = STDIN.gets.chomp
	      puts "Please enter the users info"
	      author=STDIN.gets.chomp
	      puts "please enter the repo"
	      repo=STDIN.gets.chomp
	    end
	end





# Probably you also want to add a class for talking to github.