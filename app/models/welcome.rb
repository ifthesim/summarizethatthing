class Welcome 

	def self.storyline(query)
		Unirest.post("https://imdb.p.mashape.com/movie",
		  	headers:{
			    "X-Mashape-Key" => "cPJySWZolCmshX38jPrzJeawUuFLp1ML0DpjsnBhLd1ZrMjwBT",
			    "Content-Type" => "application/x-www-form-urlencoded",
			    "Accept" => "application/json"
			  	},
		  	parameters:{
			    "searchTerm" => "#{query}"
			  	}).body["result"]["storyline"]
	end

	def self.star(query)
		random = rand(5).to_i
		name = Unirest.post("https://imdb.p.mashape.com/movie",
		  	headers:{
			    "X-Mashape-Key" => "cPJySWZolCmshX38jPrzJeawUuFLp1ML0DpjsnBhLd1ZrMjwBT",
			    "Content-Type" => "application/x-www-form-urlencoded",
			    "Accept" => "application/json"
			  	},
		  	parameters:{
			    "searchTerm" => "#{query}"
			  	}).body["result"]["cast"][random]["actor"]

	end

	def self.summarygif(query)
		random = rand(500).to_i
		array = query.split
		plus_query = array.join("+")
		HTTParty.get("http://api.giphy.com/v1/gifs/search?q=#{plus_query}&api_key=dc6zaTOxFJmzC&limit=500").parsed_response["data"][random]["images"]["original"]["url"]
	end

	def self.poster(query)
		Unirest.post("https://imdb.p.mashape.com/movie",
		  	headers:{
			    "X-Mashape-Key" => "cPJySWZolCmshX38jPrzJeawUuFLp1ML0DpjsnBhLd1ZrMjwBT",
			    "Content-Type" => "application/x-www-form-urlencoded",
			    "Accept" => "application/json"
			  	},
		  	parameters:{
			    "searchTerm" => "#{query}"
			  	}).body["result"]["poster"]
	end

end