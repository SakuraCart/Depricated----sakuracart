// remap jQuery to $
(function($){
$(document).ready(function() {


$('#button-coupon').bind('click', function() {
	$.ajax({
		type: 'POST',
		url: 'index.php?route=total/coupon/calculate',
		data: $('#coupon :input'),
		dataType: 'json',
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-coupon').attr('disabled', true);
			$('#button-coupon').after('<span class="wait">&nbsp;<img src="' + template_image + '/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('#button-coupon').attr('disabled', false);
			$('.wait').remove();
		},
		success: function(json) {
			if (json['error']) {
				$('.cart-content #coupon').before('<div class="warning">' + json['error'] + '<img src="' + template_image + '/close.png" alt="" class="close" /></div>');
			}
			if (json['redirect']) {
				location = json['redirect'];
			}
		}
	});
});


});
})(this.jQuery);