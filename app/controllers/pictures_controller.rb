class PicturesController < ApplicationController

	def new
		@picture = Picture.new
	end

	def create
		print(params[:picture][:image].path)
	  @picture = Picture.create( picture_params)
	end

	def show
		@picture = Picture.find(params[:id])
	end

	private

	# Use strong_parameters for attribute whitelisting
	# Be sure to update your create() and update() controller methods.

	def picture_params
	  params.require(:picture).permit(:image)
	end
end
