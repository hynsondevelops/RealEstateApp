class GalleriesController < ApplicationController
	def new
		@gallery = Gallery.new
	end

	def create
	  @gallery = Gallery.new

	  respond_to do |format|
	    if @gallery.save
	     
	      if params[:images]
	        #===== The magic is here ;)
	        params[:images].each { |image|
	          @gallery.pictures.create(image: image)
	        }
	      end

	      format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
	    else
	      format.html { render action: "new" }
	    end
	  end
	end

	def show
		@gallery = Gallery.find(params[:id])
	end
end
