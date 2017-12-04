//scrolltotop
$(function() {
	$("#totop").hide();
	$(function() {
		$(window).scroll(function() {
			if($(window).scrollTop() > 100) {
				$("#totop").show();
			} else {
				$("#totop").hide();
			}
		});
		$("#totop").click(function() {
			$('body,html').animate({ scrollTop: 0 }, 800);
			return false;
		});
	});
});