<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/order.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<div class="htabs">
			<a href="#tab-order"><?php echo $tab_order; ?></a>
			<a href="#tab-payment"><?php echo $tab_payment; ?></a>
			<?php if ($shipping_method) { ?>
				<a href="#tab-shipping"><?php echo $tab_shipping; ?></a>
			<?php } ?>
			<a href="#tab-product"><?php echo $tab_product; ?></a>
			<a href="#tab-history"><?php echo $tab_order_history; ?></a>
			<?php if ($maxmind_id) { ?>
				<a href="#tab-fraud"><?php echo $tab_fraud; ?></a>
			<?php } ?>
		</div>


<div id="tab-order" class="htabs-content">
		<table class="">
			<tbody>
					<tr>
						<th class="texttop">
							<?php echo $entry_order_id; ?>
						</th>
						<td class="textleft">
							#<?php echo $order_id; ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_invoice_no; ?>
						</th>
						<td class="textleft">
							<?php if ($invoice_no) { ?>
								<?php echo $invoice_no; ?>
							<?php } else { ?>
								<span id="invoice">
									[ <a id="invoice-create"><?php echo $text_create_invoice_no; ?></a> ]
								</span>
							<?php } ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_store_name; ?>
						</th>
						<td class="textleft">
							<?php echo $store_name; ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_store_url; ?>
						</th>
						<td class="textleft">
							<a onclick="window.open('<?php echo $store_url; ?>');"><?php echo $store_url; ?></a>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_customer; ?>
						</th>
						<td class="textleft">
							<?php if ($customer) { ?>
								<a href="<?php echo $customer; ?>"><?php echo $firstname; ?> <?php echo $lastname; ?></a>
							<?php } else { ?>
								<?php echo $firstname; ?> <?php echo $lastname; ?>
							<?php } ?>
						</td>
					</tr>
					<?php if ($customer_group) { ?>
						<tr>
							<th class="texttop">
								<?php echo $entry_customer_group; ?>
							</th>
							<td class="textleft">
								<?php echo $customer_group; ?>
							</td>
						<tr>
					<?php } ?>
					</tr>
						<th class="texttop">
							<?php echo $entry_email; ?>
						</th>
						<td class="textleft">
							<?php echo $email; ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_telephone; ?>
						</th>
						<td class="textleft">
							<?php echo $telephone; ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_fax; ?>
						</th>
						<td class="textleft">
							<?php echo $fax; ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_total; ?>
						</th>
						<td class="textleft">
							<?php echo $total; ?>
							<?php if ($credit && $customer) { ?>
								<?php if (!$credit_total) { ?>
									<span id="credit">
										[ <a id="credit-add"><?php echo $text_credit_add; ?></a> ]
									</span>
								<?php } else { ?>
									<span id="credit">
										[ <a id="credit-remove"><?php echo $text_credit_remove; ?></a> ]
									</span>
								<?php } ?>
							<?php } ?>
						</td>
					</tr>
					<?php if ($reward && $customer) { ?>
						<tr>
							<th class="texttop">
								<?php echo $entry_reward; ?>
							</th>
							<td class="textleft">
								<?php echo $reward; ?>
								<?php if (!$reward_total) { ?>
									<span id="reward">
										[ <a id="reward-add"><?php echo $text_reward_add; ?></a> ]
									</span>
								<?php } else { ?>
									<span id="reward">
										[ <a id="reward-remove"><?php echo $text_reward_remove; ?></a> ]
									</span>
								<?php } ?>
							</td>
						</tr>
					<?php } ?>
					<?php if ($order_status) { ?>
						<tr>
							<th class="texttop">
								<?php echo $entry_order_status; ?>
							</th>
							<td class="textleft" id="order-status">
								<?php echo $order_status; ?>
							</td>
						</tr>
					<?php } ?>
					<?php if ($comment) { ?>
						<tr>
							<th class="texttop">
								<?php echo $entry_comment; ?>
							</th>
							<td class="textleft">
								<?php echo $comment; ?>
							</td>
						</tr>
					<?php } ?>
					<?php if ($affiliate) { ?>
						<tr>
							<th class="texttop">
								<?php echo $entry_affiliate; ?>
							</th>
							<td class="textleft">
								<a href="<?php echo $affiliate; ?>"><?php echo $affiliate_firstname; ?> <?php echo $affiliate_lastname; ?></a>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_commission; ?>
							</th>
							<td class="textleft">
								<?php echo $commission; ?>
								<?php if (!$commission_total) { ?>
									<span id="commission">
										[ <a id="commission-add"><?php echo $text_commission_add; ?></a> ]
									</span>
								<?php } else { ?>
									<span id="commission">
										[ <a id="commission-remove"><?php echo $text_commission_remove; ?></a> ]
									</span>
								<?php } ?>
							</td>
						</tr>
					<?php } ?>
					<?php if ($ip) { ?>
						<tr>
							<th class="texttop">
								<?php echo $entry_ip; ?>
							</th>
							<td class="textleft">
								<?php echo $ip; ?>
							</td>
						</tr>
					<?php } ?>
					<?php if ($forwarded_ip) { ?>
						<tr>
							<th class="texttop">
								<?php echo $entry_forwarded_ip; ?>
							</th>
							<td class="textleft">
								<?php echo $forwarded_ip; ?>
							</td>
						</tr>
					<?php } ?>
					<?php if ($user_agent) { ?>
						<tr>
							<th class="texttop">
								<?php echo $entry_user_agent; ?>
							</th>
							<td class="textleft">
								<?php echo $user_agent; ?>
							</td>
						</tr>
					<?php } ?>
					<?php if ($accept_language) { ?>
						<tr>
							<th class="texttop">
								<?php echo $entry_accept_language; ?>
							</th>
							<td class="textleft">
								<?php echo $accept_language; ?>
							</td>
						</tr>
					<?php } ?>
					<tr>
						<th class="texttop">
							<?php echo $entry_date_added; ?>
						</th>
						<td class="textleft">
							<?php echo $date_added; ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_date_modified; ?>
						</th>
						<td class="textleft">
							<?php echo $date_modified; ?>
						</td>
					</tr>
			</tbody>
		</table>
