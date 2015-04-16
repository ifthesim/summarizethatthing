class WelcomeController < ApplicationController

	def index
		# secret_key = ENV['secret_key']

		if params[:query]
			query = params[:query]

			@storyline = Welcome.storyline(query)

			@star = Welcome.star(query)

			@summarygif = Welcome.summarygif(query)

			@poster = Welcome.poster(query)
		  end
	end

end