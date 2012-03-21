<?php echo $header; ?>

	<?php if ($success) { ?>
		<div class="success"><?php echo $success; ?></div>
	<?php } ?>
	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<div class="content_left">
			<?php foreach ($addresses as $result) { ?>
				<?php echo $result['address']; ?>
			<?php } ?>
		</div>

		<div class="content_right">
			<a href="<?php echo $result['update']; ?>" class="button button_green right"><?php echo $button_edit; ?></a>
			<a href="<?php echo $result['delete']; ?>" class="button button_red right"><?php echo $button_delete; ?></a>
		</div>

	</div>

	<div class="button_container container_grey">
		<a href="<?php echo $continue; ?>" class="button button_blue left"><?php echo $button_continue; ?></a>
		<a href="<?php echo $insert; ?>" class="button button_green right"><?php echo $button_add_address; ?></a>
	</div>

</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>