</div>


<div id="tab-payment" class="htabs-content">
		<table class="">
			<tbody>
					<tr>
						<th class="texttop">
							<?php echo $entry_firstname; ?>
						</th>
						<td class="textleft">
							<?php echo $payment_firstname; ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_lastname; ?>
						</th>
						<td class="textleft">
							<?php echo $payment_lastname; ?>
						</td>
					</tr>
					<?php if ($payment_company) { ?>
						<tr>
							<th class="texttop">
								<?php echo $entry_company; ?>
							</th>
							<td class="textleft">
								<?php echo $payment_company; ?>
							</td>
						</tr>
					<?php } ?>
					<tr>
						<th class="texttop">
							<?php echo $entry_address_1; ?>
						</th>
						<td class="textleft">
							<?php echo $payment_address_1; ?>
						</td>
					</tr>
					<?php if ($payment_address_2) { ?>
						<tr>
							<th class="texttop">
								<?php echo $entry_address_2; ?>
							</th>
							<td class="textleft">
								<?php echo $payment_address_2; ?>
							</td>
						</tr>
					<?php } ?>
					<tr>
						<th class="texttop">
							<?php echo $entry_city; ?>
						</th>
						<td class="textleft">
							<?php echo $payment_city; ?>
						</td>
					</tr>
					<?php if ($payment_postcode) { ?>
						<tr>
							<th class="texttop">
								<?php echo $entry_postcode; ?>
							</th>
							<td class="textleft">
								<?php echo $payment_postcode; ?>
							</td>
						</tr>
					<?php } ?>
					<?php if ($payment_zone_code) { ?>
						<tr>
							<th class="texttop">
								<?php echo $entry_zone; ?>
							</th>
							<td class="textleft">
								<?php echo $payment_zone_code; ?>
							</td>
						</tr>
					<?php } ?>
					<tr>
						<th class="texttop">
							<?php echo $entry_country; ?>
						</th>
						<td class="textleft">
							<?php echo $payment_country; ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_payment_method; ?>
						</th>
						<td class="textleft">
							<?php echo $payment_method; ?>
						</td>
					</tr>
			</tbody>
		</table>
