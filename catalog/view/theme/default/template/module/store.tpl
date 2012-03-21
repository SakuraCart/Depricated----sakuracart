<!-- -------------------------------------------- BEGIN store -------------------------------------------- -->
<?php if ($stores) { ?>
<section class="box_<?php echo $box_position; ?>">
	<h2 class="box_<?php echo $box_position; ?>">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div class="box_plain">

		<p><?php echo $text_store; ?></p>

		<select name="store" onchange="location = this.value">
			<?php foreach ($stores as $store) { ?>
			<?php if ($store['store_id'] == $store_id) { ?>
			<option value="<?php echo $store['url']; ?>" selected="selected"><?php echo $store['name']; ?></option>
			<?php } else { ?>
			<option value="<?php echo $store['url']; ?>"><?php echo $store['name']; ?></option>
			<?php } ?>
			<?php } ?>
		</select>
		<br />
		<br />
	</div>

</section>
<?php } ?>
<!-- -------------------------------------------- END store -------------------------------------------- -->
