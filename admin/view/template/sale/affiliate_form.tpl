<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/affiliate.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

			<div id="htabs" class="htabs">
				<a href="#tab-general"><?php echo $tab_general; ?></a> <a href="#tab-payment"><?php echo $tab_payment; ?></a>
				<?php if ($affiliate_id) { ?>
					<a href="#tab-transaction"><?php echo $tab_transaction; ?></a>
				<?php } ?>
			</div>

<div id="tab-general">

				<table class="">
					<tbody>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_firstname; ?>
							</th>
							<td class="textleft">
								<?php if ($error_firstname) { ?>
									<input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $error_firstname; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="firstname" value="<?php echo $firstname; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_lastname; ?>
							</th>
							<td class="textleft">
								<?php if ($error_lastname) { ?>
									<input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $error_lastname; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="lastname" value="<?php echo $lastname; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_email; ?>
							</th>
							<td class="textleft">
								<?php if ($error_email) { ?>
									<input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $error_email; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="email" value="<?php echo $email; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_telephone; ?>
							</th>
							<td class="textleft">
								<?php if ($error_telephone) { ?>
									<input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $error_telephone; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="telephone" value="<?php echo $telephone; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_fax; ?>
							</th>
							<td class="textleft">
								<input type="text" name="fax" value="<?php echo $fax; ?>" />
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_company; ?>
							</th>
							<td class="textleft">
								<input type="text" name="company" value="<?php echo $company; ?>" />
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_address_1; ?>
							</th>
							<td class="textleft">
								<?php if ($error_address_1) { ?>
									<input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $error_address_1; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="address_1" value="<?php echo $address_1; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_address_2; ?>
							</th>
							<td class="textleft">
								<input type="text" name="address_2" value="<?php echo $address_2; ?>" />
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_city; ?>
							</th>
							<td class="textleft">
								<?php if ($error_city) { ?>
									<input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $error_city; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="city" value="<?php echo $city; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_postcode; ?>
							</th>
							<td class="textleft">
								<?php if ($error_postcode) { ?>
									<input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $error_postcode; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="postcode" value="<?php echo $postcode; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_country; ?>
							</th>
							<td class="textleft">
								<select name="country_id" onchange="$('select[name=\'zone_id\']').load('index.php?route=sale/affiliate/zone&token=<?php echo $token; ?>&country_id=' + this.value + '&zone_id=<?php echo $zone_id; ?>');">
									<option value="false"><?php echo $text_select; ?></option>
									<?php foreach ($countries as $country) { ?>
										<?php if ($country['country_id'] == $country_id) { ?>
											<option value="<?php echo $country['country_id']; ?>" selected="selected"> <?php echo $country['name']; ?> </option>
										<?php } else { ?>
											<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
<?php if ($error_country) { ?>
	<span class="error"><?php echo $error_country; ?></span>
<?php } ?>
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_zone; ?>
							</th>
							<td class="textleft">
								<select name="zone_id"></select>
<?php if ($error_zone) { ?>
	<span class="error"><?php echo $error_zone; ?></span>
<?php } ?>
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_code; ?>
							</th>
							<td class="textleft">
								<?php if ($error_code) { ?>
									<input type="text" name="code" value="<?php echo $code; ?>" placeholder="<?php echo $error_code; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="code" value="<?php echo $code; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_postcode; ?>
							</th>
							<td class="textleft">
								<?php if ($error_postcode) { ?>
									<input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $error_postcode; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="postcode" value="<?php echo $postcode; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_password; ?>
							</th>
							<td class="textleft">
								<?php if ($error_password) { ?>
									<input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $error_password; ?>" class="input_error" />
								<?php } else { ?>
									<input type="password" name="password" value="<?php echo $password; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_confirm; ?>
							</th>
							<td class="textleft">
								<?php if ($error_confirm) { ?>
									<input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $error_confirm; ?>" class="input_error" />
								<?php } else { ?>
									<input type="password" name="confirm" value="<?php echo $confirm; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_approved; ?>
							</th>
							<td class="textleft">
								<select name="approved">
									<?php if ($approved) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
									<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
									<?php } ?>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_status; ?>
							</th>
							<td class="textleft">
								<select name="status">
									<?php if ($status) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>
							</td>
						</tr>
					</tbody>
				</table>

</div>
<div id="tab-payment">

				<table class="">
					<tbody>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_commission; ?>
							</th>
							<td class="textleft">
								<input type="text" name="commission" value="<?php echo $commission; ?>" />
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_tax; ?>
							</th>
							<td class="textleft">
								<input type="text" name="tax" value="<?php echo $tax; ?>" />
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_payment; ?>
							</th>
							<td class="textleft">
								<?php if ($payment == 'cheque') { ?>
									<input type="radio" name="payment" value="cheque" id="cheque" checked="checked" />
								<?php } else { ?>
									<input type="radio" name="payment" value="cheque" id="cheque" />
								<?php } ?>
									<label for="cheque"><?php echo $text_cheque; ?></label>
								<?php if ($payment == 'paypal') { ?>
									<input type="radio" name="payment" value="paypal" id="paypal" checked="checked" />
								<?php } else { ?>
									<input type="radio" name="payment" value="paypal" id="paypal" />
								<?php } ?>
								<label for="paypal"><?php echo $text_paypal; ?></label>
								<?php if ($payment == 'bank') { ?>
									<input type="radio" name="payment" value="bank" id="bank" checked="checked" />
								<?php } else { ?>
									<input type="radio" name="payment" value="bank" id="bank" />
								<?php } ?>
								<label for="bank"><?php echo $text_bank; ?></label>
							</td>
						</tr>
					</tbody>

					<tbody id="payment-cheque" class="payment">
						<tr>
							<th scope="row" class="">
								<?php echo $entry_cheque; ?>
							</th>
							<td class="textleft">
								<input type="text" name="cheque" value="<?php echo $cheque; ?>" />
							</td>
						</tr>
					</tbody>

					<tbody id="payment-paypal" class="payment">
						<tr>
							<th scope="row" class="">
								<?php echo $entry_paypal; ?>
							</th>
							<td class="textleft">
								<input type="text" name="paypal" value="<?php echo $paypal; ?>" />
							</td>
						</tr>
					</tbody>

					<tbody id="payment-bank" class="payment">
						<tr>
							<th scope="row" class="">
								<?php echo $entry_bank_name; ?>
							</th>
							<td class="textleft">
								<input type="text" name="bank_name" value="<?php echo $bank_name; ?>" />
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_bank_branch_number; ?>
							</th>
							<td class="textleft">
								<input type="text" name="bank_branch_number" value="<?php echo $bank_branch_number; ?>" />
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_bank_swift_code; ?>
							</th>
							<td class="textleft">
								<input type="text" name="bank_swift_code" value="<?php echo $bank_swift_code; ?>" />
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_bank_account_name; ?>
							</th>
							<td class="textleft">
								<input type="text" name="bank_account_name" value="<?php echo $bank_account_name; ?>" />
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_bank_account_number; ?>
							</th>
							<td class="textleft">
								<input type="text" name="bank_account_number" value="<?php echo $bank_account_number; ?>" />
							</td>
						</tr>
					</tbody>

				</table>

</div>

<?php if ($affiliate_id) { ?>
	<div id="tab-transaction">

				<table class="">
					<tbody id="payment-cheque" class="payment">
						<tr>
							<th scope="row" class="">
								<?php echo $entry_description; ?>
							</th>
							<td class="textleft">
								<input type="text" name="description" value="<?php echo $description; ?>" />
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_amount; ?>
							</th>
							<td class="textleft">
								<input type="text" name="amount" value="<?php echo $amount; ?>" />
							</td>
						</tr>
						<tr>
							<td colspan="2" class="center">
								<a id="button-reward" onclick="addTransaction();" class="button button_green"><?php echo $button_add_transaction; ?></a>
							</td>
						</tr>
					</tbody>
				</table>
				<div id="transaction"></div>
	</div>
<?php } ?>

<script type="text/javascript"><!--
$('select[name=\'zone_id\']').load('index.php?route=sale/affiliate/zone&token=<?php echo $token; ?>&country_id=<?php echo $country_id; ?>&zone_id=<?php echo $zone_id; ?>');
//--></script>
<script type="text/javascript"><!--
$('input[name=\'payment\']').bind('change', function() {
	$('.payment').hide();
	$('#payment-' + this.value).show();
});

$('input[name=\'payment\']:checked').trigger('change');
//--></script>
<script type="text/javascript"><!--
$('#transaction .pagination a').live('click', function() {
	$('#transaction').load(this.href);
	return false;
});
$('#transaction').load('index.php?route=sale/affiliate/transaction&token=<?php echo $token; ?>&affiliate_id=<?php echo $affiliate_id; ?>');

function addTransaction() {
	$.ajax({
		url: 'index.php?route=sale/affiliate/transaction&token=<?php echo $token; ?>&affiliate_id=<?php echo $affiliate_id; ?>',
		type: 'post',
		dataType: 'html',
		data: 'description=' + encodeURIComponent($('#tab-transaction input[name=\'description\']').val()) + '&amount=' + encodeURIComponent($('#tab-transaction input[name=\'amount\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-transaction').attr('disabled', true);
			$('#transaction').before('<div class="attention"><img src="view/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-transaction').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(html) {
			$('#transaction').html(html);
			$('#tab-transaction input[name=\'amount\']').val('');
			$('#tab-transaction input[name=\'description\']').val('');
		}
	});
}
//--></script>


			<div class="button_container container_grey">
				<a onclick="location = '<?php echo $cancel; ?>';" class="button button_red left"><?php echo $button_cancel; ?></a>
				<a onclick="$('#form').submit();" class="button button_green right"><?php echo $button_save; ?></a>
			</div>

		</form>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>