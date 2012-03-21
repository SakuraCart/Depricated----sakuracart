<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

<div id="content">

	<div>
		<?php echo $text_description; ?>
	</div>

	<table id="" class="">
		<tbody>
			<tr>
				<th scope="row" class="">
					<?php echo $text_code; ?>
				</th>
				<td scope="row" class="textleft">
					<textarea cols="90" rows="3"><?php echo $code; ?></textarea>
				</td>
			</tr>
			<tr>
				<th scope="row" class="">
					<?php echo $text_generator; ?>
				</th>
				<td scope="row" class="textleft">
					<input type="text" name="product" value="" size="85"/>
					<?php echo $text_hint_generator; ?>
				</td>
			</tr>
			<tr>
				<th scope="row" class="">
					<?php echo $text_link; ?>
				</th>
				<td scope="row" class="textleft">
					<textarea name="link" cols="70" rows="5"></textarea>
				</td>
			</tr>
		</tbody>
	</table>


	<div class="button_container container_grey">
		<a href="<?php echo $back; ?>" class="button button_red left"><?php echo $button_cancel; ?></a>
		<a href="<?php echo $continue; ?>" class="button button_green right"><?php echo $button_continue; ?></a>
	</div>

</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>