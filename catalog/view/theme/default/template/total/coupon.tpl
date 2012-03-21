<div id="coupon" class="uniForm">
	<div class="cart-heading"><?php echo $heading_title; ?></div>
	<div class="cart-content" id="coupon">

	<div class="ctrlHolder">
		<label class="" for="coupon"><?php echo $entry_coupon; ?></label>
		<input
			type="text"
			class="textInput validatePhrase validateMin val-2"
			size="50"
			maxlength="50"
			tabindex="4"
			id="coupon"
			title="coupon"
			name="coupon"
			value="<?php echo $coupon; ?>"
			data-default-value="<?php echo $text_coupon; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_coupon; ?></p>
	</div>

	<div class="button_container">
		<a id="button-coupon" class="button button_green right"><?php echo $button_coupon; ?></a>
	</div>

<script language="javascript" type="text/javascript">
	var template_image = '<?php echo $template_image; ?>';
</script>
</div>