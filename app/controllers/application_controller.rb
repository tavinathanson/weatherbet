require 'rest-client'
require 'json'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
		data = RestClient.get 'http://api.openweathermap.org/data/2.1/find/name?q=nyc&units=imperial'
		data = JSON.parse(data)	

		render text: "The weather in NYC is " + data["list"][0]["main"]["temp"].to_s + "° F"
	end
end
