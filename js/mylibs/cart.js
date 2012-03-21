// remap jQuery to $
(function($){
$(document).ready(function() {


$('.cart-module .cart-heading').bind('click', function() {
	if ($(this).hasClass('active')) {
		$(this).removeClass('active');
	} else {
		$(this).addClass('active');
	}
	$(this).parent().find('.cart-content').slideToggle('slow');
});


});
})(this.jQuery);