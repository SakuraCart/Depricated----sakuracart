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
			onchange="$('select[name=\'zone_id\']').load('index.php?route=account/register/zone&country_id=' + this.value + '&zone_id=<?php echo $zone_id; ?>');"
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

	<h3><?php echo $text_payment; ?></h3>

	<div class="ctrlHolder">
		<label class="" for="tax"><em>*</em><?php echo $entry_tax; ?></label>
		<input
			type="text"
			class="textInput required validateAlphaNum validateMin val-2"
			size="50"
			maxlength="50"
			required="required"
			tabindex="13"
			id="tax"
			title="tax"
			name="tax"
			value="<?php echo $tax; ?>"
			data-default-value="<?php echo $text_tax; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_tax; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="email"><em>*</em><?php echo $entry_payment; ?></label>
		<?php if ($payment == 'cheque') { ?>
			<input type="radio" name="payment" value="cheque" id="cheque" checked="checked" />
		<?php } else { ?>
			<input type="radio" name="payment" value="cheque" id="cheque" />
		<?php } ?>
		<?php echo $text_cheque; ?>

		<?php if ($payment == 'paypal') { ?>
			<input type="radio" name="payment" value="paypal" id="paypal" checked="checked" />
		<?php } else { ?>
			<input type="radio" name="payment" value="paypal" id="paypal" />
		<?php } ?>
		<?php echo $text_paypal; ?>

		<?php if ($payment == 'bank') { ?>
			<input type="radio" name="payment" value="bank" id="bank" checked="checked" />
		<?php } else { ?>
			<input type="radio" name="payment" value="bank" id="bank" />
		<?php } ?>
		<?php echo $text_bank; ?>

		<p class="formHint"><?php echo $text_hint_confirm; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="cheque"><?php echo $entry_cheque; ?></label>
		<input
			type="text"
			class="textInput validateAlphaNum validateMin val-2"
			size="50"
			maxlength="50"
			tabindex="13"
			id="cheque"
			title="cheque"
			name="cheque"
			value="<?php echo $cheque; ?>"
			data-default-value="<?php echo $text_cheque; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_cheque; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="paypal"><?php echo $entry_paypal; ?></label>
		<input
			type="text"
			class="textInput validateAlphaNum validateMin val-2"
			size="50"
			maxlength="50"
			tabindex="13"
			id="paypal"
			title="paypal"
			name="paypal"
			value="<?php echo $paypal; ?>"
			data-default-value="<?php echo $text_paypal; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_paypal; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="bank_name"><?php echo $entry_bank_name; ?></label>
		<input
			type="text"
			class="textInput validateAlphaNum validateMin val-2"
			size="50"
			maxlength="50"
			tabindex="13"
			id="bank_name"
			title="bank_name"
			name="bank_name"
			value="<?php echo $bank_name; ?>"
			data-default-value="<?php echo $text_bank_name; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_bank_name; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="bank_branch_number"><?php echo $entry_bank_branch_number; ?></label>
		<input
			type="text"
			class="textInput validateAlphaNum validateMin val-2"
			size="50"
			maxlength="50"
			tabindex="13"
			id="bank_branch_number"
			title="bank_branch_number"
			name="bank_branch_number"
			value="<?php echo $bank_branch_number; ?>"
			data-default-value="<?php echo $text_bank_branch_number; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_bank_branch_number; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="bank_swift_code"><?php echo $entry_bank_swift_code; ?></label>
		<input
			type="text"
			class="textInput validateAlphaNum validateMin val-2"
			size="50"
			maxlength="50"
			tabindex="13"
			id="bank_swift_code"
			title="bank_swift_code"
			name="bank_swift_code"
			value="<?php echo $bank_swift_code; ?>"
			data-default-value="<?php echo $text_bank_swift_code; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_tax; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="bank_account_name"><?php echo $entry_bank_account_name; ?></label>
		<input
			type="text"
			class="textInput validateAlphaNum validateMin val-2"
			size="50"
			maxlength="50"
			tabindex="13"
			id="bank_account_name"
			title="bank_account_name"
			name="bank_account_name"
			value="<?php echo $bank_account_name; ?>"
			data-default-value="<?php echo $text_bank_account_name; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_bank_account_name; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="bank_account_name"><?php echo $entry_bank_account_name; ?></label>
		<input
			type="text"
			class="textInput validateAlphaNum validateMin val-2"
			size="50"
			maxlength="50"
			tabindex="13"
			id="bank_account_name"
			title="bank_account_name"
			name="bank_account_name"
			value="<?php echo $bank_account_name; ?>"
			data-default-value="<?php echo $text_bank_account_name; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_bank_account_name; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="bank_account_number"><?php echo $entry_bank_account_number; ?></label>
		<input
			type="text"
			class="textInput validateAlphaNum validateMin val-2"
			size="50"
			maxlength="50"
			tabindex="13"
			id="bank_account_number"
			title="bank_account_number"
			name="bank_account_number"
			value="<?php echo $bank_account_number; ?>"
			data-default-value="<?php echo $text_bank_account_number; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_bank_account_number; ?></p>
	</div>

	<h3><?php echo $text_your_password; ?></h3>

	<div class="ctrlHolder">
		<label class="" for="email"><?php echo $entry_password; ?></label>
		<input
			type="password"
			class="textInput validateAlphaNum validateMin val-4"
			size="50"
			maxlength="50"
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
		<label class="" for="email"><?php echo $entry_confirm; ?></label>
		<input
			type="password"
			class="textInput validateSameAs password"
			size="50"
			maxlength="50"
			tabindex="14"
			id="confirm"
			title="confirm"
			name="confirm"
			value="<?php echo $confirm; ?>"
			data-default-value="<?php echo $text_confirm; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_confirm; ?></p>
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


<script type="text/javascript"><!--
	$('select[name=\'zone_id\']').load('index.php?route=account/register/zone&country_id=<?php echo $country_id; ?>&zone_id=<?php echo $zone_id; ?>');
//--></script>
<script type="text/javascript"><!--
	$('input[name=\'payment\']').bind('change', function() {
		$('.payment').hide();
		$('#payment-' + this.value).show();
	});
	$('input[name=\'payment\']:checked').trigger('change');
//--></script>

<script type="text/javascript"><!--
$('.colorbox').colorbox({
html:"<p>Hello</p>"
});
//--></script>

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