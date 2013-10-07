class WelcomeController < ApplicationController
  def index
		@nyc_text = get_weather_text("nyc,ny", "New York City")
		@sf_text = get_weather_text("sf,ca", "San Francisco")
		render "welcome/index"
	end

	def nyc
		render text: get_weather_text("nyc,ny", "New York City")
	end

	def sf
		render text: get_weather_text("sf,ca", "San Francisco")
	end		

	def get_weather_text(city_name_query, city_name_print)
		# TODO: Better error handling
		data = RestClient.get "http://api.openweathermap.org/data/2.1/find/name?q=" + city_name_query + "&units=imperial"
		data_parsed = JSON.parse(data)

		return "The weather in " + city_name_print + " is seriously " + data_parsed["list"][0]["main"]["temp"].to_s + "° F"
	end
end
