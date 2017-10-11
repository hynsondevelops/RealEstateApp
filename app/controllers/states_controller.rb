class StatesController < ApplicationController
	def index
		@states = State.all
	end

	def show
		@state = State.find(params[:id])
		@cities = @state.cities
		@zipcodes = @state.zipcodes
	end
end
