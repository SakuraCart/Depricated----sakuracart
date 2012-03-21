<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/money.png" alt="payment" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">


			<div class="htabs">
				<a href="#tab-registration"><?php echo $tab_registration; ?></a>
				<a href="#tab-debug"><?php echo $tab_debug; ?></a>
				<a href="#tab-general"><?php echo $tab_general; ?></a>
			</div>

			<div id="tab-registration" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_vendor; ?></th>
						<th scope="col" class="center"><?php echo $column_user; ?></th>
						<th scope="col" class="center"><?php echo $column_password; ?></th>
						<th scope="col" class="center"><?php echo $column_partner; ?></th>
						<th scope="col" class="center"><?php echo $column_transaction; ?></th>
						<th scope="col" class="center"><?php echo $column_total; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<?php if ($error_vendor) { ?>
									<input type="text" name="pp_pro_uk_vendor" value="<?php echo $pp_pro_uk_vendor; ?>" placeholder="<?php echo $error_vendor; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="pp_pro_uk_vendor" value="<?php echo $pp_pro_uk_vendor; ?>" />
								<?php } ?>
								<?php echo $text_vendor_hint; ?>
							</td>
							<td class="">
								<?php if ($error_user) { ?>
									<input type="text" name="pp_pro_uk_user" value="<?php echo $pp_pro_uk_user; ?>" placeholder="<?php echo $error_user; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="pp_pro_uk_user" value="<?php echo $pp_pro_uk_user; ?>" />
								<?php } ?>
								<?php echo $text_user_hint; ?>
							</td>
							<td class="">
								<?php if ($error_password) { ?>
									<input type="text" name="pp_pro_uk_password" value="<?php echo $pp_pro_uk_password; ?>" placeholder="<?php echo $error_password; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="pp_pro_uk_password" value="<?php echo $pp_pro_uk_password; ?>" />
								<?php } ?>
								<?php echo $text_password_hint; ?>
							</td>
							<td class="">
								<?php if ($error_partner) { ?>
									<input type="text" name="pp_pro_uk_partner" value="<?php echo $pp_pro_uk_partner; ?>" placeholder="<?php echo $error_partner; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="pp_pro_uk_partner" value="<?php echo $pp_pro_uk_partner; ?>" />
								<?php } ?>
								<?php echo $text_partner_hint; ?>
							</td>
							<td>
								<select name="pp_pro_uk_transaction">
									<?php if (!$pp_pro_uk_transaction) { ?>
										<option value="0" selected="selected"><?php echo $text_authorization; ?></option>
									<?php } else { ?>
										<option value="0"><?php echo $text_authorization; ?></option>
									<?php } ?>
									<?php if ($pp_pro_uk_transaction) { ?>
										<option value="1" selected="selected"><?php echo $text_sale; ?></option>
									<?php } else { ?>
										<option value="1"><?php echo $text_sale; ?></option>
									<?php } ?>
								</select>
							</td>
							<td>
								<input type="text" name="pp_pro_uk_total" value="<?php echo $pp_pro_uk_total; ?>" />
								<?php echo $text_total_hint; ?>
							</td>
						</tr>
				</tbody>
			</table>
			</div>


			<div id="tab-debug" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_test; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="textcenter">
								<?php if ($pp_pro_uk_test) { ?>
									<input type="radio" name="pp_pro_uk_test" value="1" checked="checked" />
									<?php echo $text_yes; ?>
									<input type="radio" name="pp_pro_uk_test" value="0" />
									<?php echo $text_no; ?>
								<?php } else { ?>
									<input type="radio" name="pp_pro_uk_test" value="1" />
									<?php echo $text_yes; ?>
									<input type="radio" name="pp_pro_uk_test" value="0" checked="checked" />
									<?php echo $text_no; ?>
								<?php } ?>
								<?php echo $text_test_hint; ?>
							</td>
						</tr>
				</tbody>
			</table>
			</div>


			<div id="tab-general" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_order_status; ?></th>
						<th scope="col" class="center"><?php echo $column_geo_zone; ?></th>
						<th scope="col" class="center"><?php echo $column_sort_order; ?></th>
						<th scope="col" class="center"><?php echo $column_action; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>
								<select name="pp_pro_uk_order_status_id">
									<?php foreach ($order_statuses as $order_status) { ?>
										<?php if ($order_status['order_status_id'] == $pp_pro_uk_order_status_id) { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="">
								<select name="pp_pro_uk_geo_zone_id">
									<option value="0"><?php echo $text_all_zones; ?></option>
									<?php foreach ($geo_zones as $geo_zone) { ?>
										<?php if ($geo_zone['geo_zone_id'] == $pp_pro_uk_geo_zone_id) { ?>
											<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="textcenter">
								<input type="text" name="pp_pro_uk_sort_order" value="<?php echo $pp_pro_uk_sort_order; ?>" size="1" />
							</td>
							<td class="">
								<select name="pp_pro_uk_status">
									<?php if ($pp_pro_uk_status) { ?>
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