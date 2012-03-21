<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

<a name="#top"></a>

<div id="content">

	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>

	<div class="box_content">
		<?php echo $text_account_already; ?>
	</div>

	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="register" name="register" class="uniForm">
	<fieldset>

	<h3><?php echo $text_your_details; ?></h3>

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
			value="<?php echo $firstname; ?>"
			data-default-value="<?php echo $text_firstname; ?>"
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
			value="<?php echo $lastname; ?>"
			data-default-value="<?php echo $text_lastname; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_lastname; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="email"><em>*</em><?php echo $entry_email; ?></label>
		<input
			type="text"
			class="textInput required validateEmail"
			size="50"
			maxlength="50"
			required="required"
			tabindex="3"
			id="email"
			title="email"
			name="email"
			value="<?php echo $email; ?>"
			data-default-value="<?php echo $text_email; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_email; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="telephone"><?php echo $entry_telephone; ?></label>
		<input
			type="text"
			class="textInput validatePhone"
			size="50"
			maxlength="50"
			tabindex="4"
			id="telephone"
			title="telephone"
			name="telephone"
			value="<?php echo $telephone; ?>"
			data-default-value="<?php echo $text_telephone; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_telephone; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="fax"><?php echo $entry_fax; ?></label>
		<input
			type="text"
			class="textInput validatePhone"
			size="50"
			maxlength="50"
			required=""
			tabindex="5"
			id="fax"
			title="fax"
			name="fax"
			value="<?php echo $fax; ?>"
			data-default-value="<?php echo $text_fax; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_fax; ?></p>
	</div>

	<h3><?php echo $text_your_address; ?></h3>

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
			value="<?php echo $company; ?>"
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
			value="<?php echo $address_1; ?>"
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
			value="<?php echo $address_2; ?>"
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
			value="<?php echo $city; ?>"
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
			value="<?php echo $postcode; ?>"
			data-default-value="<?php echo $text_postcode; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_postcode; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="country_id"><em>*</em><?php echo $entry_country; ?></label>
		<select
			class="selectInput required"
			tabindex="11"
			id="country_id"
			title="country_id"
			name="country_id"
			required="required"
			onchange="$('select[name=\'zone_id\']').load('index.php?route=account/register/zone&country_id=' + this.value + '&zone_id=<?php echo $zone_id; ?>');"
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

	<h3><?php echo $text_your_password; ?></h3>

	<div class="ctrlHolder">
		<label class="" for="email"><em>*</em><?php echo $entry_password; ?></label>
		<input
			type="password"
			class="textInput required validateAlphaNum validateMin val-4"
			size="50"
			maxlength="50"
			required="required"
			tabindex="13"
			id="password"
			title="password"
			name="password"
			value="<?php echo $password; ?>"
			data-default-value="<?php echo $text_password; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_password; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="email"><em>*</em><?php echo $entry_confirm; ?></label>
		<input
			type="password"
			class="textInput required validateSameAs password"
			size="50"
			maxlength="50"
			required="required"
			tabindex="14"
			id="confirm"
			title="confirm"
			name="confirm"
			value="<?php echo $confirm; ?>"
			data-default-value="<?php echo $text_confirm; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_confirm; ?></p>
	</div>

	<h3><?php echo $text_newsletter; ?></h3>

	<div class="ctrlHolder">
		<label class="" for="newsletter"><?php echo $entry_subscribe; ?></label>
		<ul class="blockLabels">
			<li>
				<label for="newsletter">
				<?php if ($newsletter == 1) { ?>
					<input
						type="checkbox"
						id="newsletter"
						tabindex="15"
						title="newsletter"
						name="newsletter"
						checked="checked"
					>
				<?php } else { ?>
					<input
						type="checkbox"
						id="newsletter"
						tabindex="15"
						title="newsletter"
						name="newsletter"
						checked=""
					>
				<?php } ?>
					<?php echo $text_newsletter; ?>
				</label>
			</li>
		</ul>
		<p class="formHint"><?php echo $text_hint_newsletter; ?></p>
	</div>

	<h3><?php echo $text_legal; ?></h3>

	<div class="ctrlHolder">
		<label class="" for="agree"><em>*</em><?php echo $entry_agree; ?></label>
		<?php echo $text_agree; ?>
			<?php if ($agree) { ?>
				<input
					type="checkbox"
					class="required"
					required="required"
					tabindex="16"
					id="agree"
					title="agree"
					name="agree"
					checked="checked"
				>
			<?php } else { ?>
				<input
					type="checkbox"
					class="required"
					id="agree"
					required="required"
					tabindex="16"
					id="agree"
					title="agree"
					name="agree"
					checked=""
				>
			<?php } ?>
		<p class="formHint"><?php echo $text_hint_agree; ?></p>
	</div>

	</fieldset>
	</form>

<script language="javascript" type="text/javascript">
	var country_id = '<?php echo $country_id; ?>';
	var zone_id = '&zone_id=<?php echo $zone_id; ?>';
	var url = 'index.php?route=account/register/zone&country_id=';
</script>

	<div class="button_container container_grey">
		<a href="#top" class="button button_blue left" rel="nofollow"><?php echo $button_top; ?></a>
		<a href="<?php echo $continue; ?>" class="button button_blue left"><?php echo $button_home; ?></a>
		<a onclick="$('#register').submit();" class="button button_green right"><?php echo $button_continue; ?></a>
	</div>

</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>