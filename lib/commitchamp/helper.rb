require "httparty"
require "pry"

module Commitchamp
	class Helper
		include HTTParty
		base_uri "https://api.github.com"

    	def initialize (auth_token)
    	      @auth = {
          "Authorization" => "auth_token",
          "User-Agent"    => "HTTParty"}
    	end
     

    	def getrepofunction (author, repo)
    		Helper.get("/repos/#{author}/#{repo}/stats/contributors", :header=>@auth)
    	end
    end 
end




# Probably you also want to add a class for talking to github.