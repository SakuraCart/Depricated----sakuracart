<?php echo $header; ?><?php echo $content_left; ?><?php echo $content_right; ?>
<div id="content"><?php echo $content_center; ?>
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	<h1><?php echo $heading_title; ?></h1>
	<?php if ($threads) { ?>
	<div class="thread-filter">
		<div class="display"><b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display('grid');"><?php echo $text_grid; ?></a></div>
		<div class="limit"><?php echo $text_limit; ?>
			<select onchange="location = this.value;">
				<?php foreach ($limits as $limits) { ?>
				<?php if ($limits['value'] == $limit) { ?>
				<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
				<?php } ?>
				<?php } ?>
			</select>
		</div>
		<div class="sort"><?php echo $text_sort; ?>
			<select onchange="location = this.value;">
				<?php foreach ($sorts as $sorts) { ?>
				<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
				<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
				<?php } ?>
				<?php } ?>
			</select>
		</div>
	</div>
	<div class="thread-list">
		<?php foreach ($threads as $thread) { ?>
		<div>
			<?php if ($thread['thumb']) { ?>
			<div class="image"><a href="<?php echo $thread['href']; ?>"><img src="<?php echo $thread['thumb']; ?>" title="<?php echo $thread['title']; ?>" alt="<?php echo $thread['title']; ?>" /></a></div>
			<?php } ?>
			<div class="name"><a href="<?php echo $thread['href']; ?>"><?php echo $thread['title']; ?></a>999999999</div>
			<div class="description"><?php echo $thread['description']; ?></div>
			<?php if ($thread['rating']) { ?>
			<div class="rating"><img src="<?php echo ICON; ?>stars/stars-<?php echo $thread['rating']; ?>.png" alt="<?php echo $thread['posts']; ?>" /></div>
			<?php } ?>
		</div>
		<?php } ?>
	</div>
	<div class="pagination"><?php echo $pagination; ?></div>
	<?php } else { ?>
	<div class="content"><?php echo $text_empty; ?></div>
	<div class="buttons">
		<div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
	</div>
	<?php }?>
	<?php echo $content_footer; ?></div>
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.thread-grid').attr('class', 'thread-list');

		$('.thread-list > div').each(function(index, element) {
			html	= '<div class="right">';
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

		$('.display').html('<b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');

		$.cookie('display', 'list');
	} else {
		$('.thread-list').attr('class', 'thread-grid');

		$('.thread-grid > div').each(function(index, element) {
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

			$(element).html(html);
		});

		$('.display').html('<b><?php echo $text_display; ?></b> <a onclick="display(\'list\');"><?php echo $text_list; ?></a> <b>/</b> <?php echo $text_grid; ?>');

		$.cookie('display', 'grid');
	}
}

view = $.cookie('display');

if (view) {
	display(view);
} else {
	display('list');
}
//--></script>
<?php echo $footer; ?>