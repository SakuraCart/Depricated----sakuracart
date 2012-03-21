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

		<div class="htabs">
			<a href="#tab-registration"><?php echo $tab_registration; ?></a>
			<a href="#tab-services"><?php echo $tab_services; ?></a>
			<a href="#tab-package"><?php echo $tab_packaging; ?></a>
			<a href="#tab-debug"><?php echo $tab_debug; ?></a>
			<a href="#tab-general"><?php echo $tab_general; ?></a>
		</div>

			<div id="tab-registration" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_user_id; ?></th>
						<th scope="col" class="center"><?php echo $column_postcode; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<input type="text" name="usps_user_id" value="<?php echo $usps_user_id; ?>" />
								<?php if ($error_user_id) { ?>
									<span class="error"><?php echo $error_user_id; ?></span>
								<?php } ?>
							</td>
							<td class="">
								<input type="text" name="usps_postcode" value="<?php echo $usps_postcode; ?>" />
								<?php if ($error_postcode) { ?>
									<span class="error"><?php echo $error_postcode; ?></span>
								<?php } ?>
							</td>
						</tr>
				</tbody>
			</table>
			</div>

			<div id="tab-services" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_domestic; ?></th>
						<th scope="col" class="center"><?php echo $column_international; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<div class="scrollbox">
									<?php $class = 'odd'; ?>
									<div class="even">
										<?php if ($usps_domestic_00) { ?>
											<input type="checkbox" name="usps_domestic_00" value="1" checked="checked" />
											<?php echo $text_domestic_00; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_00" value="1" />
											<?php echo $text_domestic_00; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_domestic_01) { ?>
											<input type="checkbox" name="usps_domestic_01" value="1" checked="checked" />
											<?php echo $text_domestic_01; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_01" value="1" />
											<?php echo $text_domestic_01; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_domestic_02) { ?>
											<input type="checkbox" name="usps_domestic_02" value="1" checked="checked" />
											<?php echo $text_domestic_02; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_02" value="1" />
											<?php echo $text_domestic_02; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_domestic_03) { ?>
											<input type="checkbox" name="usps_domestic_03" value="1" checked="checked" />
											<?php echo $text_domestic_03; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_03" value="1" />
											<?php echo $text_domestic_03; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($usps_domestic_1) { ?>
											<input type="checkbox" name="usps_domestic_1" value="1" checked="checked" />
											<?php echo $text_domestic_1; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_1" value="1" />
											<?php echo $text_domestic_1; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_domestic_2) { ?>
											<input type="checkbox" name="usps_domestic_2" value="1" checked="checked" />
											<?php echo $text_domestic_2; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_2" value="1" />
											<?php echo $text_domestic_2; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($usps_domestic_3) { ?>
											<input type="checkbox" name="usps_domestic_3" value="1" checked="checked" />
											<?php echo $text_domestic_3; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_3" value="1" />
											<?php echo $text_domestic_3; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_domestic_4) { ?>
											<input type="checkbox" name="usps_domestic_4" value="1" checked="checked" />
											<?php echo $text_domestic_4; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_4" value="1" />
											<?php echo $text_domestic_4; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($usps_domestic_5) { ?>
											<input type="checkbox" name="usps_domestic_5" value="1" checked="checked" />
											<?php echo $text_domestic_5; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_5" value="1" />
											<?php echo $text_domestic_5; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_domestic_6) { ?>
											<input type="checkbox" name="usps_domestic_6" value="1" checked="checked" />
											<?php echo $text_domestic_6; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_6" value="1" />
											<?php echo $text_domestic_6; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($usps_domestic_7) { ?>
											<input type="checkbox" name="usps_domestic_7" value="1" checked="checked" />
											<?php echo $text_domestic_7; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_7" value="1" />
											<?php echo $text_domestic_7; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_domestic_12) { ?>
											<input type="checkbox" name="usps_domestic_12" value="1" checked="checked" />
											<?php echo $text_domestic_12; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_12" value="1" />
											<?php echo $text_domestic_12; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($usps_domestic_13) { ?>
											<input type="checkbox" name="usps_domestic_13" value="1" checked="checked" />
											<?php echo $text_domestic_13; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_13" value="1" />
											<?php echo $text_domestic_13; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_domestic_16) { ?>
											<input type="checkbox" name="usps_domestic_16" value="1" checked="checked" />
											<?php echo $text_domestic_16; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_16" value="1" />
											<?php echo $text_domestic_16; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($usps_domestic_17) { ?>
											<input type="checkbox" name="usps_domestic_17" value="1" checked="checked" />
											<?php echo $text_domestic_17; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_17" value="1" />
											<?php echo $text_domestic_17; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_domestic_18) { ?>
											<input type="checkbox" name="usps_domestic_18" value="1" checked="checked" />
											<?php echo $text_domestic_18; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_18" value="1" />
											<?php echo $text_domestic_18; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($usps_domestic_19) { ?>
											<input type="checkbox" name="usps_domestic_19" value="1" checked="checked" />
											<?php echo $text_domestic_19; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_19" value="1" />
											<?php echo $text_domestic_19; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_domestic_22) { ?>
											<input type="checkbox" name="usps_domestic_22" value="1" checked="checked" />
											<?php echo $text_domestic_22; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_22" value="1" />
											<?php echo $text_domestic_22; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($usps_domestic_23) { ?>
											<input type="checkbox" name="usps_domestic_23" value="1" checked="checked" />
											<?php echo $text_domestic_23; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_23" value="1" />
											<?php echo $text_domestic_23; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_domestic_25) { ?>
											<input type="checkbox" name="usps_domestic_25" value="1" checked="checked" />
											<?php echo $text_domestic_25; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_25" value="1" />
											<?php echo $text_domestic_25; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($usps_domestic_27) { ?>
											<input type="checkbox" name="usps_domestic_27" value="1" checked="checked" />
											<?php echo $text_domestic_27; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_27" value="1" />
											<?php echo $text_domestic_27; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_domestic_28) { ?>
											<input type="checkbox" name="usps_domestic_28" value="1" checked="checked" />
											<?php echo $text_domestic_28; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_domestic_28" value="1" />
											<?php echo $text_domestic_28; ?>
										<?php } ?>
									</div>
								</div>
								<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
							</td>
							<td class="">
								<div class="scrollbox">
									<?php $class = 'odd'; ?>
									<div class="even">
										<?php if ($usps_international_1) { ?>
											<input type="checkbox" name="usps_international_1" value="1" checked="checked" />
											<?php echo $text_international_1; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_international_1" value="1" />
											<?php echo $text_international_1; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($usps_international_2) { ?>
											<input type="checkbox" name="usps_international_2" value="1" checked="checked" />
											<?php echo $text_international_2; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_international_2" value="1" />
											<?php echo $text_international_2; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_international_4) { ?>
											<input type="checkbox" name="usps_international_4" value="1" checked="checked" />
											<?php echo $text_international_4; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_international_4" value="1" />
											<?php echo $text_international_4; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($usps_international_5) { ?>
											<input type="checkbox" name="usps_international_5" value="1" checked="checked" />
											<?php echo $text_international_5; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_international_5" value="1" />
											<?php echo $text_international_5; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_international_6) { ?>
											<input type="checkbox" name="usps_international_6" value="1" checked="checked" />
											<?php echo $text_international_6; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_international_6" value="1" />
											<?php echo $text_international_6; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($usps_international_7) { ?>
											<input type="checkbox" name="usps_international_7" value="1" checked="checked" />
											<?php echo $text_international_7; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_international_7" value="1" />
											<?php echo $text_international_7; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_international_8) { ?>
											<input type="checkbox" name="usps_international_8" value="1" checked="checked" />
											<?php echo $text_international_8; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_international_8" value="1" />
											<?php echo $text_international_8; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($usps_international_9) { ?>
											<input type="checkbox" name="usps_international_9" value="1" checked="checked" />
											<?php echo $text_international_9; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_international_9" value="1" />
											<?php echo $text_international_9; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_international_10) { ?>
											<input type="checkbox" name="usps_international_10" value="1" checked="checked" />
											<?php echo $text_international_10; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_international_10" value="1" />
											<?php echo $text_international_10; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($usps_international_11) { ?>
											<input type="checkbox" name="usps_international_11" value="1" checked="checked" />
											<?php echo $text_international_11; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_international_11" value="1" />
											<?php echo $text_international_11; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_international_12) { ?>
											<input type="checkbox" name="usps_international_12" value="1" checked="checked" />
											<?php echo $text_international_12; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_international_12" value="1" />
											<?php echo $text_international_12; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($usps_international_13) { ?>
											<input type="checkbox" name="usps_international_13" value="1" checked="checked" />
											<?php echo $text_international_13; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_international_13" value="1" />
											<?php echo $text_international_13; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_international_14) { ?>
											<input type="checkbox" name="usps_international_14" value="1" checked="checked" />
											<?php echo $text_international_14; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_international_14" value="1" />
											<?php echo $text_international_14; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($usps_international_15) { ?>
											<input type="checkbox" name="usps_international_15" value="1" checked="checked" />
											<?php echo $text_international_15; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_international_15" value="1" />
											<?php echo $text_international_15; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($usps_international_16) { ?>
											<input type="checkbox" name="usps_international_16" value="1" checked="checked" />
											<?php echo $text_international_16; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_international_16" value="1" />
											<?php echo $text_international_16; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($usps_international_21) { ?>
											<input type="checkbox" name="usps_international_21" value="1" checked="checked" />
											<?php echo $text_international_21; ?>
										<?php } else { ?>
											<input type="checkbox" name="usps_international_21" value="1" />
											<?php echo $text_international_21; ?>
										<?php } ?>
									</div>
								</div>
								<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
							</td>
						</tr>
				</tbody>
			</table>
			</div>

			<div id="tab-package" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_size; ?></th>
						<th scope="col" class="center"><?php echo $column_container; ?></th>
						<th scope="col" class="center"><?php echo $column_machinable; ?></th>
						<th scope="col" class="center"><?php echo $column_dimension; ?></th>
						<th scope="col" class="center"><?php echo $column_display_time; ?></th>
						<th scope="col" class="center"><?php echo $column_display_weight; ?></th>
						<th scope="col" class="center"><?php echo $column_weight_class; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>
								<select name="usps_size">
									<?php foreach ($sizes as $size) { ?>
										<?php if ($size['value'] == $usps_size) { ?>
											<option value="<?php echo $size['value']; ?>" selected="selected"><?php echo $size['text']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $size['value']; ?>"><?php echo $size['text']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td>
								<select name="usps_container">
									<?php foreach ($containers as $container) { ?>
										<?php if ($container['value'] == $usps_container) { ?>
											<option value="<?php echo $container['value']; ?>" selected="selected"><?php echo $container['text']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $container['value']; ?>"><?php echo $container['text']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="">
								<select name="usps_machinable">
									<?php if ($usps_machinable) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
									<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
									<?php } ?>
								</select>
							</td>
							<td class="">
								<input type="text" name="usps_length" value="<?php echo $usps_length; ?>" size="4" />
								<input type="text" name="usps_width" value="<?php echo $usps_width; ?>" size="4" />
								<input type="text" name="usps_height" value="<?php echo $usps_height; ?>" size="4" />
								<?php if ($error_width) { ?>
									<span class="error"><?php echo $error_width; ?></span>
								<?php } ?>
								<?php if ($error_length) { ?>
									<span class="error"><?php echo $error_length; ?></span>
								<?php } ?>
								<?php if ($error_height) { ?>
									<span class="error"><?php echo $error_height; ?></span>
								<?php } ?>
								<?php echo $text_dimension_hint; ?>
							</td>
							<td class="">
								<?php if ($usps_display_time) { ?>
									<input type="radio" name="usps_display_time" value="1" checked="checked" />
									<?php echo $text_yes; ?>
									<input type="radio" name="usps_display_time" value="0" />
									<?php echo $text_no; ?>
								<?php } else { ?>
									<input type="radio" name="usps_display_time" value="1" />
									<?php echo $text_yes; ?>
									<input type="radio" name="usps_display_time" value="0" checked="checked" />
									<?php echo $text_no; ?>
								<?php } ?>
								<?php echo $text_display_time_hint; ?>
							</td>
							<td class="">
								<?php if ($usps_display_weight) { ?>
									<input type="radio" name="usps_display_weight" value="1" checked="checked" />
									<?php echo $text_yes; ?>
									<input type="radio" name="usps_display_weight" value="0" />
									<?php echo $text_no; ?>
								<?php } else { ?>
									<input type="radio" name="usps_display_weight" value="1" />
									<?php echo $text_yes; ?>
									<input type="radio" name="usps_display_weight" value="0" checked="checked" />
									<?php echo $text_no; ?>
								<?php } ?>
								<?php echo $text_display_weight_hint; ?>
							</td>
							<td class="">
								<select name="usps_weight_class_id">
									<?php foreach ($weight_classes as $weight_class) { ?>
										<?php if ($weight_class['weight_class_id'] == $usps_weight_class_id) { ?>
											<option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
								<?php echo $text_weight_class_hint; ?>
							</td>
						</tr>
				</tbody>
			</table>
			</div>

			<div id="tab-debug" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_debug; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="textcenter">
								<select name="usps_debug">
									<?php if ($usps_debug) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>
								<?php echo $text_debug_hint; ?>
							</td>
						</tr>
				</tbody>
			</table>
			</div>

			<div id="tab-general" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_class; ?></th>
						<th scope="col" class="center"><?php echo $column_geo_zone; ?></th>
						<th scope="col" class="center"><?php echo $column_sort_order; ?></th>
						<th scope="col" class="center"><?php echo $column_action; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>
								<select name="usps_tax_class_id">
									<option value="0"><?php echo $text_none; ?></option>
									<?php foreach ($tax_classes as $tax_class) { ?>
										<?php if ($tax_class['tax_class_id'] == $usps_tax_class_id) { ?>
											<option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="textcenter">
								<select name="usps_geo_zone_id">
									<option value="0"><?php echo $text_all_zones; ?></option>
									<?php foreach ($geo_zones as $geo_zone) { ?>
										<?php if ($geo_zone['geo_zone_id'] == $usps_geo_zone_id) { ?>
											<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="textcenter">
								<input type="text" name="usps_sort_order" value="<?php echo $usps_sort_order; ?>" />
							</td>
							<td class="textcenter">
								<select name="usps_status">
									<?php if ($usps_status) { ?>
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