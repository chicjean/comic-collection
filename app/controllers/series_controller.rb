class SeriesController < ApplicationController

	def index
		@series = Series.alpha_sort
	end

	def show
		@series = Series.find(params[:id])
		@comics = @series.comics
	end

	def new
		@series = Series.new
	end

	def create 
		@series = Series.new(series_params)
		if @series.save
      redirect_to @series, notice: "Series successfully created!"
    else
      render :new
    end
	end

	def edit
		@series = Series.find(params[:id])
	end

	def update
		@series = Series.find(params[:id])
		if @series.update(series_params)
			redirect_to @series, notice: "Series successfully updated!"
		else
			render :edit
		end
	end 

	def destroy 
		@series = Series.find(params[:id])
		@series.destroy
		redirect_to series_index_path, alert: "Series deleted!"
	end

private 
	def series_params
		params.require(:series).permit(:name)
	end

end
