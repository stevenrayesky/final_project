var ready = function() {

	// MOVE Familymember Options Modal into view.
	$('.node').on('click', function(){
		tree_id = gon.familymembers.id;
		member_id = $(this).attr('data');
		$('.options_modal').css( {top:event.pageY - 50, left: event.pageX - 170});
		$('#edit_item').attr('href', function() { return "/trees/" + tree_id + "/familymembers/" + member_id + "/edit"})
		
		$('#child_item').attr('href', function() { return "/trees/" + tree_id + "/familymembers/" + member_id + "/new_child"})
		
		$('#parent_item').attr('href', function() { return "/trees/" + tree_id + "/familymembers/" + member_id + "/new_parent"})

		$('#partner_item').attr('href', function() { return "/trees/" + tree_id + "/familymembers/" + member_id + "/new_partner"})
		
		$('#delete_item').attr('href', function() { return "/trees/" + tree_id + "/familymembers/" + member_id})
		$('#delete_item').attr('data', function() { return member_id})
	});

	// Close Options Modal with click of "X".
	$('.close_modal').on('click', function(){
		
		$('.options_modal').css( {top: 0, left: -400});

	});

	
	$(document).click(function(e){
		// CLOSE Familymember edit form.
		if (!$(e.target).closest('.edit_familymember').length) {
			$('.edit_familymember').remove();
	};	
		// CLOSE Familymember new (parent, child, partner) form.
		if (!$(e.target).closest('.new_familymember').length) {
			$('.new_familymember').remove();
	};	
});
	// Close new form when the edit form is opened.
	$('#edit_item').on('click', function(){
		$('.edit_familymember').remove();
		$('.new_familymember').remove();
	});
	// Close edit form when the new form is opened.
	$('#child_item').on('click', function(){
		$('.new_familymember').remove();
		$('.edit_familymember').remove();
	});

	$('#parent_item').on('click', function(){
		$('.new_familymember').remove();
		$('.edit_familymember').remove();
	});

	$('#partner_item').on('click', function(){
		$('.new_familymember').remove();
		$('.edit_familymember').remove();
	});
	
};
