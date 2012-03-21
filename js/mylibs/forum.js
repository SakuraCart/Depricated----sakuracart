// remap jQuery to $
(function($){
$(document).ready(function() {


$('#tabs a').tabs();
$('#languages a').tabs();

$('#post .pagination a').live('click', function() {
	$('#post').slideUp('slow');
	$('#post').load(this.href);
	$('#post').slideDown('slow');
	return false;
});

$('#post').load('index.php?route=forum/thread/post&thread_id=<?php echo $this_thread_id; ?>');

$('#button-post').bind('click', function() {
	$.ajax({
		type: 'POST',
		url: 'index.php?route=forum/thread/write&thread_id=<?php echo $thread_id; ?>',
		dataType: 'json',
		data: 'title=' + encodeURIComponent($('input[name=\'title\']').val()) 
+ '&description=' + encodeURIComponent($('textarea[name=\'description\']').val()) 
+ '&language_id=' + encodeURIComponent($('hidden[name=\'language_id\']').val()) 
+ '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') 
+ '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-post').attr('disabled', true);
			$('#post-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-post').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data.error) {
				$('#post-title').after('<div class="warning">' + data.error + '</div>');
			}
			if (data.success) {
				$('#post-title').after('<div class="success">' + data.success + '</div>');
				$('input[name=\'title\']').val('');
				$('textarea[name=\'description\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});



});
})(this.jQuery);


function display(view) {
	if (view == 'list') {
		$('.grid').attr('class', 'list');

		$('.list > div').each(function(index, element) {
			html  = '<div class="right">';
			html += '<div class="readlist">' + $(element).find('.readlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
			html += '</div>';
			html += '<div class="left">';
			var image = $(element).find('.image').html();
				if (image != null) {
					html += '<div class="image">' + image + '</div>';
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
			var rating = $(element).find('.rating').html();
				if (rating != null) {
					html += '<div class="rating">' + rating + '</div>';
				}
			html += '<div class="readlist">' + $(element).find('.readlist').html() + '</div>';
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