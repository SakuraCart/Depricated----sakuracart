<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>

<div id="content">

	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="edit" name="edit" class="uniForm">
	<fieldset>

	<h2><?php echo $text_details; ?></h2>

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

	<h2><?php echo $text_address; ?></h2>

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
		<label class="" for="website"><?php echo $entry_website; ?></label>
		<input
			type="text"
			class="textInput validatePhrase validateMin val-2"
			size="50"
			maxlength="50"
			required=""
			tabindex="6"
			id="website"
			title="website"
			name="website"
			value="<?php echo $website; ?>"
			data-default-value="<?php echo $text_website; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_website; ?></p>
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
			onchange="$('select[name=\'zone_id\']').load('index.php?route=affiliate/edit/zone&country_id=' + this.value + '&zone_id=<?php echo $zone_id; ?>');"
		>
			<option value=""><?php echo $text_select; ?></option>
				<?php foreach ($countries as $country) { ?>
					<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
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

<script type="text/javascript"><!--
$('select[name=\'zone_id\']').load('index.php?route=affiliate/edit/zone&country_id=<?php echo $country_id; ?>&zone_id=<?php echo $zone_id; ?>');
//--></script>

	</fieldset>
	</form>

	<div class="button_container container_grey">
		<a href="<?php echo $back; ?>" class="button button_red left"><?php echo $button_cancel; ?></a>
		<a onclick="$('#edit').submit();" class="button button_green right"><?php echo $button_continue; ?></a>
	</div>

</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>