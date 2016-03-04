require "httparty"
require "pry"
require ""
require "commitchamp/version"
require "rubygems"
# Probably you also want to add a class for talking to github.

module Commitchamp
  class App
    def initialize
    	      @auth = {
          "Authorization" => "token #{get_token}",
          "User-Agent"    => "HTTParty"
      }
    end

#goto page https://developer.github.com/v3/repos/statistics/#get-contributors-list-with-additions-deletions-and-commit-counts
#GET /repos/:owner/:repo/stats/contributors
#https://developer.github.com/v3/#authentication
#http://www.theodinproject.com/ruby-on-rails/working-with-external-apis


    def loginginandinfospec
      # Your code goes here...
      puts "Please enter your github authorization code"
      authcode=gets.chomp
      puts "Please enter the users info"
      author=gets.chomp
      puts "please enter the repo"
      repo=gets.chomp
    end
  end
end

app = Commitchamp::App.new
app.run




# class Representative
#   format :json
  
#   def self.find_by_zip(zip)
#     get('http://whoismyrepresentative.com/whoismyrep.php', :query => {:zip => zip, :output => 'json'})
#   end
  
#   def self.get_all_by_name(last_name)
#     get('http://whoismyrepresentative.com/getall_reps_byname.php', :query => {:lastname => last_name, :output => 'json'})
#   end
# end

# puts Representative.get_all_by_name('Donnelly').inspect
# # {"results"=>[{"district"=>"2", "last"=>"Donnelly", "first"=>"Joe", "state"=>"IN", "party"=>"D"}]}