// remap jQuery to $
(function($){
$(document).ready(function() {

var banner = function() {
	$('#banner' + module).cycle({
		before: function(current, next) {
			$(next).parent().height($(next).outerHeight());
		}
	});
}

setTimeout(banner, 200);

});
})(this.jQuery);