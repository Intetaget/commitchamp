require "httparty"
require "pry"
#require "version"
require "rubygems"
#require "helper"
# Probably you also want to add a class for talking to github.

module Commitchamp
  class App
  	 
  	include HTTParty
    base_uri "https://api.github.com"

    def initialize
    	      @auth = {
          "Authorization" => "get_logincreds",
          "User-Agent"    => "HTTParty"
      }
    end



    def run
    # Your code goes here...  Defines values for login and serchparameters
    end
  end
end
#goto page https://developer.github.com/v3/repos/statistics/#get-contributors-list-with-additions-deletions-and-commit-counts
#GET /repos/:owner/:repo/stats/contributors
#https://developer.github.com/v3/#authentication
#http://www.theodinproject.com/ruby-on-rails/working-with-external-apis
#https://www.codementor.io/ruby-on-rails/tutorial/how-to-build-a-robust-json-api-client-with-ruby-httparty


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