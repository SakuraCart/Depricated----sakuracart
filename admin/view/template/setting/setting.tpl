<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/settings.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>
		<?php if ($success) { ?>
			<div class="success"><?php echo $success; ?></div>
		<?php } ?>

		<div id="tabs" class="htabs">
			<a href="#tab-general"><?php echo $tab_general; ?></a>
			<a href="#tab-store"><?php echo $tab_store; ?></a>
			<a href="#tab-local"><?php echo $tab_local; ?></a>
			<a href="#tab-option"><?php echo $tab_option; ?></a>
			<a href="#tab-image"><?php echo $tab_image; ?></a>
			<a href="#tab-mail"><?php echo $tab_mail; ?></a>
			<a href="#tab-fraud"><?php echo $tab_fraud; ?></a>
			<a href="#tab-server"><?php echo $tab_server; ?></a>
		</div>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

<div id="tab-general">
		<table class="">
			<tbody>
				<tr>
					<th class="texttop">
						<?php echo $entry_name; ?>
					</th>
					<td class="textleft">
						<?php if ($error_name) { ?>
							<input type="text" name="config_name" value="<?php echo $config_name; ?>" placeholder="<?php echo $error_name; ?>" class="input_error" />
						<?php } else { ?>
							<input type="text" name="config_name" value="<?php echo $config_name; ?>" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_owner; ?>
					</th>
					<td class="textleft">
						<?php if ($error_owner) { ?>
							<input type="text" name="config_owner" value="<?php echo $config_owner; ?>" placeholder="<?php echo $error_owner; ?>" class="input_error" />
						<?php } else { ?>
							<input type="text" name="config_owner" value="<?php echo $config_owner; ?>" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_address; ?>
					</th>
					<td class="textleft">
						<?php if ($error_address) { ?>
							<textarea name="config_address" cols="40" rows="5" placeholder="<?php echo $error_address; ?>" class="input_error"><?php echo $config_address; ?></textarea>
						<?php } else { ?>
							<textarea name="config_address" cols="40" rows="5"><?php echo $config_address; ?></textarea>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_email; ?>
					</th>
					<td class="textleft">
						<?php if ($error_email) { ?>
							<input type="text" name="config_email" value="<?php echo $config_email; ?>" placeholder="<?php echo $error_email; ?>" class="input_error" />
						<?php } else { ?>
							<input type="text" name="config_email" value="<?php echo $config_email; ?>" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_telephone; ?>
					</th>
					<td class="textleft">
						<?php if ($error_telephone) { ?>
							<input type="text" name="config_telephone" value="<?php echo $config_telephone; ?>" placeholder="<?php echo $error_telephone; ?>" class="input_error" />
						<?php } else { ?>
							<input type="text" name="config_telephone" value="<?php echo $config_telephone; ?>" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_fax; ?>
					</th>
					<td class="textleft">
						<input type="text" name="config_fax" value="<?php echo $config_fax; ?>" />
					</td>
				</tr>
			</tbody>
		</table>
</div>


<div id="tab-store">
		<table class="">
			<tbody>
				<tr>
					<th class="texttop">
						<?php echo $entry_title; ?>
					</th>
					<td class="textleft">
						<?php if ($error_title) { ?>
							<input type="text" name="config_title" value="<?php echo $config_title; ?>" placeholder="<?php echo $error_title; ?>" class="input_error" />
						<?php } else { ?>
							<input type="text" name="config_title" value="<?php echo $config_title; ?>" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_meta_description; ?>
					</th>
					<td class="textleft">
						<textarea name="config_meta_description" cols="40" rows="5"><?php echo $config_meta_description; ?></textarea>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_template; ?>
					</th>
					<td class="textleft">
						<select name="config_template" onchange="$('#template').load('index.php?route=setting/setting/template&token=<?php echo $token; ?>&template=' + encodeURIComponent(this.value));">
							<?php foreach ($templates as $template) { ?>
								<?php if ($template == $config_template) { ?>
									<option value="<?php echo $template; ?>" selected="selected"><?php echo $template; ?></option>
								<?php } else { ?>
									<option value="<?php echo $template; ?>"><?php echo $template; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_layout; ?>
					</th>
					<td class="textleft">
						<select name="config_layout_id">
							<?php foreach ($layouts as $layout) { ?>
								<?php if ($layout['layout_id'] == $config_layout_id) { ?>
									<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</td>
				</tr>
				<tr>
					<th></th>
					<td id="template" class="textleft"></td>
				</tr>
			</tbody>
		</table>
</div>


<div id="tab-local">
		<table class="">
			<tbody>
				<tr>
					<th class="texttop">
						<?php echo $entry_country; ?>
					</th>
					<td class="textleft">
						<select name="config_country_id" onchange="$('select[name=\'config_zone_id\']').load('index.php?route=setting/setting/zone&token=<?php echo $token; ?>&country_id=' + this.value + '&zone_id=<?php echo $config_zone_id; ?>');">
							<?php foreach ($countries as $country) { ?>
								<?php if ($country['country_id'] == $config_country_id) { ?>
									<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_zone; ?>
					</th>
					<td class="textleft">
						<select name="config_zone_id"></select>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_language; ?>
					</th>
					<td class="textleft">
						<select name="config_language">
							<?php foreach ($languages as $language) { ?>
								<?php if ($language['code'] == $config_language) { ?>
									<option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_admin_language; ?>
					</th>
					<td class="textleft">
						<select name="config_admin_language">
							<?php foreach ($languages as $language) { ?>
								<?php if ($language['code'] == $config_admin_language) { ?>
									<option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_currency; ?>
					</th>
					<td class="textleft">
						<select name="config_currency">
							<?php foreach ($currencies as $currency) { ?>
								<?php if ($currency['code'] == $config_currency) { ?>
									<option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_currency_auto; ?>
					</th>
					<td class="textleft">
						<?php if ($config_currency_auto) { ?>
							<input type="radio" name="config_currency_auto" value="1" checked="checked" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_currency_auto" value="0" />
							<?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="config_currency_auto" value="1" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_currency_auto" value="0" checked="checked" />
							<?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_length_class; ?>
					</th>
					<td class="textleft">
						<select name="config_length_class_id">
							<?php foreach ($length_classes as $length_class) { ?>
								<?php if ($length_class['length_class_id'] == $config_length_class_id) { ?>
									<option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_weight_class; ?>
					</th>
					<td class="textleft">
						<select name="config_weight_class_id">
							<?php foreach ($weight_classes as $weight_class) { ?>
								<?php if ($weight_class['weight_class_id'] == $config_weight_class_id) { ?>
									<option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
</div>


<div id="tab-option">
		<table class="">
			<tbody>
				<tr>
					<th class="texttop">
						<?php echo $entry_catalog_limit; ?>
					</th>
					<td class="textleft">
							<?php if ($error_catalog_limit) { ?>
								<input type="text" name="config_catalog_limit" value="<?php echo $config_catalog_limit; ?>" placeholder="<?php echo $error_catalog_limit; ?>" class="input_error" />
							<?php } else { ?>
								<input type="text" name="config_catalog_limit" value="<?php echo $config_catalog_limit; ?>" />
							<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_admin_limit; ?>
					</th>
					<td class="textleft">
							<?php if ($error_admin_limit) { ?>
								<input type="text" name="config_admin_limit" value="<?php echo $config_admin_limit; ?>" placeholder="<?php echo $error_admin_limit; ?>" class="input_error" />
							<?php } else { ?>
								<input type="text" name="config_admin_limit" value="<?php echo $config_admin_limit; ?>" />
							<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_tax; ?>
					</th>
					<td class="textleft">
						<?php if ($config_tax) { ?>
							<input type="radio" name="config_tax" value="1" checked="checked" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_tax" value="0" />
							<?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="config_tax" value="1" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_tax" value="0" checked="checked" />
							<?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_tax_default; ?>
					</th>
					<td class="textleft">
						<select name="config_tax_default">
							<option value=""><?php echo $text_none; ?></option>
							<?php  if ($config_tax_default == 'shipping') { ?>
								<option value="shipping" selected="selected"><?php echo $text_shipping; ?></option>
							<?php } else { ?>
								<option value="shipping"><?php echo $text_shipping; ?></option>
							<?php } ?>
							<?php  if ($config_tax_default == 'payment') { ?>
								<option value="payment" selected="selected"><?php echo $text_payment; ?></option>
							<?php } else { ?>
								<option value="payment"><?php echo $text_payment; ?></option>
							<?php } ?>
						</select>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_tax_customer; ?>
					</th>
					<td class="textleft">
						<select name="config_tax_customer">
							<option value=""><?php echo $text_none; ?></option>
							<?php  if ($config_tax_customer == 'shipping') { ?>
								<option value="shipping" selected="selected"><?php echo $text_shipping; ?></option>
							<?php } else { ?>
								<option value="shipping"><?php echo $text_shipping; ?></option>
							<?php } ?>
							<?php  if ($config_tax_customer == 'payment') { ?>
								<option value="payment" selected="selected"><?php echo $text_payment; ?></option>
							<?php } else { ?>
								<option value="payment"><?php echo $text_payment; ?></option>
							<?php } ?>
						</select>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_invoice_prefix; ?>
					</th>
					<td class="textleft">
						<input type="text" name="config_invoice_prefix" value="<?php echo $config_invoice_prefix; ?>" />
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_order_edit; ?>
					</th>
					<td class="textleft">
						<input type="text" name="config_order_edit" value="<?php echo $config_order_edit; ?>" size="3" />
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_customer_group; ?>
					</th>
					<td class="textleft">
						<select name="config_customer_group_id">
							<?php foreach ($customer_groups as $customer_group) { ?>
								<?php if ($customer_group['customer_group_id'] == $config_customer_group_id) { ?>
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
						<?php echo $entry_customer_price; ?>
					</th>
					<td class="textleft">
						<?php if ($config_customer_price) { ?>
							<input type="radio" name="config_customer_price" value="1" checked="checked" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_customer_price" value="0" />
							<?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="config_customer_price" value="1" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_customer_price" value="0" checked="checked" />
							<?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_customer_approval; ?>
					</th>
					<td class="textleft">
						<?php if ($config_customer_approval) { ?>
							<input type="radio" name="config_customer_approval" value="1" checked="checked" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_customer_approval" value="0" />
							<?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="config_customer_approval" value="1" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_customer_approval" value="0" checked="checked" />
							<?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_guest_checkout; ?>
					</th>
					<td class="textleft">
						<?php if ($config_guest_checkout) { ?>
							<input type="radio" name="config_guest_checkout" value="1" checked="checked" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_guest_checkout" value="0" />
							<?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="config_guest_checkout" value="1" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_guest_checkout" value="0" checked="checked" />
							<?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_account; ?>
					</th>
					<td class="textleft">
						<select name="config_account_id">
							<option value="0"><?php echo $text_none; ?></option>
							<?php foreach ($informations as $information) { ?>
								<?php if ($information['information_id'] == $config_account_id) { ?>
									<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_checkout; ?>
					</th>
					<td class="textleft">
						<select name="config_checkout_id">
							<option value="0"><?php echo $text_none; ?></option>
							<?php foreach ($informations as $information) { ?>
								<?php if ($information['information_id'] == $config_checkout_id) { ?>
									<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_affiliate; ?>
					</th>
					<td class="textleft">
						<select name="config_affiliate_id">
							<option value="0"><?php echo $text_none; ?></option>
							<?php foreach ($informations as $information) { ?>
								<?php if ($information['information_id'] == $config_affiliate_id) { ?>
									<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_commission; ?>
					</th>
					<td class="textleft">
						<input type="text" name="config_commission" value="<?php echo $config_commission; ?>" size="3" />
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_stock_display; ?>
					</th>
					<td class="textleft">
						<?php if ($config_stock_display) { ?>
							<input type="radio" name="config_stock_display" value="1" checked="checked" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_stock_display" value="0" />
							<?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="config_stock_display" value="1" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_stock_display" value="0" checked="checked" />
							<?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_stock_warning; ?>
					</th>
					<td class="textleft">
						<?php if ($config_stock_warning) { ?>
							<input type="radio" name="config_stock_warning" value="1" checked="checked" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_stock_warning" value="0" />
							<?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="config_stock_warning" value="1" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_stock_warning" value="0" checked="checked" />
							<?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_stock_checkout; ?>
					</th>
					<td class="textleft">
						<?php if ($config_stock_checkout) { ?>
							<input type="radio" name="config_stock_checkout" value="1" checked="checked" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_stock_checkout" value="0" />
							<?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="config_stock_checkout" value="1" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_stock_checkout" value="0" checked="checked" />
							<?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_stock_status; ?>
					</th>
					<td class="textleft">
						<select name="config_stock_status_id">
							<?php foreach ($stock_statuses as $stock_status) { ?>
								<?php if ($stock_status['stock_status_id'] == $config_stock_status_id) { ?>
									<option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_order_status; ?>
					</th>
					<td class="textleft">
						<select name="config_order_status_id">
							<?php foreach ($order_statuses as $order_status) { ?>
								<?php if ($order_status['order_status_id'] == $config_order_status_id) { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_complete_status; ?>
					</th>
					<td class="textleft">
						<select name="config_complete_status_id">
							<?php foreach ($order_statuses as $order_status) { ?>
								<?php if ($order_status['order_status_id'] == $config_complete_status_id) { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_return_status; ?>
					</th>
					<td class="textleft">
						<select name="config_return_status_id">
							<?php foreach ($return_statuses as $return_status) { ?>
								<?php if ($return_status['return_status_id'] == $config_return_status_id) { ?>
									<option value="<?php echo $return_status['return_status_id']; ?>" selected="selected"><?php echo $return_status['name']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $return_status['return_status_id']; ?>"><?php echo $return_status['name']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_review; ?>
					</th>
					<td class="textleft">
						<?php if ($config_review_status) { ?>
							<input type="radio" name="config_review_status" value="1" checked="checked" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_review_status" value="0" />
							<?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="config_review_status" value="1" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_review_status" value="0" checked="checked" />
							<?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_article_comments; ?>
					</th>
					<td class="textleft">
						<?php if ($config_comment_status) { ?>
							<input type="radio" name="config_comment_status" value="1" checked="checked" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_comment_status" value="0" />
							<?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="config_comment_status" value="1" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_comment_status" value="0" checked="checked" />
							<?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_download; ?>
					</th>
					<td class="textleft">
						<?php if ($config_download) { ?>
							<input type="radio" name="config_download" value="1" checked="checked" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_download" value="0" />
							<?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="config_download" value="1" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_download" value="0" checked="checked" />
							<?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_upload_allowed; ?>
					</th>
					<td class="textleft">
						<textarea name="config_upload_allowed" cols="40" rows="5"><?php echo $config_upload_allowed; ?></textarea>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_cart_weight; ?>
					</th>
					<td class="textleft">
						<?php if ($config_cart_weight) { ?>
							<input type="radio" name="config_cart_weight" value="1" checked="checked" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_cart_weight" value="0" />
							<?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="config_cart_weight" value="1" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_cart_weight" value="0" checked="checked" />
							<?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
			</tbody>
		</table>
</div>


<div id="tab-image">
		<table class="">
			<tbody>
				<tr>
					<th class="texttop">
						<?php echo $entry_logo; ?>
					</th>
					<td class="textleft">
						<div class="image">
							<img src="<?php echo $logo; ?>" alt="" id="thumb-logo" />
							<input type="hidden" name="config_logo" value="<?php echo $config_logo; ?>" id="logo" />
							<br />
							<a onclick="image_upload('logo', 'thumb-logo');"><?php echo $text_browse; ?></a>
							&nbsp;&nbsp;|&nbsp;&nbsp;
							<a onclick="$('#thumb-logo').attr('src', '<?php echo $logo; ?>'); $('#logo').attr('value', '');"><?php echo $text_clear; ?></a>
						</div>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_icon; ?>
					</th>
					<td class="textleft">
						<div class="image">
							<img src="<?php echo $icon; ?>" alt="" id="thumb-icon" />
							<input type="hidden" name="config_icon" value="<?php echo $config_icon; ?>" id="icon" />
							<br />
							<a onclick="image_upload('icon', 'thumb-icon');"><?php echo $text_browse; ?></a>
							&nbsp;&nbsp;|&nbsp;&nbsp;
							<a onclick="$('#thumb-icon').attr('src', '<?php echo $icon; ?>'); $('#icon').attr('value', '');"><?php echo $text_clear; ?></a>
						</div>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_image_category; ?>
					</th>
					<td class="textleft">
						<?php if ($error_image_category) { ?>
							<input type="text" name="config_image_category_width" value="<?php echo $config_image_category_width; ?>" size="3" class="input_error" />
							x
							<input type="text" name="config_image_category_height" value="<?php echo $config_image_category_height; ?>" size="3" class="input_error" />
						<?php } else { ?>
							<input type="text" name="config_image_category_width" value="<?php echo $config_image_category_width; ?>" size="3" />
							x
							<input type="text" name="config_image_category_height" value="<?php echo $config_image_category_height; ?>" size="3" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_image_thumb; ?>
					</th>
					<td class="textleft">
						<?php if ($error_image_thumb) { ?>
							<input type="text" name="config_image_thumb_width" value="<?php echo $config_image_thumb_width; ?>" size="3" class="input_error" />
							x
							<input type="text" name="config_image_thumb_height" value="<?php echo $config_image_thumb_height; ?>" size="3" class="input_error" />
						<?php } else { ?>
							<input type="text" name="config_image_thumb_width" value="<?php echo $config_image_thumb_width; ?>" size="3" />
							x
							<input type="text" name="config_image_thumb_height" value="<?php echo $config_image_thumb_height; ?>" size="3" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_image_popup; ?>
					</th>
					<td class="textleft">
						<?php if ($error_image_popup) { ?>
							<input type="text" name="config_image_popup_width" value="<?php echo $config_image_popup_width; ?>" size="3" class="input_error" />
							x
							<input type="text" name="config_image_popup_height" value="<?php echo $config_image_popup_height; ?>" size="3" class="input_error" />
						<?php } else { ?>
							<input type="text" name="config_image_popup_width" value="<?php echo $config_image_popup_width; ?>" size="3" />
							x
							<input type="text" name="config_image_popup_height" value="<?php echo $config_image_popup_height; ?>" size="3" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_image_product; ?>
					</th>
					<td class="textleft">
						<?php if ($error_image_product) { ?>
							<input type="text" name="config_image_product_width" value="<?php echo $config_image_product_width; ?>" size="3" class="input_error" />
							x
							<input type="text" name="config_image_product_height" value="<?php echo $config_image_product_height; ?>" size="3" class="input_error" />
						<?php } else { ?>
							<input type="text" name="config_image_product_width" value="<?php echo $config_image_product_width; ?>" size="3" />
							x
							<input type="text" name="config_image_product_height" value="<?php echo $config_image_product_height; ?>" size="3" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_image_additional; ?>
					</th>
					<td class="textleft">
						<?php if ($error_image_additional) { ?>
							<input type="text" name="config_image_additional_width" value="<?php echo $config_image_additional_width; ?>" size="3" class="input_error" />
							x
							<input type="text" name="config_image_additional_height" value="<?php echo $config_image_additional_height; ?>" size="3" class="input_error" />
						<?php } else { ?>
							<input type="text" name="config_image_additional_width" value="<?php echo $config_image_additional_width; ?>" size="3" />
							x
							<input type="text" name="config_image_additional_height" value="<?php echo $config_image_additional_height; ?>" size="3" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_image_related; ?>
					</th>
					<td class="textleft">
						<?php if ($error_image_related) { ?>
							<input type="text" name="config_image_related_width" value="<?php echo $config_image_related_width; ?>" size="3" class="input_error" />
							x
							<input type="text" name="config_image_related_height" value="<?php echo $config_image_related_height; ?>" size="3" class="input_error" />
						<?php } else { ?>
							<input type="text" name="config_image_related_width" value="<?php echo $config_image_related_width; ?>" size="3" />
							x
							<input type="text" name="config_image_related_height" value="<?php echo $config_image_related_height; ?>" size="3" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_image_compare; ?>
					</th>
					<td class="textleft">
						<?php if ($error_image_compare) { ?>
							<input type="text" name="config_image_compare_width" value="<?php echo $config_image_compare_width; ?>" size="3" class="input_error" />
							x
							<input type="text" name="config_image_compare_height" value="<?php echo $config_image_compare_height; ?>" size="3" class="input_error" />
						<?php } else { ?>
							<input type="text" name="config_image_compare_width" value="<?php echo $config_image_compare_width; ?>" size="3" />
							x
							<input type="text" name="config_image_compare_height" value="<?php echo $config_image_compare_height; ?>" size="3" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_image_wishlist; ?>
					</th>
					<td class="textleft">
						<?php if ($error_image_wishlist) { ?>
							<input type="text" name="config_image_wishlist_width" value="<?php echo $config_image_wishlist_width; ?>" size="3" class="input_error" />
							x
							<input type="text" name="config_image_wishlist_height" value="<?php echo $config_image_wishlist_height; ?>" size="3" class="input_error" />
						<?php } else { ?>
							<input type="text" name="config_image_wishlist_width" value="<?php echo $config_image_wishlist_width; ?>" size="3" />
							x
							<input type="text" name="config_image_wishlist_height" value="<?php echo $config_image_wishlist_height; ?>" size="3" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_image_cart; ?>
					</th>
					<td class="textleft">
						<?php if ($error_image_cart) { ?>
							<input type="text" name="config_image_cart_width" value="<?php echo $config_image_cart_width; ?>" size="3" class="input_error" />
							x
							<input type="text" name="config_image_cart_height" value="<?php echo $config_image_cart_height; ?>" size="3" class="input_error" />
						<?php } else { ?>
							<input type="text" name="config_image_cart_width" value="<?php echo $config_image_cart_width; ?>" size="3" />
							x
							<input type="text" name="config_image_cart_height" value="<?php echo $config_image_cart_height; ?>" size="3" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_image_slider; ?>
					</th>
					<td class="textleft">
						<?php if ($error_image_slider) { ?>
							<input type="text" name="config_image_slider_width" value="<?php echo $config_image_slider_width; ?>" size="3" class="input_error" />
							x
							<input type="text" name="config_image_slider_height" value="<?php echo $config_image_slider_height; ?>" size="3" class="input_error" />
						<?php } else { ?>
							<input type="text" name="config_image_slider_width" value="<?php echo $config_image_slider_width; ?>" size="3" />
							x
							<input type="text" name="config_image_slider_height" value="<?php echo $config_image_slider_height; ?>" size="3" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_image_manufacturer; ?>
					</th>
					<td class="textleft">
						<?php if ($error_image_manufacturer) { ?>
							<input type="text" name="config_image_manufacturer_width" value="<?php echo $config_image_manufacturer_width; ?>" size="3" class="input_error" />
							x
							<input type="text" name="config_image_manufacturer_height" value="<?php echo $config_image_manufacturer_height; ?>" size="3" class="input_error" />
						<?php } else { ?>
							<input type="text" name="config_image_manufacturer_width" value="<?php echo $config_image_manufacturer_width; ?>" size="3" />
							x
							<input type="text" name="config_image_manufacturer_height" value="<?php echo $config_image_manufacturer_height; ?>" size="3" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_image_readlist; ?>
					</th>
					<td class="textleft">
						<?php if ($error_image_readlist) { ?>
							<input type="text" name="config_image_readlist_width" value="<?php echo $config_image_readlist_width; ?>" size="3" class="input_error" />
							x
							<input type="text" name="config_image_readlist_height" value="<?php echo $config_image_readlist_height; ?>" size="3" class="input_error" />
						<?php } else { ?>
							<input type="text" name="config_image_readlist_width" value="<?php echo $config_image_readlist_width; ?>" size="3" />
							x
							<input type="text" name="config_image_readlist_height" value="<?php echo $config_image_readlist_height; ?>" size="3" />
						<?php } ?>
					</td>
				</tr>
			</tbody>
		</table>
</div>


<div id="tab-mail">
		<table class="">
			<tbody>
					<tr>
						<th class="texttop">
							<?php echo $entry_mail_protocol; ?>
						</th>
						<td class="textleft">
							<select name="config_mail_protocol">
								<?php if ($config_mail_protocol == 'mail') { ?>
									<option value="mail" selected="selected"><?php echo $text_mail; ?></option>
								<?php } else { ?>
									<option value="mail"><?php echo $text_mail; ?></option>
								<?php } ?>
								<?php if ($config_mail_protocol == 'smtp') { ?>
									<option value="smtp" selected="selected"><?php echo $text_smtp; ?></option>
								<?php } else { ?>
									<option value="smtp"><?php echo $text_smtp; ?></option>
								<?php } ?>
							</select>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_mail_parameter; ?>
						</th>
						<td class="textleft">
							<input type="text" name="config_mail_parameter" value="<?php echo $config_mail_parameter; ?>" />
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_smtp_host; ?>
						</th>
						<td class="textleft">
							<input type="text" name="config_smtp_host" value="<?php echo $config_smtp_host; ?>" />
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_smtp_username; ?>
						</th>
						<td class="textleft">
							<input type="text" name="config_smtp_username" value="<?php echo $config_smtp_username; ?>" />
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_smtp_password; ?>
						</th>
						<td class="textleft">
							<input type="text" name="config_smtp_password" value="<?php echo $config_smtp_password; ?>" />
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_smtp_port; ?>
						</th>
						<td class="textleft">
							<input type="text" name="config_smtp_port" value="<?php echo $config_smtp_port; ?>" />
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_smtp_timeout; ?>
						</th>
						<td class="textleft">
							<input type="text" name="config_smtp_timeout" value="<?php echo $config_smtp_timeout; ?>" />
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_alert_mail; ?>
						</th>
						<td class="textleft">
							<?php if ($config_alert_mail) { ?>
								<input type="radio" name="config_alert_mail" value="1" checked="checked" />
								<?php echo $text_yes; ?>
								<input type="radio" name="config_alert_mail" value="0" />
								<?php echo $text_no; ?>
							<?php } else { ?>
								<input type="radio" name="config_alert_mail" value="1" />
								<?php echo $text_yes; ?>
								<input type="radio" name="config_alert_mail" value="0" checked="checked" />
								<?php echo $text_no; ?>
							<?php } ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_account_mail; ?>
						</th>
						<td class="textleft">
							<?php if ($config_account_mail) { ?>
								<input type="radio" name="config_account_mail" value="1" checked="checked" />
								<?php echo $text_yes; ?>
								<input type="radio" name="config_account_mail" value="0" />
								<?php echo $text_no; ?>
							<?php } else { ?>
								<input type="radio" name="config_account_mail" value="1" />
								<?php echo $text_yes; ?>
								<input type="radio" name="config_account_mail" value="0" checked="checked" />
								<?php echo $text_no; ?>
							<?php } ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_alert_emails; ?>
						</th>
						<td class="textleft">
							<textarea name="config_alert_emails" cols="40" rows="5"><?php echo $config_alert_emails; ?></textarea>
						</td>
					</tr>
			</tbody>
		</table>
</div>


<div id="tab-fraud">
		<table class="">
			<tbody>
					<tr>
						<th class="texttop">
							<?php echo $entry_fraud_detection; ?>
						</th>
						<td class="textleft">
							<?php if ($config_fraud_detection) { ?>
								<input type="radio" name="config_fraud_detection" value="1" checked="checked" />
								<?php echo $text_yes; ?>
								<input type="radio" name="config_fraud_detection" value="0" />
								<?php echo $text_no; ?>
							<?php } else { ?>
								<input type="radio" name="config_fraud_detection" value="1" />
								<?php echo $text_yes; ?>
								<input type="radio" name="config_fraud_detection" value="0" checked="checked" />
								<?php echo $text_no; ?>
							<?php } ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_fraud_key; ?>
						</th>
						<td class="textleft">
							<input type="text" name="config_fraud_key" value="<?php echo $config_fraud_key; ?>" />
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_fraud_score; ?>
						</th>
						<td class="textleft">
							<input type="text" name="config_fraud_score" value="<?php echo $config_fraud_score; ?>" />
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_fraud_status; ?>
						</th>
						<td class="textleft">
							<select name="config_fraud_status_id">
								<?php foreach ($order_statuses as $order_status) { ?>
									<?php if ($order_status['order_status_id'] == $config_fraud_status_id) { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</td>
					</tr>
			</tbody>
		</table>
</div>


<div id="tab-server">
		<table class="">
			<tbody>
				<tr>
					<th class="texttop">
						<?php echo $entry_use_ssl; ?>
					</th>
					<td class="textleft">
						<?php if ($config_use_ssl) { ?>
							<input type="radio" name="config_use_ssl" value="1" checked="checked" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_use_ssl" value="0" />
							<?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="config_use_ssl" value="1" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_use_ssl" value="0" checked="checked" />
							<?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_seo_url; ?>
					</th>
					<td class="textleft">
						<?php if ($config_seo_url) { ?>
							<input type="radio" name="config_seo_url" value="1" checked="checked" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_seo_url" value="0" />
							<?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="config_seo_url" value="1" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_seo_url" value="0" checked="checked" />
							<?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_maintenance; ?>
					</th>
					<td class="textleft">
						<?php if ($config_maintenance) { ?>
							<input type="radio" name="config_maintenance" value="1" checked="checked" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_maintenance" value="0" />
							<?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="config_maintenance" value="1" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_maintenance" value="0" checked="checked" />
							<?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_encryption; ?>
					</th>
					<td class="textleft">
						<input type="text" name="config_encryption" value="<?php echo $config_encryption; ?>" />
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_compression; ?>
					</th>
					<td class="textleft">
						<input type="text" name="config_compression" value="<?php echo $config_compression; ?>" size="3" />
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_error_display; ?>
					</th>
					<td class="textleft">
						<?php if ($config_error_display) { ?>
							<input type="radio" name="config_error_display" value="1" checked="checked" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_error_display" value="0" />
							<?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="config_error_display" value="1" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_error_display" value="0" checked="checked" />
							<?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_error_log; ?>
					</th>
					<td class="textleft">
						<?php if ($config_error_log) { ?>
							<input type="radio" name="config_error_log" value="1" checked="checked" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_error_log" value="0" />
							<?php echo $text_no; ?>
						<?php } else { ?>
							<input type="radio" name="config_error_log" value="1" />
							<?php echo $text_yes; ?>
							<input type="radio" name="config_error_log" value="0" checked="checked" />
							<?php echo $text_no; ?>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_error_filename; ?>
					</th>
					<td class="textleft">
						<?php if ($error_error_filename) { ?>
							<input type="text" name="config_error_filename" value="<?php echo $config_error_filename; ?>" placeholder="<?php echo $error_error_filename; ?>" class="input_error" />
						<?php } else { ?>
							<input type="text" name="config_error_filename" value="<?php echo $config_error_filename; ?>" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_google_analytics; ?>
					</th>
					<td class="textleft">
						<textarea name="config_google_analytics" cols="40" rows="5"><?php echo $config_google_analytics; ?></textarea>
					</td>
				</tr>
			</tbody>
		</table>
</div>


<script type="text/javascript"><!--
$('#template').load('index.php?route=setting/setting/template&token=<?php echo $token; ?>&template=' + encodeURIComponent($('select[name=\'config_template\']').attr('value')));

$('select[name=\'config_zone_id\']').load('index.php?route=setting/setting/zone&token=<?php echo $token; ?>&country_id=<?php echo $config_country_id; ?>&zone_id=<?php echo $config_zone_id; ?>');
//--></script>
<script type="text/javascript"><!--
// image manager
var text_image_manager = "<?php echo $text_image_manager; ?>";
var token = "<?php echo $token; ?>";
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