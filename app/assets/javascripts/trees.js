var ready = function() {

	// MOVE Familymember Options Modal into view.
	$('.node').on('click', function(){
		var chart = $('.main_svg').data('chart');
		var tree_id = chart.tree_id;
		var member_id = $(this).attr('data');
		var coordLeft = $(this).offset().left;
		var coordTop = $(this).offset().top;
		$('.options_modal').css( {top: coordTop - 160, left: coordLeft - 55});
		$('.options_modal').animate({opacity: 1.0}, 1000);
		$('#view_item').attr('href', function() { return "/trees/" + tree_id + "/familymembers/" + member_id})
		
		$('#edit_item').attr('href', function() { return "/trees/" + tree_id + "/familymembers/" + member_id + "/edit"})
		
		$('#child_item').attr('href', function() { return "/trees/" + tree_id + "/familymembers/" + member_id + "/new_child"})
		
		$('#parent_item').attr('href', function() { return "/trees/" + tree_id + "/familymembers/" + member_id + "/new_parent"})

		$('#partner_item').attr('href', function() { return "/trees/" + tree_id + "/familymembers/" + member_id + "/new_partner"})
		
		$('#delete_item').attr('href', function() { return "/trees/" + tree_id + "/familymembers/" + member_id})
		$('#delete_item').attr('data', function() { return member_id})
	});

	// Close Options Modal with click of "X".
	$('.close_modal').on('click', function(){
		$('.options_modal').animate({opacity: 0}, 500);
		$('.options_modal').animate( {top: 0, left: -1200}, 50);

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
