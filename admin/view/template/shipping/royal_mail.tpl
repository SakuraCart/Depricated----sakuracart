<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/shipping.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

		<div class="vtabs">
			<a href="#tab-general"><?php echo $tab_general; ?></a>
			<a href="#tab-1st-class-standard"><?php echo $tab_1st_class_standard; ?></a>
			<a href="#tab-1st-class-recorded"><?php echo $tab_1st_class_recorded; ?></a>
			<a href="#tab-2nd-class-standard"><?php echo $tab_2nd_class_standard; ?></a>
			<a href="#tab-2nd-class-recorded"><?php echo $tab_2nd_class_recorded; ?></a>
			<a href="#tab-special-delivery-500"><?php echo $tab_special_delivery_500; ?></a>
			<a href="#tab-special-delivery-1000"><?php echo $tab_special_delivery_1000; ?></a>
			<a href="#tab-special-delivery-2500"><?php echo $tab_special_delivery_2500; ?></a>
			<a href="#tab-standard-parcels"><?php echo $tab_standard_parcels; ?></a>
			<a href="#tab-airmail"><?php echo $tab_airmail; ?></a>
			<a href="#tab-international-signed"><?php echo $tab_international_signed; ?></a>
			<a href="#tab-airsure"><?php echo $tab_airsure; ?></a>
			<a href="#tab-surface"><?php echo $tab_surface; ?></a>
		</div>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

		<div id="tab-general" class="vtabs-content">
		<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_display_weight; ?></th>
						<th scope="col" class="center"><?php echo $column_display_insurance; ?></th>
						<th scope="col" class="center"><?php echo $column_weight_class; ?></th>
						<th scope="col" class="center"><?php echo $column_tax_class; ?></th>
						<th scope="col" class="center"><?php echo $column_geo_zone; ?></th>
						<th scope="col" class="center"><?php echo $column_sort_order; ?></th>
						<th scope="col" class="center"><?php echo $column_status; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<?php if ($royal_mail_display_weight) { ?>
									<input type="radio" name="royal_mail_display_weight" value="1" checked="checked" />
									<?php echo $text_yes; ?>
									<input type="radio" name="royal_mail_display_weight" value="0" />
									<?php echo $text_no; ?>
								<?php } else { ?>
									<input type="radio" name="royal_mail_display_weight" value="1" />
									<?php echo $text_yes; ?>
									<input type="radio" name="royal_mail_display_weight" value="0" checked="checked" />
									<?php echo $text_no; ?>
								<?php } ?>
								<?php echo $text_display_weight_hint; ?>
							</td>
							<td class="">
								<?php if ($royal_mail_display_insurance) { ?>
									<input type="radio" name="royal_mail_display_insurance" value="1" checked="checked" />
									<?php echo $text_yes; ?>
									<input type="radio" name="royal_mail_display_insurance" value="0" />
									<?php echo $text_no; ?>
								<?php } else { ?>
									<input type="radio" name="royal_mail_display_insurance" value="1" />
									<?php echo $text_yes; ?>
									<input type="radio" name="royal_mail_display_insurance" value="0" checked="checked" />
									<?php echo $text_no; ?>
								<?php } ?>
								<?php echo $text_display_insurance_hint; ?>
							</td>
							<td class="">
								<select name="royal_mail_weight_class_id">
									<?php foreach ($weight_classes as $weight_class) { ?>
										<?php if ($weight_class['weight_class_id'] == $royal_mail_weight_class_id) { ?>
											<option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="">
								<select name="royal_mail_tax_class_id">
									<option value="0"><?php echo $text_none; ?></option>
									<?php foreach ($tax_classes as $tax_class) { ?>
										<?php if ($tax_class['tax_class_id'] == $royal_mail_tax_class_id) { ?>
											<option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="">
								<select name="royal_mail_geo_zone_id">
									<option value="0"><?php echo $text_all_zones; ?></option>
									<?php foreach ($geo_zones as $geo_zone) { ?>
										<?php if ($geo_zone['geo_zone_id'] == $royal_mail_geo_zone_id) { ?>
											<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="">
								<input type="text" name="royal_mail_sort_order" value="<?php echo $royal_mail_sort_order; ?>" size="1" />
							</td>
							<td class="">
								<select name="royal_mail_status">
									<?php if ($royal_mail_status) { ?>
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

		<div id="tab-1st-class-standard" class="vtabs-content">
		<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_rate; ?></th>
						<th scope="col" class="center"><?php echo $column_insurance; ?></th>
						<th scope="col" class="center"><?php echo $column_status; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<textarea name="royal_mail_1st_class_standard_rate" cols="40" rows="5"><?php echo $royal_mail_1st_class_standard_rate; ?></textarea>
								<?php echo $text_rate_hint; ?>
							</td>
							<td class="">
								<textarea name="royal_mail_1st_class_standard_insurance" cols="40" rows="5"><?php echo $royal_mail_1st_class_standard_insurance; ?></textarea>
								<?php echo $text_insurance_hint; ?>
							</td>
							<td class="">
								<select name="royal_mail_1st_class_standard_status">
									<?php if ($royal_mail_1st_class_standard_status) { ?>
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

		<div id="tab-1st-class-recorded" class="vtabs-content">
		<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_rate; ?></th>
						<th scope="col" class="center"><?php echo $column_insurance; ?></th>
						<th scope="col" class="center"><?php echo $column_status; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<textarea name="royal_mail_1st_class_recorded_rate" cols="40" rows="5"><?php echo $royal_mail_1st_class_recorded_rate; ?></textarea>
								<?php echo $text_rate_hint; ?>
							</td>
							<td class="">
								<textarea name="royal_mail_1st_class_recorded_insurance" cols="40" rows="5"><?php echo $royal_mail_1st_class_recorded_insurance; ?></textarea>
								<?php echo $text_insurance_hint; ?>
							</td>
							<td class="">
								<select name="royal_mail_1st_class_recorded_status">
									<?php if ($royal_mail_1st_class_recorded_status) { ?>
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

		<div id="tab-2nd-class-standard" class="vtabs-content">
		<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_rate; ?></th>
						<th scope="col" class="center"><?php echo $column_status; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<textarea name="royal_mail_2nd_class_standard_rate" cols="40" rows="5"><?php echo $royal_mail_2nd_class_standard_rate; ?></textarea>
								<?php echo $text_rate_hint; ?>
							</td>
							<td class="">
								<select name="royal_mail_2nd_class_standard_status">
									<?php if ($royal_mail_2nd_class_standard_status) { ?>
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

		<div id="tab-2nd-class-recorded" class="vtabs-content">
		<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_rate; ?></th>
						<th scope="col" class="center"><?php echo $column_insurance; ?></th>
						<th scope="col" class="center"><?php echo $column_status; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<textarea name="royal_mail_2nd_class_recorded_rate" cols="40" rows="5"><?php echo $royal_mail_2nd_class_recorded_rate; ?></textarea>
								<?php echo $text_rate_hint; ?>
							</td>
							<td class="">
								<textarea name="royal_mail_2nd_class_recorded_insurance" cols="40" rows="5"><?php echo $royal_mail_2nd_class_recorded_insurance; ?></textarea>
								<?php echo $text_insurance_hint; ?>
							</td>
							<td class="">
								<select name="royal_mail_2nd_class_recorded_status">
									<?php if ($royal_mail_2nd_class_recorded_status) { ?>
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

		<div id="tab-special-delivery-500" class="vtabs-content">
		<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_rate; ?></th>
						<th scope="col" class="center"><?php echo $column_insurance; ?></th>
						<th scope="col" class="center"><?php echo $column_status; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<textarea name="royal_mail_special_delivery_500_rate" cols="40" rows="5"><?php echo $royal_mail_special_delivery_500_rate; ?></textarea>
								<?php echo $text_rate_hint; ?>
							</td>
							<td class="">
								<textarea name="royal_mail_special_delivery_500_insurance" cols="40" rows="5"><?php echo $royal_mail_special_delivery_500_insurance; ?></textarea>
								<?php echo $text_insurance_hint; ?>
							</td>
							<td class="">
								<select name="royal_mail_special_delivery_500_status">
									<?php if ($royal_mail_special_delivery_500_status) { ?>
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

		<div id="tab-special-delivery-1000" class="vtabs-content">
		<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_rate; ?></th>
						<th scope="col" class="center"><?php echo $column_insurance; ?></th>
						<th scope="col" class="center"><?php echo $column_status; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<textarea name="royal_mail_special_delivery_1000_rate" cols="40" rows="5"><?php echo $royal_mail_special_delivery_1000_rate; ?></textarea>
								<?php echo $text_rate_hint; ?>
							</td>
							<td class="">
								<textarea name="royal_mail_special_delivery_1000_insurance" cols="40" rows="5"><?php echo $royal_mail_special_delivery_1000_insurance; ?></textarea>
								<?php echo $text_insurance_hint; ?>
							</td>
							<td class="">
								<select name="royal_mail_special_delivery_1000_status">
									<?php if ($royal_mail_special_delivery_1000_status) { ?>
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

		<div id="tab-special-delivery-2500" class="vtabs-content">
		<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_rate; ?></th>
						<th scope="col" class="center"><?php echo $column_insurance; ?></th>
						<th scope="col" class="center"><?php echo $column_status; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<textarea name="royal_mail_special_delivery_2500_rate" cols="40" rows="5"><?php echo $royal_mail_special_delivery_2500_rate; ?></textarea>
								<?php echo $text_rate_hint; ?>
							</td>
							<td class="">
								<textarea name="royal_mail_special_delivery_2500_insurance" cols="40" rows="5"><?php echo $royal_mail_special_delivery_2500_insurance; ?></textarea>
								<?php echo $text_insurance_hint; ?>
							</td>
							<td class="">
								<select name="royal_mail_special_delivery_2500_status">
									<?php if ($royal_mail_special_delivery_2500_status) { ?>
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

		<div id="tab-standard-parcels" class="vtabs-content">
		<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_rate; ?></th>
						<th scope="col" class="center"><?php echo $column_insurance; ?></th>
						<th scope="col" class="center"><?php echo $column_status; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<textarea name="royal_mail_standard_parcels_rate" cols="40" rows="5"><?php echo $royal_mail_standard_parcels_rate; ?></textarea>
								<?php echo $text_rate_hint; ?>
							</td>
							<td class="">
								<textarea name="royal_mail_standard_parcels_insurance" cols="40" rows="5"><?php echo $royal_mail_standard_parcels_insurance; ?></textarea>
								<?php echo $text_insurance_hint; ?>
							</td>
							<td class="">
								<select name="royal_mail_standard_parcels_status">
									<?php if ($royal_mail_standard_parcels_status) { ?>
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

		<div id="tab-airmail" class="vtabs-content">
		<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_airmail_rate_1; ?></th>
						<th scope="col" class="center"><?php echo $column_airmail_rate_2; ?></th>
						<th scope="col" class="center"><?php echo $column_status; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<textarea name="royal_mail_airmail_rate_1" cols="40" rows="5"><?php echo $royal_mail_airmail_rate_1; ?></textarea>
								<?php echo $text_airmail_rate_1_hint; ?>
							</td>
							<td class="">
								<textarea name="royal_mail_airmail_rate_2" cols="40" rows="5"><?php echo $royal_mail_airmail_rate_2; ?></textarea>
								<?php echo $text_airmail_rate_2_hint; ?>
							</td>
							<td class="">
								<select name="royal_mail_airmail_status">
									<?php if ($royal_mail_airmail_status) { ?>
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

		<div id="tab-international-signed" class="vtabs-content">
		<table class="">
				<tbody>
						<tr>
							<th class="">
								<?php echo $column_international_signed_rate_1; ?>
							</th>
						</tr>
						<tr>
							<td class="">
								<textarea name="royal_mail_international_signed_rate_1" cols="40" rows="5"><?php echo $royal_mail_international_signed_rate_1; ?></textarea>
								<?php echo $text_international_signed_rate_1_hint; ?>
							</td>
						</tr>
						<tr>
							<th class="">
								<?php echo $column_international_signed_insurance_1; ?>
							</th>
						</tr>
						<tr>
							<td class="">
								<textarea name="royal_mail_international_signed_insurance_1" cols="40" rows="5"><?php echo $royal_mail_international_signed_insurance_1; ?></textarea>
								<?php echo $text_international_signed_insurance_1_hint; ?>
							</td>
						</tr>
						<tr>
							<th class="">
								<?php echo $column_international_signed_rate_2; ?>
							</th>
						</tr>
						<tr>
							<td class="">
								<textarea name="royal_mail_international_signed_rate_2" cols="40" rows="5"><?php echo $royal_mail_international_signed_rate_2; ?></textarea>
								<?php echo $text_international_signed_rate_2_hint; ?>
							</td>
						</tr>
						<tr>
							<th class="">
								<?php echo $column_international_signed_insurance_2; ?>
							</th>
						</tr>
						<tr>
							<td class="">
								<textarea name="royal_mail_international_signed_insurance_2" cols="40" rows="5"><?php echo $royal_mail_international_signed_insurance_2; ?></textarea>
								<?php echo $text_international_signed_insurance_2_hint; ?>
							</td>
						</tr>
						<tr>
							<th class="">
								<?php echo $column_status; ?>
							</th>
						</tr>
						<tr>
							<td class="">
								<select name="royal_mail_international_signed_status">
									<?php if ($royal_mail_international_signed_status) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>
								<?php echo $text_status_hint; ?>
							</td>
						</tr>
				</tbody>
			</table>
			</div>

		<div id="tab-airsure" class="vtabs-content">
		<table class="">
				<tbody>
						<tr>
							<th class="">
								<?php echo $column_airsure_rate_1; ?>
							</th>
						</tr>
						<tr>
							<td class="">
								<textarea name="royal_mail_airsure_rate_1" cols="40" rows="5"><?php echo $royal_mail_airsure_rate_1; ?></textarea>
								<?php echo $text_airsure_rate_1_hint; ?>
							</td>
						</tr>
						<tr>
							<th class="">
								<?php echo $column_airsure_insurance_1; ?>
							</th>
						</tr>
						<tr>
							<td class="">
								<textarea name="royal_mail_airsure_insurance_1" cols="40" rows="5"><?php echo $royal_mail_airsure_insurance_1; ?></textarea>
								<?php echo $text_airsure_insurance_1_hint; ?>
							</td>
						</tr>
						<tr>
							<th class="">
								<?php echo $column_airsure_rate_2; ?>
							</th>
						</tr>
						<tr>
							<td class="">
								<textarea name="royal_mail_airsure_rate_2" cols="40" rows="5"><?php echo $royal_mail_airsure_rate_2; ?></textarea>
								<?php echo $text_airsure_rate_2_hint; ?>
							</td>
						</tr>
						<tr>
							<th class="">
								<?php echo $column_airsure_insurance_2; ?>
							</th>
						</tr>
						<tr>
							<td class="">
								<textarea name="royal_mail_airsure_insurance_2" cols="40" rows="5"><?php echo $royal_mail_airsure_insurance_2; ?></textarea>
								<?php echo $text_airsure_insurance_2_hint; ?>
							</td>
						</tr>
						<tr>
							<th class="">
								<?php echo $column_status; ?>
							</th>
						</tr>
						<tr>
							<td class="">
								<select name="royal_mail_airsure_status">
									<?php if ($royal_mail_airsure_status) { ?>
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

		<div id="tab-surface" class="vtabs-content">
		<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_rate; ?></th>
						<th scope="col" class="center"><?php echo $column_status; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<textarea name="royal_mail_surface_rate" cols="40" rows="5"><?php echo $royal_mail_surface_rate; ?></textarea>
								<?php echo $text_rate_hint; ?>
							</td>
							<td class="">
								<select name="royal_mail_surface_status">
									<?php if ($royal_mail_surface_status) { ?>
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