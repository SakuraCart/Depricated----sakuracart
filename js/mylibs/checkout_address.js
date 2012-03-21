// remap jQuery to $
(function($){
$(window).bind("load",function(){ 


$('#' + type + '-address select[name=\'zone_id\']').load(url + country_id);

$('#' + type + '-address input[name=\'' + type_address + '\']').live('change', function() {
	if (this.value == 'new') {
		$('#' + type + '-existing').hide();
		$('#' + type + '-new').show();
	} else {
		$('#' + type + '-existing').show();
		$('#' + type + '-new').hide();
	}
});


});
})(this.jQuery);