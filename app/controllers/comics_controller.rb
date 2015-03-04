class ComicsController < ApplicationController

	before_action :set_series
	before_action :require_signin
	before_action :require_admin, only: :destroy

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

	def destroy
		@comic = @series.comics.find(params[:id])
		@comic.destroy

		redirect_to @series, alert: "Comic successfully deleted"
	end

	def toggle_redeemed 
		@comic = @series.comics.find(params[:id])
		@comic.toggle!(:redeemed)
		render json: @comic
	end

private
	def comic_params
		params.require(:comic).permit(:title, :number, :redemption_code)
	end

	def set_series
		@series = Series.find(params[:series_id])
	end

end