</div>

<?php if ($shipping_method) { ?>
	<div id="tab-shipping" class="htabs-content">
		<table class="">
			<tbody>
					<tr>
						<th class="texttop">
							<?php echo $entry_firstname; ?>
						</th>
						<td class="textleft">
							<?php echo $shipping_firstname; ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_lastname; ?>
						</th>
						<td class="textleft">
							<?php echo $shipping_lastname; ?>
						</td>
					</tr>
					<?php if ($shipping_company) { ?>
						<tr>
							<th class="texttop">
								<?php echo $entry_company; ?>
							</th>
							<td class="textleft">
								<?php echo $shipping_company; ?>
							</td>
						</tr>
					<?php } ?>
					<tr>
						<th class="texttop">
							<?php echo $entry_address_1; ?>
						</th>
						<td class="textleft">
							<?php echo $shipping_address_1; ?>
						</td>
					</tr>
					<?php if ($shipping_address_2) { ?>
						<tr>
							<th class="texttop">
								<?php echo $entry_address_2; ?>
							</th>
							<td class="textleft">
								<?php echo $shipping_address_2; ?>
							</td>
						</tr>
					<?php } ?>
					<tr>
						<th class="texttop">
							<?php echo $entry_city; ?>
						</th>
						<td class="textleft">
							<?php echo $shipping_city; ?>
						</td>
					</tr>
					<?php if ($shipping_postcode) { ?>
						<tr>
							<th class="texttop">
								<?php echo $entry_postcode; ?>
							</th>
							<td class="textleft">
								<?php echo $shipping_postcode; ?>
							</td>
						</tr>
					<?php } ?>
					<?php if ($shipping_zone_code) { ?>
						<tr>
							<th class="texttop">
								<?php echo $entry_zone; ?>
							</th>
							<td class="textleft">
								<?php echo $shipping_zone_code; ?>
							</td>
						</tr>
					<?php } ?>
					<tr>
						<th class="texttop">
							<?php echo $entry_country; ?>
						</th>
						<td class="textleft">
							<?php echo $shipping_country; ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_shipping_method; ?>
						</th>
						<td class="textleft">
							<?php echo $shipping_method; ?>
						</td>
					</tr>
			</tbody>
		</table>
	</div>
<?php } ?>

<div id="tab-product" class="htabs-content">
		<table id="datatable" class="datatable">
			<thead>
				<tr>
					<th scope="col" class="textleft"><?php echo $column_product; ?></th>
					<th scope="col" class="center"><?php echo $column_model; ?></th>
					<th scope="col" class="center"><?php echo $column_quantity; ?></th>
					<th scope="col" class="center"><?php echo $column_price; ?></th>
					<th scope="col" class="center"><?php echo $column_total; ?></th>
				</tr>
			</thead>
			<?php foreach ($products as $product) { ?>
				<tbody id="product-row<?php echo $product['order_product_id']; ?>">
					<tr>
						<td scope="row" class="textleft">
							<?php if ($product['product_id']) { ?>
								<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
							<?php } else { ?>
								<?php echo $product['name']; ?>
							<?php } ?>
							<?php foreach ($product['option'] as $option) { ?>
								<br />
								<?php if ($option['type'] != 'file') { ?>
									&nbsp; - <?php echo $option['name']; ?>: <?php echo $option['value']; ?>
								<?php } else { ?>
									&nbsp; - <?php echo $option['name']; ?>: <a href="<?php echo $option['href']; ?>"><?php echo $option['value']; ?></a>
								<?php } ?>
							<?php } ?>
						</td>
						<td scope="row" class="">
							<?php echo $product['model']; ?>
						</td>
						<td scope="row" class="">
							<?php echo $product['quantity']; ?>
						</td>
						<td scope="row" class="">
							<?php echo $product['price']; ?>
						</td>
						<td scope="row" class="">
							<?php echo $product['total']; ?>
						</td>
					</tr>
				</tbody>
			<?php } ?>
		</table>
		<table id="" class="">
			<tbody id="totals">
				<?php foreach ($totals as $total) { ?>
					<tr>
						<th scope="row" class="textright" colspan="">
							<?php echo $total['title']; ?>:
						</th>
						<td scope="row" class="textright">
							<?php echo $total['text']; ?>
						</td>
					</tr>
				<?php } ?>
			</tbody>
		</table>
		<?php if ($downloads) { ?>
			<h3>
				<?php echo $text_download; ?>
			</h3>
			<table id="datatable" class="datatable">
				<thead>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_download; ?></th>
						<th scope="col" class="center"><?php echo $column_filename; ?></th>
						<th scope="col" class="center"><?php echo $column_remaining; ?></th>
					</tr>
				</thead>
				<tbody id="">
					<?php foreach ($downloads as $download) { ?>
						<tr>
							<td scope="row" class="">
								<?php echo $download['name']; ?>
							</td>
							<td scope="row" class="">
								<?php echo $download['filename']; ?>
							</td>
							<td scope="row" class="">
								<?php echo $download['remaining']; ?>
							</td>
						</tr>
					</tbody>
				<?php } ?>
			</table>
		<?php } ?>
