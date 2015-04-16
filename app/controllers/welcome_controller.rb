class WelcomeController < ApplicationController

	def index
		# secret_key = ENV['secret_key']

		if params[:query]
			random = rand(500).to_i
			query = params[:query]

			@storyline = Unirest.post("https://imdb.p.mashape.com/movie",
	  	headers:{
		    "X-Mashape-Key" => "cPJySWZolCmshX38jPrzJeawUuFLp1ML0DpjsnBhLd1ZrMjwBT",
		    "Content-Type" => "application/x-www-form-urlencoded",
		    "Accept" => "application/json"
		  	},
	  	parameters:{
		    "searchTerm" => "#{query}"
		  	}).body["result"]["storyline"]

			array = query.split
			plus_query = array.join("+")

			@gif = HTTParty.get("http://api.giphy.com/v1/gifs/search?q=#{plus_query}&api_key=dc6zaTOxFJmzC&limit=500").parsed_response["data"][random]["images"]["original"]["url"]
		  end
	end

end