<!-- -------------------------------------------- BEGIN welcome -------------------------------------------- -->
<?php if ($message) { ?>
<section class="box_<?php echo $box_position; ?>">
	<h2 class="box_<?php echo $box_position; ?>">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $title; ?>
	</h2>

	<div class="box_plain">
		<?php echo $message; ?>
	</div>

</section>
<?php } ?>
<!-- -------------------------------------------- END welcome -------------------------------------------- -->
