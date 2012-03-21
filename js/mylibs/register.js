// remap jQuery to $
(function($){

$(document).ready(function() {

$('select[name=\'zone_id\']').load(url + country_id + zone_id);

$('.fancybox').fancybox({
	width: 560,
	height: 560,
	autoDimensions: false
});

});

})(this.jQuery);