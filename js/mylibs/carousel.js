// remap jQuery to $
(function($){

$(document).ready(function() {
	$('#carousel' + module + ' ul').jcarousel({
		vertical: + vertical,
		visible: + visible,
		scroll: + scroll
	});
});

})(this.jQuery);