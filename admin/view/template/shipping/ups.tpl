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
				<a href="#tab-option"><?php echo $tab_option; ?></a>
				<a href="#tab-origin"><?php echo $tab_origin; ?></a>
				<a href="#tab-package"><?php echo $tab_packaging; ?></a>
				<a href="#tab-debug"><?php echo $tab_debug; ?></a>
				<a href="#tab-general"><?php echo $tab_general; ?></a>
			</div>

			<div id="tab-registration" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_key; ?></th>
						<th scope="col" class="center"><?php echo $column_username; ?></th>
						<th scope="col" class="center"><?php echo $column_password; ?></th>
						<th scope="col" class="center"><?php echo $column_classification; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<input type="text" name="ups_key" value="<?php echo $ups_key; ?>" />
								<?php if ($error_key) { ?>
									<span class="error"><?php echo $error_key; ?></span>
								<?php } ?>
								<?php echo $text_key_hint; ?>
							</td>
							<td class="">
								<input type="text" name="ups_username" value="<?php echo $ups_username; ?>" />
								<?php if ($error_username) { ?>
									<span class="error"><?php echo $error_username; ?></span>
								<?php } ?>
								<?php echo $text_username_hint; ?>
							</td>
							<td class="textcenter">
								<input type="text" name="ups_password" value="<?php echo $ups_password; ?>" />
								<?php if ($error_password) { ?>
									<span class="error"><?php echo $error_password; ?></span>
								<?php } ?>
								<?php echo $text_password_hint; ?>
							</td>
							<td>
								<select name="ups_classification">
									<?php foreach ($classifications as $classification) { ?>
										<?php if ($classification['value'] == $ups_classification) { ?>
											<option value="<?php echo $classification['value']; ?>" selected="selected"><?php echo $classification['text']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $classification['value']; ?>"><?php echo $classification['text']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
								<?php echo $text_classification_hint; ?>
							</td>
						</tr>
				</tbody>
			</table>
			</div>

			<div id="tab-origin" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_origin; ?></th>
						<th scope="col" class="center"><?php echo $column_city; ?></th>
						<th scope="col" class="center"><?php echo $column_state; ?></th>
						<th scope="col" class="center"><?php echo $column_country; ?></th>
						<th scope="col" class="center"><?php echo $column_postcode; ?></th>
						<th scope="col" class="center"><?php echo $column_service; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<select name="ups_origin">
									<?php foreach ($origins as $origin) { ?>
										<?php if ($origin['value'] == $ups_origin) { ?>
											<option value="<?php echo $origin['value']; ?>" selected="selected"><?php echo $origin['text']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $origin['value']; ?>"><?php echo $origin['text']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
								<?php echo $text_origin_hint; ?>
							</td>
							<td class="">
								<input type="text" name="ups_city" value="<?php echo $ups_city; ?>" />
								<?php if ($error_city) { ?>
									<span class="error"><?php echo $error_city; ?></span>
								<?php } ?>
								<?php echo $text_city_hint; ?>
							</td>
							<td class="">
								<input type="text" name="ups_state" value="<?php echo $ups_state; ?>" maxlength="2" size="4" />
								<?php if ($error_state) { ?>
									<span class="error"><?php echo $error_state; ?></span>
								<?php } ?>
								<?php echo $text_state_hint; ?>
							</td>
							<td class="">
								<input type="text" name="ups_country" value="<?php echo $ups_country; ?>" maxlength="2" size="4" />
								<?php if ($error_country) { ?>
									<span class="error"><?php echo $error_country; ?></span>
								<?php } ?>
								<?php echo $text_country_hint; ?>
							</td>
							<td class="">
								<input type="text" name="ups_postcode" value="<?php echo $ups_postcode; ?>" />
								<?php echo $text_postcode_hint; ?>
							</td>
							<td id="service">
								<div id="US">
								<div class="scrollbox">
								<?php $class = 'odd'; ?>
									<div class="even">
										<?php if ($ups_us_01) { ?>
											<input type="checkbox" name="ups_us_01" value="1" checked="checked" />
											<?php echo $text_next_day_air; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_us_01" value="1" />
											<?php echo $text_next_day_air; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_us_02) { ?>
											<input type="checkbox" name="ups_us_02" value="1" checked="checked" />
											<?php echo $text_2nd_day_air; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_us_02" value="1" />
											<?php echo $text_2nd_day_air; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_us_03) { ?>
											<input type="checkbox" name="ups_us_03" value="1" checked="checked" />
											<?php echo $text_ground; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_us_03" value="1" />
											<?php echo $text_ground; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_us_07) { ?>
											<input type="checkbox" name="ups_us_07" value="1" checked="checked" />
											<?php echo $text_worldwide_express; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_us_07" value="1" />
											<?php echo $text_worldwide_express; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_us_08) { ?>
											<input type="checkbox" name="ups_us_08" value="1" checked="checked" />
											<?php echo $text_worldwide_expedited; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_us_08" value="1" />
											<?php echo $text_worldwide_expedited; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_us_11) { ?>
											<input type="checkbox" name="ups_us_11" value="1" checked="checked" />
											<?php echo $text_standard; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_us_11" value="1" />
											<?php echo $text_standard; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_us_12) { ?>
											<input type="checkbox" name="ups_us_12" value="1" checked="checked" />
											<?php echo $text_3_day_select; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_us_12" value="1" />
											<?php echo $text_3_day_select; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_us_13) { ?>
											<input type="checkbox" name="ups_us_13" value="1" checked="checked" />
											<?php echo $text_next_day_air_saver; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_us_13" value="1" />
											<?php echo $text_next_day_air_saver; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_us_14) { ?>
											<input type="checkbox" name="ups_us_14" value="1" checked="checked" />
											<?php echo $text_next_day_air_early_am; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_us_14" value="1" />
											<?php echo $text_next_day_air_early_am; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_us_54) { ?>
											<input type="checkbox" name="ups_us_54" value="1" checked="checked" />
											<?php echo $text_worldwide_express_plus; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_us_54" value="1" />
											<?php echo $text_worldwide_express_plus; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_us_59) { ?>
											<input type="checkbox" name="ups_us_59" value="1" checked="checked" />
											<?php echo $text_2nd_day_air_am; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_us_59" value="1" />
											<?php echo $text_2nd_day_air_am; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_us_65) { ?>
											<input type="checkbox" name="ups_us_65" value="1" checked="checked" />
											<?php echo $text_saver; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_us_65" value="1" />
											<?php echo $text_saver; ?>
										<?php } ?>
									</div>
								</div>
								</div>

								<div id="PR">
								<div class="scrollbox">
									<div class="even">
										<?php if ($ups_pr_01) { ?>
											<input type="checkbox" name="ups_pr_01" value="1" checked="checked" />
											<?php echo $text_next_day_air; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_pr_01" value="1" />
											<?php echo $text_next_day_air; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_pr_02) { ?>
											<input type="checkbox" name="ups_pr_02" value="1" checked="checked" />
											<?php echo $text_2nd_day_air; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_pr_02" value="1" />
											<?php echo $text_2nd_day_air; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_pr_03) { ?>
											<input type="checkbox" name="ups_pr_03" value="1" checked="checked" />
											<?php echo $text_ground; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_pr_03" value="1" />
											<?php echo $text_ground; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_pr_07) { ?>
											<input type="checkbox" name="ups_pr_07" value="1" checked="checked" />
											<?php echo $text_worldwide_express; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_pr_07" value="1" />
											<?php echo $text_worldwide_express; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_pr_08) { ?>
											<input type="checkbox" name="ups_pr_08" value="1" checked="checked" />
											<?php echo $text_worldwide_expedited; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_pr_08" value="1" />
											<?php echo $text_worldwide_expedited; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_pr_14) { ?>
											<input type="checkbox" name="ups_pr_14" value="1" checked="checked" />
											<?php echo $text_next_day_air_early_am; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_pr_14" value="1" />
											<?php echo $text_next_day_air_early_am; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_pr_54) { ?>
											<input type="checkbox" name="ups_pr_54" value="1" checked="checked" />
											<?php echo $text_worldwide_express_plus; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_pr_54" value="1" />
											<?php echo $text_worldwide_express_plus; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_pr_65) { ?>
											<input type="checkbox" name="ups_pr_65" value="1" checked="checked" />
											<?php echo $text_saver; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_pr_65" value="1" />
											<?php echo $text_saver; ?>
										<?php } ?>
									</div>
								</div>
								</div>

								<div id="CA">
								<div class="scrollbox">
									<div class="even">
										<?php if ($ups_ca_01) { ?>
											<input type="checkbox" name="ups_ca_01" value="1" checked="checked" />
											<?php echo $text_express; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_ca_01" value="1" />
											<?php echo $text_express; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_ca_02) { ?>
											<input type="checkbox" name="ups_ca_02" value="1" checked="checked" />
											<?php echo $text_expedited; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_ca_02" value="1" />
											<?php echo $text_expedited; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_ca_07) { ?>
											<input type="checkbox" name="ups_ca_07" value="1" checked="checked" />
											<?php echo $text_worldwide_express; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_ca_07" value="1" />
											<?php echo $text_worldwide_express; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_ca_08) { ?>
											<input type="checkbox" name="ups_ca_08" value="1" checked="checked" />
											<?php echo $text_worldwide_expedited; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_ca_08" value="1" />
											<?php echo $text_worldwide_expedited; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_ca_11) { ?>
											<input type="checkbox" name="ups_ca_11" value="1" checked="checked" />
											<?php echo $text_standard; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_ca_11" value="1" />
											<?php echo $text_standard; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_ca_12) { ?>
											<input type="checkbox" name="ups_ca_12" value="1" checked="checked" />
											<?php echo $text_3_day_select; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_ca_12" value="1" />
											<?php echo $text_3_day_select; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_ca_13) { ?>
											<input type="checkbox" name="ups_ca_13" value="1" checked="checked" />
											<?php echo $text_saver; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_ca_13" value="1" />
											<?php echo $text_saver; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_ca_14) { ?>
											<input type="checkbox" name="ups_ca_14" value="1" checked="checked" />
											<?php echo $text_express_early_am; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_ca_14" value="1" />
											<?php echo $text_express_early_am; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_ca_54) { ?>
											<input type="checkbox" name="ups_ca_54" value="1" checked="checked" />
											<?php echo $text_worldwide_express_plus; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_ca_54" value="1" />
											<?php echo $text_worldwide_express_plus; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_ca_65) { ?>
											<input type="checkbox" name="ups_ca_65" value="1" checked="checked" />
											<?php echo $text_saver; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_ca_65" value="1" />
											<?php echo $text_saver; ?>
										<?php } ?>
									</div>
								</div>
								</div>

								<div id="MX">
								<div class="scrollbox">
									<div class="even">
										<?php if ($ups_mx_07) { ?>
											<input type="checkbox" name="ups_mx_07" value="1" checked="checked" />
											<?php echo $text_worldwide_express; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_mx_07" value="1" />
											<?php echo $text_worldwide_express; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_mx_08) { ?>
											<input type="checkbox" name="ups_mx_08" value="1" checked="checked" />
											<?php echo $text_worldwide_expedited; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_mx_08" value="1" />
											<?php echo $text_worldwide_expedited; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_mx_54) { ?>
											<input type="checkbox" name="ups_mx_54" value="1" checked="checked" />
											<?php echo $text_worldwide_express_plus; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_mx_54" value="1" />
											<?php echo $text_worldwide_express_plus; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_mx_65) { ?>
											<input type="checkbox" name="ups_mx_65" value="1" checked="checked" />
											<?php echo $text_saver; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_mx_65" value="1" />
											<?php echo $text_saver; ?>
										<?php } ?>
									</div>
								</div>
								</div>

								<div id="EU">
								<div class="scrollbox">
									<div class="even">
										<?php if ($ups_eu_07) { ?>
											<input type="checkbox" name="ups_eu_07" value="1" checked="checked" />
											<?php echo $text_express; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_eu_07" value="1" />
											<?php echo $text_express; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_eu_08) { ?>
											<input type="checkbox" name="ups_eu_08" value="1" checked="checked" />
											<?php echo $text_expedited; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_eu_08" value="1" />
											<?php echo $text_expedited; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_eu_11) { ?>
											<input type="checkbox" name="ups_eu_11" value="1" checked="checked" />
											<?php echo $text_standard; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_eu_11" value="1" />
											<?php echo $text_standard; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_eu_54) { ?>
											<input type="checkbox" name="ups_eu_54" value="1" checked="checked" />
											<?php echo $text_worldwide_express_plus; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_eu_54" value="1" />
											<?php echo $text_worldwide_express_plus; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_eu_65) { ?>
											<input type="checkbox" name="ups_eu_65" value="1" checked="checked" />
											<?php echo $text_saver; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_eu_65" value="1" />
											<?php echo $text_saver; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_eu_82) { ?>
											<input type="checkbox" name="ups_eu_82" value="1" checked="checked" />
											<?php echo $text_today_standard; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_eu_82" value="1" />
											<?php echo $text_today_standard; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_eu_83) { ?>
											<input type="checkbox" name="ups_eu_83" value="1" checked="checked" />
											<?php echo $text_today_dedicated_courier; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_eu_83" value="1" />
											<?php echo $text_today_dedicated_courier; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_eu_84) { ?>
											<input type="checkbox" name="ups_eu_84" value="1" checked="checked" />
											<?php echo $text_today_intercity; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_eu_84" value="1" />
											<?php echo $text_today_intercity; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_eu_85) { ?>
											<input type="checkbox" name="ups_eu_85" value="1" checked="checked" />
											<?php echo $text_today_express; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_eu_85" value="1" />
											<?php echo $text_today_express; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_eu_86) { ?>
											<input type="checkbox" name="ups_eu_86" value="1" checked="checked" />
											<?php echo $text_today_express_saver; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_eu_86" value="1" />
											<?php echo $text_today_express_saver; ?>
										<?php } ?>
									</div>
								</div>
								</div>

								<div id="other">
								<div class="scrollbox">
									<div class="even">
										<?php if ($ups_other_07) { ?>
											<input type="checkbox" name="ups_other_07" value="1" checked="checked" />
											<?php echo $text_express; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_other_07" value="1" />
											<?php echo $text_express; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_other_08) { ?>
											<input type="checkbox" name="ups_other_08" value="1" checked="checked" />
											<?php echo $text_expedited; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_other_08" value="1" />
											<?php echo $text_expedited; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_other_11) { ?>
											<input type="checkbox" name="ups_other_11" value="1" checked="checked" />
											<?php echo $text_standard; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_other_11" value="1" />
											<?php echo $text_standard; ?>
										<?php } ?>
									</div>
									<div class="odd">
										<?php if ($ups_other_54) { ?>
											<input type="checkbox" name="ups_other_54" value="1" checked="checked" />
											<?php echo $text_worldwide_express_plus; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_other_54" value="1" />
											<?php echo $text_worldwide_express_plus; ?>
										<?php } ?>
									</div>
									<div class="even">
										<?php if ($ups_other_65) { ?>
											<input type="checkbox" name="ups_other_65" value="1" checked="checked" />
											<?php echo $text_saver; ?>
										<?php } else { ?>
											<input type="checkbox" name="ups_other_65" value="1" />
											<?php echo $text_saver; ?>
										<?php } ?>
									</div>
								</div>
								</div>
								<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
								<?php echo $text_service_hint; ?>
							</td>
						</tr>
				</tbody>
			</table>
			</div>

			<div id="tab-option" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_insurance; ?></th>
						<th scope="col" class="center"><?php echo $column_display_weight; ?></th>
						<th scope="col" class="center"><?php echo $column_pickup; ?></th>
						<th scope="col" class="center"><?php echo $column_quote_type; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<?php if ($ups_insurance) { ?>
									<input type="radio" name="ups_insurance" value="1" checked="checked" />
									<?php echo $text_yes; ?>
									<input type="radio" name="ups_insurance" value="0" />
									<?php echo $text_no; ?>
								<?php } else { ?>
									<input type="radio" name="ups_insurance" value="1" />
									<?php echo $text_yes; ?>
									<input type="radio" name="ups_insurance" value="0" checked="checked" />
									<?php echo $text_no; ?>
								<?php } ?>
								<?php echo $text_insurance_hint; ?>
							</td>
							<td class="">
								<?php if ($ups_display_weight) { ?>
									<input type="radio" name="ups_display_weight" value="1" checked="checked" />
									<?php echo $text_yes; ?>
									<input type="radio" name="ups_display_weight" value="0" />
									<?php echo $text_no; ?>
								<?php } else { ?>
									<input type="radio" name="ups_display_weight" value="1" />
									<?php echo $text_yes; ?>
									<input type="radio" name="ups_display_weight" value="0" checked="checked" />
									<?php echo $text_no; ?>
								<?php } ?>
								<?php echo $text_display_weight_hint; ?>
							</td>
							<td class="textcenter">
								<select name="ups_pickup">
									<?php foreach ($pickups as $pickup) { ?>
										<?php if ($pickup['value'] == $ups_pickup) { ?>
											<option value="<?php echo $pickup['value']; ?>" selected="selected"><?php echo $pickup['text']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $pickup['value']; ?>"><?php echo $pickup['text']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
								<?php echo $text_pickup_hint; ?>
							</td>
							<td>
								<select name="ups_quote_type">
									<?php foreach ($quote_types as $quote_type) { ?>
										<?php if ($quote_type['value'] == $ups_quote_type) { ?>
											<option value="<?php echo $quote_type['value']; ?>" selected="selected"><?php echo $quote_type['text']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $quote_type['value']; ?>"><?php echo $quote_type['text']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
								<?php echo $text_quote_type_hint; ?>
							</td>
						</tr>
				</tbody>
			</table>
			</div>

			<div id="tab-package" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_packaging; ?></th>
						<th scope="col" class="center"><?php echo $column_weight_code; ?></th>
						<th scope="col" class="center"><?php echo $column_weight_class; ?></th>
						<th scope="col" class="center"><?php echo $column_length_code; ?></th>
						<th scope="col" class="center"><?php echo $column_length_class; ?></th>
						<th scope="col" class="center"><?php echo $column_dimension; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>
								<select name="ups_packaging">
									<?php foreach ($packages as $package) { ?>
										<?php if ($package['value'] == $ups_packaging) { ?>
											<option value="<?php echo $package['value']; ?>" selected="selected"><?php echo $package['text']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $package['value']; ?>"><?php echo $package['text']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
								<?php echo $text_packaging_hint; ?>
							</td>
							<td class="">
								<select name="ups_weight_code">
									<?php if ($ups_weight_code == 'LBS') { ?>
										<option value="LBS" selected="selected">LBS</option>
										<option value="KGS">KGS</option>
									<?php } else { ?>
										<option value="LBS">LBS</option>
										<option value="KGS" selected="selected">KGS</option>
									<?php } ?>
								</select>
								<?php echo $text_weight_code_hint; ?>
							</td>
							<td class="">
								<select name="ups_weight_class_id">
									<?php foreach ($weight_classes as $weight_class) { ?>
										<?php if ($weight_class['weight_class_id'] == $ups_weight_class_id) { ?>
											<option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
								<?php echo $text_weight_class_hint; ?>
							</td>
							<td class="">
								<select name="ups_length_code">
									<?php if ($ups_length_code == 'CM') { ?>
										<option value="CM" selected="selected">CM</option>
										<option value="IN">IN</option>
									<?php } else { ?>
										<option value="CM">CM</option>
										<option value="IN" selected="selected">IN</option>
									<?php } ?>
								</select>
								<?php echo $text_length_code_hint; ?>
							</td>
							<td class="">
								<select name="ups_length_class">
									<?php foreach ($length_classes as $length_class) { ?>
										<?php if ($length_class['unit'] == $ups_length_class) { ?>
											<option value="<?php echo $length_class['unit']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $length_class['unit']; ?>"><?php echo $length_class['title']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
								<?php echo $text_length_class_hint; ?>
							</td>
							<td class="">
								<input type="text" name="ups_length" value="<?php echo $ups_length; ?>" size="4" />
								<input type="text" name="ups_width" value="<?php echo $ups_width; ?>" size="4" />
								<input type="text" name="ups_height" value="<?php echo $ups_height; ?>" size="4" />
								<?php if ($error_dimension) { ?>
									<span class="error"><?php echo $error_dimension; ?></span>
								<?php } ?>
								<?php echo $text_dimension_hint; ?>
							</td>
						</tr>
				</tbody>
			</table>
			</div>

			<div id="tab-debug" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_test_mode; ?></th>
						<th scope="col" class="center"><?php echo $column_debug; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<?php if ($ups_test) { ?>
									<input type="radio" name="ups_test" value="1" checked="checked" />
									<?php echo $text_yes; ?>
									<input type="radio" name="ups_test" value="0" />
									<?php echo $text_no; ?>
								<?php } else { ?>
									<input type="radio" name="ups_test" value="1" />
									<?php echo $text_yes; ?>
									<input type="radio" name="ups_test" value="0" checked="checked" />
									<?php echo $text_no; ?>
								<?php } ?>
								<?php echo $text_test_hint; ?>
							</td>
							<td class="textcenter">
								<select name="ups_debug">
									<?php if ($ups_debug) { ?>
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
								<select name="ups_tax_class_id">
									<option value="0"><?php echo $text_none; ?></option>
									<?php foreach ($tax_classes as $tax_class) { ?>
										<?php if ($tax_class['tax_class_id'] == $ups_tax_class_id) { ?>
											<option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="textcenter">
								<select name="ups_geo_zone_id">
									<option value="0"><?php echo $text_all_zones; ?></option>
									<?php foreach ($geo_zones as $geo_zone) { ?>
										<?php if ($geo_zone['geo_zone_id'] == $ups_geo_zone_id) { ?>
											<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="textcenter">
								<input type="text" name="ups_sort_order" value="<?php echo $ups_sort_order; ?>" />
							</td>
							<td class="textcenter">
								<select name="ups_status">
									<?php if ($ups_status) { ?>
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

<script type="text/javascript"><!--
$('select[name=\'ups_origin\']').bind('change', function() {
	$('#service > div').hide();
	$('#' + this.value).show();
});
$('select[name=\'ups_origin\']').trigger('change');
//--></script>

<?php echo $footer; ?>