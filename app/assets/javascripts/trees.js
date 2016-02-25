$(document).ready(function (){

	$('.node').on('click', function(){
		tree_id = gon.familymembers.id;
		member_id = $(this).attr('data');
		$('.options_modal').css( {top:event.pageY - 50, left: event.pageX - 170});
		$('#edit_item').attr('href', function() { return "/trees/" + tree_id + "/familymembers/" + member_id + "/edit"})
		$('#delete_item').attr('href', function() { return "/trees/" + tree_id + "/familymembers/" + member_id})
	});

	$('.close_modal').on('click', function(){
		
		$('.options_modal').css( {top: 0, left: -400});

	});
	
	$('.close_edit_form').on('click', function (){
		$('.edit_familymember').remove();
	});
	
});

