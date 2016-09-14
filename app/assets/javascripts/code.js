$(document).ready(function(){
	
	fadeOutSharedMessage();
	$(".menu_container").click(function(){
		$(this).children("ul").toggle();
		/*$('.glyphicon', this).children("ul")
      .toggleClass('glyphicon-chevron-right')
      .toggleClass('glyphicon-chevron-down');*/
	});
});
function fadeOutSharedMessage()
{
	$("#shared_msg").delay(3000).fadeOut(1000);
}