$(function(){
	$(".hover_to_x").hover(
		function(){
			$(this).addClass("back-red");
		},
		function(){
			$(this).removeClass("back-red");
		}
	);
	$(".hover_to_x").click(function(){
		$(".hover_to_x").html("-");
		$(".hover_to_x").removeClass("selected_x");
		$(this).html('<span class="red">X</span>');
		$(this).addClass("selected_x");
	});
});