</div>

<div id="tab-history" class="htabs-content">
		<div id="history"></div>
		<table class="">
			<tbody>
					<tr>
						<th class="texttop">
							<?php echo $entry_order_status; ?>
						</th>
						<td class="textleft">
							<select name="order_status_id">
								<?php foreach ($order_statuses as $order_statuses) { ?>
									<?php if ($order_statuses['order_status_id'] == $order_status_id) { ?>
										<option value="<?php echo $order_statuses['order_status_id']; ?>" selected="selected"><?php echo $order_statuses['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $order_statuses['order_status_id']; ?>"><?php echo $order_statuses['name']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_notify; ?>
						</th>
						<td class="textleft">
							<input type="checkbox" name="notify" value="1" />
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $entry_comment; ?>
						</th>
						<td class="textleft">
							<textarea name="comment" cols="40" rows="8" style="width: 99%"></textarea>
							<br />
							<br />
							<a onclick="history();" id="button-history" class="button button_green right"><?php echo $button_add_history; ?></a>
						</td>
					</tr>
				</tbody>
			</table>
</div>

<?php if ($maxmind_id) { ?>
	<div id="tab-fraud" class="htabs-content">
		<table class="">
			<tbody>
				<tr>
					<th class="texttop">
						<?php echo $entry_country_match; ?>
					</th>
					<td class="textleft">
						<?php echo $country_match; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_country_code; ?>
					</th>
					<td class="textleft">
						<?php echo $country_code; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_high_risk_country; ?>
					</th>
					<td class="textleft">
						<?php echo $high_risk_country; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_distance; ?>
					</th>
					<td class="textleft">
						<?php echo $distance; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_region; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_region; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_city; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_city; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_latitude; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_latitude; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_longitude; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_longitude; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_isp; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_isp; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_org; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_org; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_asnum; ?>
					</th>
					<td class="textleft">
						<?php echo $entry_ip_asnum; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_user_type; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_user_type; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_country_confidence; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_country_confidence; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_region_confidence; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_region_confidence; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_city_confidence; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_city_confidence; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_postal_confidence; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_postal_confidence; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_postal_code; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_postal_code; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_accuracy_radius; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_accuracy_radius; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_net_speed_cell; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_net_speed_cell; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_metro_code; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_metro_code; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_area_code; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_area_code; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_time_zone; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_time_zone; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_region_name; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_region_name; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_domain; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_domain; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_country_name; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_country_name; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_continent_code; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_continent_code; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ip_corporate_proxy; ?>
					</th>
					<td class="textleft">
						<?php echo $ip_corporate_proxy; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_anonymous_proxy; ?>
					</th>
					<td class="textleft">
						<?php echo $anonymous_proxy; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_proxy_score; ?>
					</th>
					<td class="textleft">
						<?php echo $proxy_score; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_is_trans_proxy; ?>
					</th>
					<td class="textleft">
						<?php echo $is_trans_proxy; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_free_mail; ?>
					</th>
					<td class="textleft">
						<?php echo $free_mail; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_carder_email; ?>
					</th>
					<td class="textleft">
						<?php echo $carder_email; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_firstname; ?>
					</th>
					<td class="textleft">
						<?php echo $shipping_firstname; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_high_risk_username; ?>
					</th>
					<td class="textleft">
						<?php echo $high_risk_username; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_high_risk_password; ?>
					</th>
					<td class="textleft">
						<?php echo $high_risk_password; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_bin_match; ?>
					</th>
					<td class="textleft">
						<?php echo $bin_match; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_bin_country; ?>
					</th>
					<td class="textleft">
						<?php echo $bin_country; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_bin_name_match; ?>
					</th>
					<td class="textleft">
						<?php echo $bin_name_match; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_bin_name; ?>
					</th>
					<td class="textleft">
						<?php echo $bin_name; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_bin_phone_match; ?>
					</th>
					<td class="textleft">
						<?php echo $bin_phone_match; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_customer_phone_in_billing_location; ?>
					</th>
					<td class="textleft">
						<?php echo $customer_phone_in_billing_location; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_ship_forward; ?>
					</th>
					<td class="textleft">
						<?php echo $ship_forward; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_city_postal_match; ?>
					</th>
					<td class="textleft">
						<?php echo $city_postal_match; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_score; ?>
					</th>
					<td class="textleft">
						<?php echo $score; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_explanation; ?>
					</th>
					<td class="textleft">
						<?php echo $explanation; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_risk_score; ?>
					</th>
					<td class="textleft">
						<?php echo $risk_score; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_queries_remaining; ?>
					</th>
					<td class="textleft">
						<?php echo $queries_remaining; ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_maxmind_id; ?>
					</th>
					<td class="textleft">
						<?php echo $maxmind_id; ?>
					</td>
				</tr>
				<?php if ($error) { ?>
					<tr>
						<th class="texttop">
							<?php echo $entry_error; ?>
						</th>
						<td class="textleft">
							<?php echo $error; ?>
						</td>
					</tr>
				<?php } ?>
			</tbody>
		</table>
	</div>
<?php } ?>


<script type="text/javascript"><!--
$('#invoice-create').live('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/createinvoiceno&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		dataType: 'json',
		beforeSend: function() {
			$('#invoice').after('<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		},
		complete: function() {
			$('.loading').remove();
		},
		success: function(json) {
			$('.success').remove();
			$('.warning').remove();

			if (json['error']) {
				$('#tab-order').prepend('<div class="warning" style="display: none;">' + json['error'] + '</div>');

				$('.warning').fadeIn('slow');
			}
			if (json.invoice_no) {
				$('#invoice').fadeOut('slow', function() {
					$('#invoice').html(json['invoice_no']);

					$('#invoice').fadeIn('slow');
				});
			}
		}
	});
});

$('#credit-add').live('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/addcredit&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#credit').after('<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		},
		complete: function() {
			$('.loading').remove();
		},		success: function(json) {
			$('.success').remove();
			$('.warning').remove();
			if (json['error']) {
				$('.breadcrumb').after('<div class="warning" style="display: none;">' + json['error'] + '</div>');

				$('.warning').fadeIn('slow');
			}
			if (json['success']) {
		        $('.breadcrumb').after('<div class="success" style="display: none;">' + json['success'] + '</div>');

				$('.success').fadeIn('slow');

				$('#credit').html('<b>[</b> <a id="credit-remove"><?php echo $text_credit_remove; ?></a> <b>]</b>');
			}
		}
	});
});

