<div id="voucher" class="uniForm">
	<div class="cart-heading"><?php echo $heading_title; ?></div>
	<div class="cart-content" id="voucher">

	<div class="ctrlHolder">
		<label class="" for="voucher"><?php echo $entry_voucher; ?></label>
		<input
			type="text"
			class="textInput validatePhrase validateMin val-2"
			size="50"
			maxlength="50"
			tabindex="5"
			id="voucher"
			title="voucher"
			name="voucher"
			value="<?php echo $voucher; ?>"
			data-default-value="<?php echo $text_voucher; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_voucher; ?></p>
	</div>

	<div class="button_container">
		<a id="button-voucher" class="button button_green right"><?php echo $button_voucher; ?></a>
	</div>

<script language="javascript" type="text/javascript">
	var template_image = '<?php echo $template_image; ?>';
</script>
</div>