class WelcomeController < ApplicationController
  def index
		data = RestClient.get 'http://api.openweathermap.org/data/2.1/find/name?q=nyc&units=imperial'
		data = JSON.parse(data)
		@text = "The weather in NYC is seriously " + data["list"][0]["main"]["temp"].to_s + "° F"

		render "welcome/index"
	end
end
