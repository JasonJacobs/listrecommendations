$(document).ready ->
	$('#add_recommendation_form').on "click", ->
		html = $.get "/recommendations/new.js"
		$('#new_recommendations').append(html)