// remap jQuery to $
(function($){
$(window).bind("load",function(){ 


$('#button-reward').bind('click', function() {
	$.ajax({
		type: 'POST',
		url: 'index.php?route=total/reward/calculate',
		data: $('#reward :input'),
		dataType: 'json',
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-reward').attr('disabled', true);
			$('#button-reward').after('<span class="wait">&nbsp;<img src="' + template_image + '/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('#button-reward').attr('disabled', false);
			$('.wait').remove();
		},
		success: function(json) {
			if (json['error']) {
				$('#basket').before('<div class="warning">' + json['error'] + '<img src="' + template_image + '/close.png" alt="" class="close" /></div>');
			}
			if (json['redirect']) {
				location = json['redirect'];
			}
		}
	});
});


});
})(this.jQuery);