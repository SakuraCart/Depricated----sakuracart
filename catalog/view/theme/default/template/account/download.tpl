<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div id="content">
<?php if ($downloads) { ?>

	<?php foreach ($downloads as $download) { ?>
	<div class="download-list">
		<div class="download-id"><b><?php echo $text_order; ?></b> <?php echo $download['order_id']; ?></div>
		<div class="download-status"><b><?php echo $text_size; ?></b> <?php echo $download['size']; ?></div>
		<div class="download-content">
			<div><b><?php echo $text_name; ?></b> <?php echo $download['name']; ?><br />
				<b><?php echo $text_date_added; ?></b> <?php echo $download['date_added']; ?></div>
			<div><b><?php echo $text_remaining; ?></b> <?php echo $download['remaining']; ?></div>
			<div class="download-info">
				<?php if ($download['remaining'] > 0) { ?>
				<a href="<?php echo $download['href']; ?>" class="button"><span><?php echo $text_download; ?></span></a>
				<?php } ?>
			</div>
		</div>
	</div>
	<?php } ?>
	<div class="pagination"><?php echo $pagination; ?></div>

<?php } else { ?>
		<?php echo $text_message; ?>
<?php } ?>

	<div class="button_container container_grey">
		<a href="<?php echo $continue; ?>" class="button button_blue right"><?php echo $button_continue; ?></a>
	</div>

	</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>