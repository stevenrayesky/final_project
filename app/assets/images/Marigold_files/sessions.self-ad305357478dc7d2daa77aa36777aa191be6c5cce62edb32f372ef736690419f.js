$(document).on("ready", function(){

	$(".login_span").on("click", function(){
		$(".existing_user").fadeToggle('fast');
	});

	$(".signup_span").on("click", function(){
		$(".new_user").fadeToggle('fast');
	});
});

