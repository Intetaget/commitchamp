require "httparty"
require "pry"
require "commitchamp/version"
require "rubygems"
require "commitchamp/helper"


module Commitchamp
  class App
  	include HTTParty
    base_uri "https://api.github.com"

    def initialize
    	      @auth = {
          "Authorization" => "auth_token",
          "User-Agent"    => "HTTParty"
      }
    end
    
    

    def run 
      puts "enter your token"
      token = STDIN.gets.chomp
      @getapi = Helper.new(token)
      puts "please enter the desired User-Agent"
      author = STDIN.gets.chomp
      puts "please enter the desired repo"
      repo = STDIN.gets.chomp
      result = @getapi.getrepofunction(author, repo)
      #filtering result did not work.  Need to put it in array and push to it.
      show = []
      result.map do |result|
        additions = 0
        deletes = 0
        commits = 0
        #binding.pry
        #the below will add up the induvidual numbers for "a", "d", "c"
        weeks = result["weeks"]
          weeks.map do |week|
            additions += week ["a"]
            deletes += week ["d"]
            commits += week ["c"]
            end
            ###binding.pry   https://blog.udemy.com/ruby-inject/
            # https://gistpages.com/posts/ruby_arrays_insert_append_length_index_remove

            #the below gives buckets for the info to fall into
            # ex. on https://developer.github.com/v3/repos/statistics/#contributors the login for author is "octocat"
            # the additions etc. are translated to the api by lines 39-44.
            show.push ({login: result["author"]["login"], additions: additions, deletions: deletes, commits: commits})  
            binding.pry
            #puts show
      end

      puts """
      # Would you like to sort the info by:
      # A: Lines added?
      # B: Lines deleted?
      # C: total github commits?
      # Please choose A through C
      # """
      sortingchoice = gets.chomp.upcase
      #http://stackoverflow.com/questions/5483889/how-to-sort-an-array-of-hashes-in-ruby
      if sortingchoice == "A"
         show.sort_by { |x| x['additions'] }
      end
      if sortingchoice == "B" 
            show.sort_by { |x| x['deletions'] }
      end
        if sortingchoice == "C"
          show.sort_by { |x| x['commits'] }
      end
      show = show.reverse
      puts "          Username             Additions          Deletions        Changes"
      puts show

      puts"""
      Would you like to review another repo?

      if so, please press y, else hit enter
      or close the window

      """
      restart_option = gets.chomp.upcase
        if restart_option == "Y"
          app = Commitchamp::App.new
          app.run
        else exit  
        end
    end
  end
end
app = Commitchamp::App.new
app.run




# received_events_url"=>"https://api.github.com/users/mawis/received_events", 
# "type"=>"User", 
# "site_admin"=>false}}, {"total"=>1, "weeks"=>[{"w"=>1297555200, "a"=>0, "d"=>0, "c"=>0},







    # Your code goes here...  Defines values for login and serchparameters
    





