// remap jQuery to $
(function($){

$(document).ready(function() {


$('#content input[name=\'filter_name\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	var filter_name = $('#content input[name=\'filter_name\']').attr('value');
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	var filter_category_id = $('#content select[name=\'filter_category_id\']').attr('value');
	if (filter_category_id > 0) {
		url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
	}
	var filter_sub_category = $('#content input[name=\'filter_sub_category\']:checked').attr('value');
	if (filter_sub_category) {
		url += '&filter_sub_category=true';
	}
	var filter_description = $('#content input[name=\'filter_description\']:checked').attr('value');
	if (filter_description) {
		url += '&filter_description=true';
	}
	location = url;
});


});

})(this.jQuery);