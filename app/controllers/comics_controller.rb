class ComicsController < ApplicationController

	before_action :set_series
	
	def new
		@comic = @series.comics.new
	end

	def create
		@comic = @series.comics.new(comic_params)

		if @series.save
			redirect_to @series, notice: "Comic Successfully added!"
		else 
			render :new
		end
	end

	def edit
	end

	def update
	end

	def destroy
		@comic = @series.comics.find(params[:id])
		@comic.destroy

		redirect_to @series, alert: "Comic successfully deleted"
	end

private
	def comic_params
		params.require(:comic).permit(:title, :number, :redemption_code)
	end

	def set_series
		@series = Series.find(params[:series_id])
	end

end
