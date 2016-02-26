var ready = function() {

	// MOVE Familymember Options Modal into view.
	$('.node').on('click', function(){
		tree_id = gon.familymembers.id;
		member_id = $(this).attr('data');
		$('.options_modal').css( {top:event.pageY - 50, left: event.pageX - 170});
		$('#edit_item').attr('href', function() { return "/trees/" + tree_id + "/familymembers/" + member_id + "/edit"})
		$('#child_item').attr('href', function() { return "/trees/" + tree_id + "/familymembers/" + member_id + "/new_child"})
		$('#delete_item').attr('href', function() { return "/trees/" + tree_id + "/familymembers/" + member_id})
		$('#delete_item').attr('data', function() { return member_id})
	});

	// Close Options Modal with click of "X".
	$('.close_modal').on('click', function(){
		
		$('.options_modal').css( {top: 0, left: -400});

	});

	// CLOSE Familymember edit form.
	$(document).click(function(e){
		if (!$(e.target).closest('.edit_familymember').length) {
			$('.edit_familymember').remove();
	};	
});
	
};