$('#credit-remove').live('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/removecredit&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#credit').after('<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		},
		complete: function() {
			$('.loading').remove();
		},		success: function(json) {
			$('.success').remove();
			$('.warning').remove();

			if (json['error']) {
				 $('.breadcrumb').after('<div class="warning" style="display: none;">' + json['error'] + '</div>');

				$('.warning').fadeIn('slow');
			}
			if (json['success']) {
		         $('.breadcrumb').after('<div class="success" style="display: none;">' + json['success'] + '</div>');

				$('.success').fadeIn('slow');

				$('#credit').html('<b>[</b> <a id="credit-add"><?php echo $text_credit_add; ?></a> <b>]</b>');
			}
		}
	});
});

$('#reward-add').live('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/addreward&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#reward').after('<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		},
		complete: function() {
			$('.loading').remove();
		},
		success: function(json) {
			$('.success').remove();
			$('.warning').remove();

			if (json['error']) {
				 $('.breadcrumb').after('<div class="warning" style="display: none;">' + json['error'] + '</div>');

				$('.warning').fadeIn('slow');
			}
			if (json['success']) {
		         $('.breadcrumb').after('<div class="success" style="display: none;">' + json['success'] + '</div>');

				$('.success').fadeIn('slow');

				$('#reward').html('<b>[</b> <a id="reward-remove"><?php echo $text_reward_remove; ?></a> <b>]</b>');
			}
		}
	});
});

