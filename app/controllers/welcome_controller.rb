class WelcomeController < ApplicationController
  def index
		@nyc_text = get_weather_text("nyc,ny", "New York City")
		@sf_text = get_weather_text("sf,ca", "San Francisco")

		# The server-side toggle text defaults to NYC
		if !session["toggle"]
			session["toggle"] = "nyc"
		end

		@server_text = get_server_text(session["toggle"])
		render "welcome/index"
	end

	def nyc
		render text: get_weather_text("nyc,ny", "New York City")
	end

	def sf
		render text: get_weather_text("sf,ca", "San Francisco")
	end

	def toggle
		if session["toggle"] == "sf"
			session["toggle"] = "nyc"
		else
			session["toggle"] = "sf"
		end

		@server_text = get_server_text(session["toggle"])
		redirect_to "/"
	end		

	def get_server_text(toggle)
		if toggle == "nyc"
			return get_weather_text("nyc,ny", "New York City")
		else
			return get_weather_text("sf,ca", "San Francisco")
		end
	end

	def get_weather_text(city_name_query, city_name_print)
		# TODO: Better error handling
		
		# FIXME: API is broken; need to use a new one
		# data = RestClient.get "http://api.openweathermap.org/data/2.1/find/name?q=" + city_name_query + "&units=imperial"
		# data_parsed = JSON.parse(data)
		# return "The weather in " + city_name_print + " is seriously " + data_parsed["list"][0]["main"]["temp"].to_s + "° F"
		return "The weather in " + city_name_print + " is seriously " + temp_get_weather_text(city_name_query) + "° F"
	end

	def temp_get_weather_text(city_name_query)
		if city_name_query == "nyc,ny"
			return "72.21"
		else
			return "56.76"
		end
	end
end
