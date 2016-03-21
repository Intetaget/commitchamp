require "httparty"
require "pry"
require "commitchamp/version"
require "rubygems"
require "commitchamp/helper"
# Probably you also want to add a class for talking to github.

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
      #puts "#{@result}"
                       puts """
      Would you like to sort the info by:
      A: Lines added?
      B: Lines deleted?
      C: total lines changed?
      Please choose A through C
      """
      sortingchoice = gets.chomp.upcase
      if sortingchoice == A
          result = result.sort_by{a}
      end
      if sortingchoice == B 
            result = result.sort_by{d}
      end
      if sortingchoice == C
          result = result.sort_by{c}
      end
      puts "#{result}"
      
      
      # Once all the contributions have been collected for a repo, offer to sort them by:
      # 1) lines added 2) lines deleted 3) total lines changed 4) commits made
      #bundle exec ruby lib/commitchamp.rb
    end
  end
end
app = Commitchamp::App.new
app.run




# received_events_url"=>"https://api.github.com/users/mawis/received_events", 
# "type"=>"User", 
# "site_admin"=>false}}, {"total"=>1, "weeks"=>[{"w"=>1297555200, "a"=>0, "d"=>0, "c"=>0},


# Normal Mode

# Get the list of contributions for the specified repo. Figure out how many lines the user added, deleted, and their commit count. You don't have to track contributions by week, just sum them to get a total.

# Once all the contributions have been collected for a repo, offer to sort them by:

# 1) lines added 2) lines deleted 3) total lines changed 4) commits made

# Then print the commit counts in a table as below:

# ## Contributions for 'owner/repo'

# Username      Additions     Deletions     Changes
# User 1            13534          2954        6249
# User 2             6940           913        1603
# ...
# Finally, ask the user if they'd like to sort the data differently, fetch another repo, or quit.




    # Your code goes here...  Defines values for login and serchparameters
    





# puts Representative.get_all_by_name('Donnelly').inspect
# # {"results"=>[{"district"=>"2", "last"=>"Donnelly", "first"=>"Joe", "state"=>"IN", "party"=>"D"}]}