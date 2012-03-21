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
				<a href="#tab-general"><?php echo $tab_general; ?></a>
			</div>

			<div id="tab-registration" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_merchant; ?></th>
						<th scope="col" class="center"><?php echo $column_password; ?></th>
						<th scope="col" class="center"><?php echo $column_callback; ?></th>
						<th scope="col" class="center"><?php echo $column_test; ?></th>
						<th scope="col" class="center"><?php echo $column_total; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<?php if ($error_merchant) { ?>
									<input type="text" name="worldpay_merchant" value="<?php echo $worldpay_merchant; ?>" placeholder="<?php echo $error_merchant; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="worldpay_merchant" value="<?php echo $worldpay_merchant; ?>" />
								<?php } ?>
							</td>
							<td class="">
								<?php if ($error_password) { ?>
									<input type="text" name="worldpay_password" value="<?php echo $worldpay_password; ?>" placeholder="<?php echo $error_password; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="worldpay_password" value="<?php echo $worldpay_password; ?>" />
								<?php } ?>
								<?php echo $text_password_hint; ?>
							</td>
							<td class="textcenter">
								<textarea cols="40" rows="5"><?php echo $callback; ?></textarea>
								<?php echo $text_callback_hint; ?>
							</td>
							<td>
								<select name="worldpay_test">
									<?php if ($worldpay_test == '0') { ?>
										<option value="0" selected="selected"><?php echo $text_off; ?></option>
									<?php } else { ?>
										<option value="0"><?php echo $text_off; ?></option>
									<?php } ?>
									<?php if ($worldpay_test == '100') { ?>
										<option value="100" selected="selected"><?php echo $text_successful; ?></option>
									<?php } else { ?>
										<option value="100"><?php echo $text_successful; ?></option>
									<?php } ?>
									<?php if ($worldpay_test == '101') { ?>
										<option value="101" selected="selected"><?php echo $text_declined; ?></option>
									<?php } else { ?>
										<option value="101"><?php echo $text_declined; ?></option>
									<?php } ?>
								</select>
							</td>
							<td>
								<input type="text" name="worldpay_total" value="<?php echo $worldpay_total; ?>" />
								<?php echo $text_total_hint; ?>
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
								<select name="worldpay_order_status_id">
									<?php foreach ($order_statuses as $order_status) { ?>
										<?php if ($order_status['order_status_id'] == $worldpay_order_status_id) { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="">
								<select name="worldpay_geo_zone_id">
									<option value="0"><?php echo $text_all_zones; ?></option>
									<?php foreach ($geo_zones as $geo_zone) { ?>
										<?php if ($geo_zone['geo_zone_id'] == $worldpay_geo_zone_id) { ?>
											<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="textcenter">
								<input type="text" name="worldpay_sort_order" value="<?php echo $worldpay_sort_order; ?>" size="1" />
							</td>
							<td class="">
								<select name="worldpay_status">
									<?php if ($worldpay_status) { ?>
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