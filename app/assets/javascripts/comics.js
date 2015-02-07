// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
	$('.redeem-link').click(function(event) {
		event.preventDefaults; 
		var comic_id = $(this).attr("id"); 
		var series_id = $(this).attr("series_id");

		$.ajax({
			url: "/series/" + series_id + "/comics/" + comic_id + "/toggle_redeemed", 
			dataType: "json", 
			type: "POST", 
			context: this
		}).done(function(data, textStatus, xhr) {
			
			if(data.redeemed == true) {
				$(this).html("Unredeem");
				$(this).parents(".comic-row").children(".redemption-code").addClass('redeemed');
			} else {
				$(this).html("Redeem");
				$(this).parents(".comic-row").children(".redemption-code").removeClass('redeemed');
			}
		})
	})
});

