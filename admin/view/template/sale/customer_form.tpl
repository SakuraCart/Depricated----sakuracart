<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/user_customer.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<div id="htabs" class="htabs">
			<a href="#tab-general"><?php echo $tab_general; ?></a>
			<?php if ($customer_id) { ?>
				<a href="#tab-transaction"><?php echo $tab_transaction; ?></a>
				<a href="#tab-reward"><?php echo $tab_reward; ?></a>
			<?php } ?>
			<a href="#tab-ip"><?php echo $tab_ip; ?></a>
		</div>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

<div id="tab-general">

			<div id="vtabs" class="vtabs">
				<a href="#tab-customer"><?php echo $tab_general; ?></a>
				<?php $address_row = 1; ?>
				<?php foreach ($addresses as $address) { ?>
					<a href="#tab-address-<?php echo $address_row; ?>" id="address-<?php echo $address_row; ?>"><?php echo $tab_address . ' ' . $address_row; ?>&nbsp;<img src="<?php echo ICON; ?>16/delete.png" alt="" onclick="$('#vtabs a:first').trigger('click'); $('#address-<?php echo $address_row; ?>').remove(); $('#tab-address-<?php echo $address_row; ?>').remove(); return false;" /></a>
					<?php $address_row++; ?>
				<?php } ?>
				<span id="address-add">
					<?php echo $button_add_address; ?>&nbsp;<img src="<?php echo ICON; ?>16/add.png" alt="" onclick="addAddress();" />
				</span>
			</div>

			<div id="tab-customer" class="vtabs-content">

				<table class="">
					<tbody>
							<tr>
								<th class="texttop">
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
								<th class="texttop">
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
								<th class="texttop">
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
								<th class="texttop">
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
								<th class="texttop">
									<?php echo $entry_fax; ?>
								</th>
								<td class="textleft">
									<input type="text" name="fax" value="<?php echo $fax; ?>" />
								</td>
							</tr>
							<tr>
								<th class="texttop">
									<?php echo $entry_password; ?>
								</th>
								<td class="textleft">
									<?php if ($error_password) { ?>
										<input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $error_password; ?>" class="input_error" />
									<?php } else { ?>
										<input type="password" name="password" value="<?php echo $password; ?>" />
									<?php } ?>
								</td>
							<tr>
							</tr>
								<th class="texttop">
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
								<th class="texttop">
									<?php echo $entry_newsletter; ?>
								</th>
								<td class="textleft">
									<select name="newsletter">
										<?php if ($newsletter) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } ?>
									</select>
								</td>
							</tr>
							<tr>
								<th class="texttop">
									<?php echo $entry_customer_group; ?>
								</th>
								<td class="textleft">
									<select name="customer_group_id">
										<?php foreach ($customer_groups as $customer_group) { ?>
											<?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
												<option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
								</td>
							</tr>
							<tr>
								<th class="texttop">
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

			<?php $address_row = 1; ?>
			<?php foreach ($addresses as $address) { ?>
				<div id="tab-address-<?php echo $address_row; ?>" class="vtabs-content">
					<input type="hidden" name="address[<?php echo $address_row; ?>][address_id]" value="<?php echo $address['address_id']; ?>" />
					<table class="">
						<tbody>
								<tr>
									<th class="texttop">
										<?php echo $entry_firstname; ?>
									</th>
									<td class="textleft">
										<?php if (isset($error_address_firstname[$address_row])) { ?>
											<input type="text" name="address[<?php echo $address_row; ?>][firstname]" value="<?php echo $address['firstname']; ?>" placeholder="<?php echo $error_address_firstname[$address_row]; ?>" class="input_error" />
										<?php } else { ?>
											<input type="text" name="address[<?php echo $address_row; ?>][firstname]" value="<?php echo $address['firstname']; ?>" />
										<?php } ?>
									</td>
								</tr>
								<tr>
									<th class="texttop">
										<?php echo $entry_lastname; ?>
									</th>
									<td class="textleft">
										<?php if (isset($error_address_lastname[$address_row])) { ?>
											<input type="text" name="address[<?php echo $address_row; ?>][lastname]" value="<?php echo $address['lastname']; ?>" placeholder="<?php echo $error_address_lastname[$address_row]; ?>" class="input_error" />
										<?php } else { ?>
											<input type="text" name="address[<?php echo $address_row; ?>][lastname]" value="<?php echo $address['lastname']; ?>" />
										<?php } ?>
									</td>
								</tr>
								<tr>
									<th class="texttop">
										<?php echo $entry_company; ?>
									</th>
									<td class="textleft">
										<input type="text" name="address[<?php echo $address_row; ?>][company]" value="<?php echo $address['company']; ?>" />
									</td>
								</tr>
								<tr>
									<th class="texttop">
										<?php echo $entry_address_1; ?>
									</th>
									<td class="textleft">
										<?php if (isset($error_address_address_1[$address_row])) { ?>
											<input type="text" name="address[<?php echo $address_row; ?>][address_1]" value="<?php echo $address['address_1']; ?>" placeholder="<?php echo $error_address_address_1[$address_row]; ?>" class="input_error" />
										<?php } else { ?>
											<input type="text" name="address[<?php echo $address_row; ?>][address_1]" value="<?php echo $address['address_1']; ?>" />
										<?php } ?>
									</td>
								</tr>
								<tr>
									<th class="texttop">
										<?php echo $entry_address_2; ?>
									</th>
									<td class="textleft">
										<input type="text" name="address[<?php echo $address_row; ?>][address_2]" value="<?php echo $address['address_2']; ?>" />
									</td>
								</tr>
								<tr>
									<th class="texttop">
										<?php echo $entry_city; ?>
									</th>
									<td class="textleft">
										<?php if (isset($error_address_city[$address_row])) { ?>
											<input type="text" name="address[<?php echo $address_row; ?>][city]" value="<?php echo $address['city']; ?>" placeholder="<?php echo $error_address_city[$address_row]; ?>" class="input_error" />
										<?php } else { ?>
											<input type="text" name="address[<?php echo $address_row; ?>][city]" value="<?php echo $address['city']; ?>" />
										<?php } ?>
									</td>
								<tr>
								</tr>
									<th class="texttop">
										<?php echo $entry_postcode; ?>
									</th>
									<td class="textleft">
										<input type="text" name="address[<?php echo $address_row; ?>][postcode]" value="<?php echo $confirm; ?>" />
									</td>
								</tr>
								<tr>
									<th class="texttop">
										<?php echo $entry_country; ?>
									</th>
									<td class="textleft">
										<select name="address[<?php echo $address_row; ?>][country_id]" id="address[<?php echo $address_row; ?>][country_id]" onchange="$('select[name=\'address[<?php echo $address_row; ?>][zone_id]\']').load('index.php?route=sale/customer/zone&token=<?php echo $token; ?>&country_id=' + this.value + '&zone_id=<?php echo $address['zone_id']; ?>');">
											<option value=""><?php echo $text_select; ?></option>
											<?php foreach ($countries as $country) { ?>
												<?php if ($country['country_id'] == $address['country_id']) { ?>
													<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
												<?php } else { ?>
													<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
												<?php } ?>
											<?php } ?>
										</select>
										<?php if (isset($error_address_country[$address_row])) { ?>
											<span class="error"><?php echo $error_address_country[$address_row]; ?></span>
										<?php } ?>
									</td>
								</tr>
								<tr>
									<th class="texttop">
										<?php echo $entry_zone; ?>
									</th>
									<td class="textleft">
										<select name="address[<?php echo $address_row; ?>][zone_id]"></select>
										<?php if (isset($error_address_zone[$address_row])) { ?>
											<span class="error"><?php echo $error_address_zone[$address_row]; ?></span>
										<?php } ?>
									</td>
								</tr>
								<tr>
									<th class="texttop">
										<?php echo $entry_default; ?>
									</th>
									<td class="textleft">
										<?php if (($address['address_id'] == $address_id) || !$addresses) { ?>
											<input type="radio" name="address[<?php echo $address_row; ?>][default]" value="<?php echo $address_row; ?>" checked="checked" />
										<?php } else { ?>
											<input type="radio" name="address[<?php echo $address_row; ?>][default]" value="<?php echo $address_row; ?>" />
										<?php } ?>
									</td>
								</tr>
						</tbody>
					</table>
					<script type="text/javascript"><!--
						$('select[name=\'address[<?php echo $address_row; ?>][zone_id]\']').load('index.php?route=sale/customer/zone&token=<?php echo $token; ?>&country_id=<?php echo $address['country_id']; ?>&zone_id=<?php echo $address['zone_id']; ?>');
					//--></script>
				</div>
				<?php $address_row++; ?>
			<?php } ?>
</div>

<?php if ($customer_id) { ?>
			<div id="tab-transaction">
				<table class="">
					<thead>
						<tr>
							<th scope="col" class="textleft"><?php echo $column_description; ?></th>
							<th scope="col" class="textleft"><?php echo $column_amount; ?></th>
							<th scope="col" class="center"><?php echo $column_action; ?></th>
						</tr>
					</thead>
					<tbody>
							<tr>
								<td class="textleft">
									<input type="text" name="description" value="" />
								</td>
								<td class="textleft">
									<input type="text" name="amount" value="" />
								</td>
								<td class="center">
									<a id="button-reward" onclick="addTransaction();" class="button button_green"><?php echo $button_add; ?></a>
								</td>
							</tr>
					</tbody>
				</table>
				<div id="transaction"></div>
			</div>
			<div id="tab-reward">
				<table class="">
					<thead>
						<tr>
							<th scope="col" class="textleft"><?php echo $column_description; ?></th>
							<th scope="col" class="textleft"><?php echo $column_points; ?></th>
							<th scope="col" class="center"><?php echo $column_action; ?></th>
						</tr>
					</thead>
					<tbody>
							<tr>
								<td class="textleft">
									<input type="text" name="description" value="" />
								</td>
								<td class="textleft">
									<input type="text" name="points" value="" />
								</td>
								<td class="center">
									<a id="button-reward" onclick="addRewardPoints();" class="button button_green"><?php echo $button_add; ?></a>
								</td>
							</tr>
					</tbody>
				</table>
				<div id="reward"></div>
			</div>
<?php } ?>

<div id="tab-ip">
			<?php if ($ips) { ?>
				<table id="datatable" class="datatable">
					<thead>
						<tr>
							<th scope="col" class="textleft"><?php echo $column_name; ?></th>
							<th scope="col" class="textleft"><?php echo $column_name; ?></th>
							<th scope="col" class="textleft"><?php echo $column_action; ?></th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($ips as $ip) { ?>
							<tr>
								<td scope="row" class="textleft">
									<a onclick="window.open('http://www.geoiptool.com/en/?IP=<?php echo $ip['ip']; ?>');"><?php echo $ip['ip']; ?></a>
								</td>
								<td scope="row" class="textleft">
									<a onclick="window.open('<?php echo $ip['filter_ip']; ?>');"><?php echo $ip['total']; ?></a>
								</td>
								<td scope="row" class="textleft">
									<?php echo $ip['date_added']; ?>
								</td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
			<?php } else { ?>
					<?php echo $text_no_results; ?>
			<?php } ?>
</div>


<script type="text/javascript"><!--
var address_row = <?php echo $address_row; ?>;

function addAddress() {
	html  = '<div id="tab-address-' + address_row + '" class="vtabs-content" style="display: none;">';
	html += '  <input type="hidden" name="address[' + address_row + '][address_id]" value="" />';
	html += '  <table class="form">';
	html += '    <tbody><tr>';
	html += '	   <th class="texttop"><?php echo $entry_firstname; ?></th>';
	html += '	   <td class="textleft"><input type="text" name="address[' + address_row + '][firstname]" value="" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <th class="texttop"><?php echo $entry_lastname; ?></th>';
	html += '      <td class="textleft"><input type="text" name="address[' + address_row + '][lastname]" value="" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <th class="texttop"><?php echo $entry_company; ?></th>';
	html += '      <td class="textleft"><input type="text" name="address[' + address_row + '][company]" value="" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <th class="texttop"><?php echo $entry_address_1; ?></th>';
	html += '      <td class="textleft"><input type="text" name="address[' + address_row + '][address_1]" value="" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <th class="texttop"><?php echo $entry_address_2; ?></th>';
	html += '      <td class="textleft"><input type="text" name="address[' + address_row + '][address_2]" value="" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <th class="texttop"><?php echo $entry_city; ?></th>';
	html += '      <td class="textleft"><input type="text" name="address[' + address_row + '][city]" value="" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <th class="texttop"><?php echo $entry_postcode; ?></th>';
	html += '      <td class="textleft"><input type="text" name="address[' + address_row + '][postcode]" value="" /></td>';
	html += '    </tr>';
	html += '      <th class="texttop"><?php echo $entry_country; ?></th>';
	html += '      <td class="textleft"><select name="address[' + address_row + '][country_id]" onchange="$(\'select[name=\\\'address[' + address_row + '][zone_id]\\\']\').load(\'index.php?route=sale/customer/zone&token=<?php echo $token; ?>&country_id=\' + this.value + \'&zone_id=0\');">';
	html += '         <option value=""><?php echo $text_select; ?></option>';
	<?php foreach ($countries as $country) { ?>
	html += '         <option value="<?php echo $country['country_id']; ?>"><?php echo addslashes($country['name']); ?></option>';
	<?php } ?>
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <th class="texttop"><?php echo $entry_zone; ?></th>';
	html += '      <td class="textleft"><select name="address[' + address_row + '][zone_id]"><option value="false"><?php echo $this->language->get('text_none'); ?></option></select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <th class="texttop"><?php echo $entry_default; ?></th>';
	html += '      <td class="textleft"><input type="radio" name="address[' + address_row + '][default]" value="1" /></td>';
	html += '    </tr></tbody>';
	html += '  </table>';
	html += '</div>';

	$('#tab-general').append(html);
	$('#address-add').before('<a href="#tab-address-' + address_row + '" id="address-' + address_row + '"><?php echo $tab_address; ?> ' + address_row + '&nbsp;<img src="<?php echo ICON; ?>16/delete.png" alt="" onclick="$(\'#vtabs a:first\').trigger(\'click\'); $(\'#address-' + address_row + '\').remove(); $(\'#tab-address-' + address_row + '\').remove(); return false;" /></a>');
	$('.vtabs a').tabs();

//	$('#address-' + address_row).trigger('click');
	$('#address-' + address_row).trigger('focus');

	address_row++;
}
//--></script>

<script type="text/javascript"><!--
$('#transaction .pagination a').live('click', function() {
	$('#transaction').load(this.href);
	return false;
});

$('#transaction').load('index.php?route=sale/customer/transaction&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>');

function addTransaction() {
	$.ajax({
		url: 'index.php?route=sale/customer/transaction&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>',
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
<script type="text/javascript"><!--
$('#reward .pagination a').live('click', function() {
	$('#reward').load(this.href);
	return false;
});

$('#reward').load('index.php?route=sale/customer/reward&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>');

function addRewardPoints() {
	$.ajax({
		url: 'index.php?route=sale/customer/reward&token=<?php echo $token; ?>&customer_id=<?php echo $customer_id; ?>',
		type: 'post',
		dataType: 'html',
		data: 'description=' + encodeURIComponent($('#tab-reward input[name=\'description\']').val()) + '&points=' + encodeURIComponent($('#tab-reward input[name=\'points\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-reward').attr('disabled', true);
			$('#reward').before('<div class="attention"><img src="<?php echo ICON; ?>/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-reward').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(html) {
			$('#reward').html(html);

			$('#tab-reward input[name=\'points\']').val('');
			$('#tab-reward input[name=\'description\']').val('');
		}
	});
}
//--></script>
<script type="text/javascript"><!--
$('form input[type=radio]').live('click', function () {
	$('form input[type=radio]').attr('checked', false);
	$(this).attr('checked', true);
});
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