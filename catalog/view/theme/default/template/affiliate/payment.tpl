<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

<div id="content">

	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="payment" name="edit" class="uniForm">
	<fieldset>

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


<script type="text/javascript"><!--
$('input[name=\'payment\']').bind('change', function() {
	$('.payment').hide();
	$('#payment-' + this.value).show();
});
$('input[name=\'payment\']:checked').trigger('change');
//--></script>

	<div class="button_container container_grey">
		<a href="<?php echo $back; ?>" class="button button_red left"><?php echo $button_cancel; ?></a>
		<a onclick="$('#payment').submit();" class="button button_green right"><?php echo $button_continue; ?></a>
	</div>

</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>