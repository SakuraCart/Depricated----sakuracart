// remap jQuery to $
(function($){
$(document).ready(function() {


$('#button-voucher').bind('click', function() {
	$.ajax({
		type: 'POST',
		url: 'index.php?route=total/voucher/calculate',
		data: $('#voucher :input'),
		dataType: 'json',
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-voucher').attr('disabled', true);
			$('#button-voucher').after('<span class="wait">&nbsp;<img src="' + template_image + '/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('#button-voucher').attr('disabled', false);
			$('.wait').remove();
		},
		success: function(json) {
			if (json['error']) {
				$('.cart-content #voucher').before('<div class="warning">' + json['error'] + '<img src="' + template_image + '/close.png" alt="" class="close" /></div>');
			}
			if (json['redirect']) {
				location = json['redirect'];
			}
		}
	});
});


});
})(this.jQuery);