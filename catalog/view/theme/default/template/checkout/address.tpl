<div class="uniForm">
<?php if ($addresses) { ?>

	<div class="ctrlHolder">
		<label class="" for="<?php echo $type; ?>_address"><em>*</em><?php echo $text_choose_address; ?></label>
		<ul class="blockLabels">
			<li>
				<label for="<?php echo $type; ?>-address-existing">
					<?php echo $entry_address_existing; ?>
					<input
						type="radio"
						id="<?php echo $type; ?>-address-existing"
						tabindex=""
						title="<?php echo $type; ?>-address-existing"
						name="<?php echo $type; ?>_address"
						checked="checked"
						value="existing"
					>
				</label>
			</li>

			<li>
				<div id="<?php echo $type; ?>-existing">
				<select
					class="selectInput"
					tabindex=""
					id="address_id"
					title="address_id"
					name="address_id"
					required=""
				>
					<option value=""><?php echo $text_select; ?></option>
					<?php foreach ($addresses as $address) { ?>
						<?php if ($address['address_id'] == $address_id) { ?>
							<option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['country']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['country']; ?></option>
						<?php } ?>
					<?php } ?>
				</select>
				</div>
			</li>

			<li>
				<br />
			</li>

			<li>
				<label for="<?php echo $type; ?>-address-new">
					<?php echo $entry_address_new; ?>
					<input
						type="radio"
						id="<?php echo $type; ?>-address-new"
						tabindex=""
						title="<?php echo $type; ?>-address-new"
						name="<?php echo $type; ?>_address"
						value="new"
					>
				</label>
			</li>
		</ul>
		<p class="formHint"><?php echo $text_hint_choose_address; ?></p>
	</div>

<?php } ?>

<div id="<?php echo $type; ?>-new" style="display: none;">

	<div class="ctrlHolder">
		<label class="" for="firstname"><em>*</em><?php echo $entry_firstname; ?></label>
		<input
			type="text"
			class="textInput required validateAlpha validateMin val-2"
			size="50"
			maxlength="50"
			required="required"
			tabindex="1"
			id="firstname"
			title="firstname"
			name="firstname"
			value=""
			data-default-value="<?php echo $entry_firstname; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_firstname; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="lastname"><em>*</em><?php echo $entry_lastname; ?></label>
		<input
			type="text"
			class="textInput required validateAlpha validateMin val-2"
			size="50"
			maxlength="50"
			required="required"
			tabindex="2"
			id="lastname"
			title="lastname"
			name="lastname"
			value=""
			data-default-value="<?php echo $text_lastname; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_lastname; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="company"><?php echo $entry_company; ?></label>
		<input
			type="text"
			class="textInput validatePhrase validateMin val-2"
			size="50"
			maxlength="50"
			required=""
			tabindex="6"
			id="company"
			title="company"
			name="company"
			value=""
			data-default-value="<?php echo $text_company; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_company; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="address_1"><em>*</em><?php echo $entry_address_1; ?></label>
		<input
			type="text"
			class="textInput required validatePhrase validateMin val-2"
			size="50"
			maxlength="50"
			required="required"
			tabindex="7"
			id="address_1"
			title="address_1"
			name="address_1"
			value=""
			data-default-value="<?php echo $text_address_1; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_address_1; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="address_2"><?php echo $entry_address_2; ?></label>
		<input
			type="text"
			class="textInput validatePhrase validateMin val-2"
			size="50"
			maxlength="50"
			required=""
			tabindex="8"
			id="address_2"
			title="address_2"
			name="address_2"
			value=""
			data-default-value="<?php echo $text_address_2; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_address_2; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="city"><em>*</em><?php echo $entry_city; ?></label>
		<input
			type="text"
			class="textInput required validatePhrase validateMin val-2"
			size="50"
			maxlength="50"
			required="required"
			tabindex="9"
			id="city"
			title="city"
			name="city"
			value=""
			data-default-value="<?php echo $text_city; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_city; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="postcode"><em>*</em><?php echo $entry_postcode; ?></label>
		<input
			type="text"
			class="textInput required validatePhrase validateMin val-2"
			size="50"
			maxlength="50"
			required="required"
			tabindex="10"
			id="postcode"
			title="postcode"
			name="postcode"
			value=""
			data-default-value="<?php echo $text_postcode; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_postcode; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="country_id"><em>*</em><?php echo $entry_country; ?></label>
		<select
			class="selectInput"
			tabindex="11"
			id="country_id"
			title="country_id"
			name="country_id"
			required=""
			onchange="$('#<?php echo $type; ?>-address select[name=\'zone_id\']').load('index.php?route=checkout/address/zone&country_id=' + this.value);"
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
			tabindex="12"
			id="zone_id"
			title="zone_id"
			name="zone_id"
			required="required"
		></select>
		<p class="formHint"><?php echo $text_hint_zone; ?></p>
	</div>

</div>

	<div class="button_container container_grey">
		<a id="button-address" class="button button_green right"><?php echo $button_continue; ?></a>
	</div>

</div>

<script language="javascript" type="text/javascript">
	var type = '<?php echo $type; ?>';
	var type_address = '<?php echo $type; ?>_address';
	var country_id = '<?php echo $country_id; ?>';
	var zone_id = '&zone_id=<?php echo $zone_id; ?>';
	var url = 'index.php?route=checkout/address/zone&country_id=';
</script>