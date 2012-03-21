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
						<th scope="col" class="center"><?php echo $column_merchant_id; ?></th>
						<th scope="col" class="center"><?php echo $column_security; ?></th>
						<th scope="col" class="center"><?php echo $column_callback; ?></th>
						<th scope="col" class="center"><?php echo $column_total; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<?php if ($error_merchant) { ?>
									<input type="text" name="alertpay_merchant" value="<?php echo $alertpay_merchant; ?>" placeholder="<?php echo $error_merchant; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="alertpay_merchant" value="<?php echo $alertpay_merchant; ?>" />
								<?php } ?>
							</td>
							<td class="">
								<?php if ($error_security) { ?>
									<input type="text" name="alertpay_security" value="<?php echo $alertpay_security; ?>" placeholder="<?php echo $error_security; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="alertpay_security" value="<?php echo $alertpay_security; ?>" />
								<?php } ?>
							</td>
							<td class="textcenter">
								<textarea cols="40" rows="5"><?php echo $callback; ?></textarea>
								<?php echo $text_callback_hint; ?>
							</td>
							<td>
								<input type="text" name="alertpay_total" value="<?php echo $alertpay_total; ?>" />
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
								<select name="alertpay_order_status_id">
									<?php foreach ($order_statuses as $order_status) { ?>
										<?php if ($order_status['order_status_id'] == $alertpay_order_status_id) { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="">
								<select name="alertpay_geo_zone_id">
									<option value="0"><?php echo $text_all_zones; ?></option>
									<?php foreach ($geo_zones as $geo_zone) { ?>
										<?php if ($geo_zone['geo_zone_id'] == $alertpay_geo_zone_id) { ?>
											<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="textcenter">
								<input type="text" name="alertpay_sort_order" value="<?php echo $alertpay_sort_order; ?>" size="1" />
							</td>
							<td class="">
								<select name="alertpay_status">
									<?php if ($alertpay_status) { ?>
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