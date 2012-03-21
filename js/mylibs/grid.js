function display(view) {
	if (view == 'list') {
		$('.grid').attr('class', 'list');

		$('.list > div').each(function(index, element) {
			html  = '<div class="grid_right">';
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
			html += '</div>';
			html += '<div class="grid_left">';
			var image = $(element).find('.image').html();
				if (image != null) {
					html += '<div class="image">' + image + '</div>';
				}
			var price = $(element).find('.price').html();
				if (price != null) {
					html += '<div class="price">' + price + '</div>';
				}
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			var rating = $(element).find('.rating').html();
				if (rating != null) {
					html += '<div class="rating">' + rating + '</div>';
				}
			html += '</div>';
			$(element).html(html);
		});

		$('.display').html(text_display + '&nbsp;' + text_list + '&nbsp;/&nbsp;<a onclick="display(\'grid\');">' + text_grid + '</a>');
		$.cookie('display', 'list');

	} else {

		$('.list').attr('class', 'grid');

		$('.grid > div').each(function(index, element) {
			html = '';
			var image = $(element).find('.image').html();
				if (image != null) {
					html += '<div class="image">' + image + '</div>';
				}
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			var price = $(element).find('.price').html();
				if (price != null) {
					html += '<div class="price">' + price + '</div>';
				}
			var rating = $(element).find('.rating').html();
				if (rating != null) {
					html += '<div class="rating">' + rating + '</div>';
				}
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
			$(element).html(html);
		});

		$('.display').html(text_display + '&nbsp;' + '<a onclick="display(\'list\');">' + text_list + '</a>&nbsp;/&nbsp;' + text_grid);
		$.cookie('display', 'grid');

	}
}

view = $.cookie('display');

if (view) {
	display(view);
} else {
	display('list');
}