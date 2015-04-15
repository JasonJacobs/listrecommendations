$( document ).ready(function() {
	var counter = 0;
	for(var i=1;i<10;i++){
	  $('#'+i).hide();
	}
	$( "#add_recommendation_form" ).click(function(e) {
			e.stopPropagation;
			e.preventDefault;
			counter++
			$('#'+counter).show();
	});
	
});