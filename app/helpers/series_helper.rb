module SeriesHelper

	def filtered_comic_count(series)
		if current_page?(series_unredeemed_path(series))
			"You have #{pluralize @comics.count, 'unredeemed comic'} in your #{series.name} Collection."
		elsif current_page?(series_redeemed_path(series))
			"You have #{pluralize @comics.count, 'redeemed comic'} in your #{series.name} Collection."
		else 
			"You have #{pluralize @comics.count, 'comic'} in your #{series.name} Collection. #{pluralize @comics.unredeemed.count, 'is'} unredeemed!"
		end
	end

end