<div id="shipping" class="uniForm">
<div class="cart-heading"><?php echo $heading_title; ?></div>
<div class="cart-content">
	<input type="hidden" name="shipping_method" value="<?php echo $code; ?>" />

	<h3><?php echo $text_shipping; ?></h3>

	<div class="ctrlHolder">
		<label class="" for="country_id"><em>*</em><?php echo $entry_country; ?></label>
		<select
			class="selectInput required"
			tabindex="1"
			id="country_id"
			title="country_id"
			name="country_id"
			required="required"
			onchange="$('select[name=\'zone_id\']').load('index.php?route=total/shipping/zone&country_id=' + this.value + '&zone_id=<?php echo $zone_id; ?>');"
		>
			<option value=""><?php echo $text_select; ?></option>
			<?php foreach ($countries as $country) { ?>
					<?php if ($country['country_id'] == $country_id) { ?>
						<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
					<?php } else { ?>
						<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
					<?php } ?>
				<?php } ?>
			</select>
		<p class="formHint"><?php echo $text_hint_country; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="zone_id"><em>*</em><?php echo $entry_zone; ?></label>
		<select name="zone_id"
			class="selectInput required"
			tabindex="2"
			id="zone_id"
			title="zone_id"
			name="zone_id"
			required="required"
		></select>
		<p class="formHint"><?php echo $text_hint_zone; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="postcode"><em>*</em><?php echo $entry_postcode; ?></label>
		<input
			type="text"
			class="textInput required validatePhrase validateMin val-2"
			size="50"
			maxlength="50"
			required="required"
			tabindex="3"
			id="postcode"
			title="postcode"
			name="postcode"
			value="<?php echo $postcode; ?>"
			data-default-value="<?php echo $text_postcode; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_postcode; ?></p>
	</div>

	<div class="button_container">
		<a id="button-quote" class="button button_green right"><?php echo $button_quote; ?></a>
	</div>

	<div id="quote" style="display: none;"></div>

<script language="javascript" type="text/javascript">
	var template_image = '<?php echo $template_image; ?>';
	var button_shipping = '<?php echo $button_shipping; ?>';
	var country_id = '<?php echo $country_id; ?>';
	var zone_id = '&zone_id=<?php echo $zone_id; ?>';
	var url = 'index.php?route=total/shipping/zone&country_id=';
</script>

</div>
</div>