$('#reward-remove').live('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/removereward&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#reward').after('<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		},
		complete: function() {
			$('.loading').remove();
		},
		success: function(json) {
			$('.success').remove();
			$('.warning').remove();

			if (json['error']) {
				 $('.breadcrumb').after('<div class="warning" style="display: none;">' + json['error'] + '</div>');

				$('.warning').fadeIn('slow');
			}
			if (json['success']) {
		         $('.breadcrumb').after('<div class="success" style="display: none;">' + json['success'] + '</div>');

				$('.success').fadeIn('slow');

				$('#reward').html('<b>[</b> <a id="reward-add"><?php echo $text_reward_add; ?></a> <b>]</b>');
			}
		}
	});
});

$('#commission-add').live('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/addcommission&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#commission').after('<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		},
		complete: function() {
			$('.loading').remove();
		},		success: function(json) {
			$('.success').remove();
			$('.warning').remove();

			if (json['error']) {
				 $('.breadcrumb').after('<div class="warning" style="display: none;">' + json['error'] + '</div>');

				$('.warning').fadeIn('slow');
			}
			if (json['success']) {
		         $('.breadcrumb').after('<div class="success" style="display: none;">' + json['success'] + '</div>');

				$('.success').fadeIn('slow');

				$('#commission').html('<b>[</b> <a id="commission-remove"><?php echo $text_commission_remove; ?></a> <b>]</b>');
			}
		}
	});
});

$('#commission-remove').live('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/removecommission&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#commission').after('<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		},
		complete: function() {
			$('.loading').remove();
		},		success: function(json) {
			$('.success').remove();
			$('.warning').remove();

			if (json['error']) {
				 $('.breadcrumb').after('<div class="warning" style="display: none;">' + json['error'] + '</div>');

				$('.warning').fadeIn('slow');
			}
			if (json['success']) {
		         $('.breadcrumb').after('<div class="success" style="display: none;">' + json['success'] + '</div>');

				$('.success').fadeIn('slow');

				$('#commission').html('<b>[</b> <a id="commission-add"><?php echo $text_commission_add; ?></a> <b>]</b>');
			}
		}
	});
});

$('#history .pagination a').live('click', function() {
	$('#history').load(this.href);
	return false;
});
$('#history').load('index.php?route=sale/order/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');

function history() {
	$.ajax({
		url: 'index.php?route=sale/order/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'html',
		data: 'order_status_id=' + encodeURIComponent($('select[name=\'order_status_id\']').val()) + '&notify=' + encodeURIComponent($('input[name=\'notify\']').attr('checked') ? 1 : 0) + '&append=' + encodeURIComponent($('input[name=\'append\']').attr('checked') ? 1 : 0) + '&comment=' + encodeURIComponent($('textarea[name=\'comment\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-history').attr('disabled', true);
			$('#history').prepend('<div class="attention"><img src="view/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-history').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(html) {
			$('#history').html(html);

			$('textarea[name=\'comment\']').val('');

			$('#order-status').html($('select[name=\'order_status_id\'] option:selected').text());
		}
	});
}
//--></script>


			<div class="button_container container_grey">
				<a onclick="location = '<?php echo $cancel; ?>';" class="button button_red left"><?php echo $button_cancel; ?></a>
				<a onclick="window.open('<?php echo $invoice; ?>');" class="button button_blue right"><?php echo $button_invoice; ?></a>
			</div>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>