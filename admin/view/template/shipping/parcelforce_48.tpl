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
				<a href="#tab-rates"><?php echo $tab_rates; ?></a>
				<a href="#tab-option"><?php echo $tab_option; ?></a>
				<a href="#tab-general"><?php echo $tab_general; ?></a>
			</div>

			<div id="tab-rates" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_rate; ?></th>
						<th scope="col" class="center"><?php echo $column_insurance; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<textarea name="parcelforce_48_rate" cols="40" rows="5"><?php echo $parcelforce_48_rate; ?></textarea>
								<?php echo $text_rate_hint; ?>
							</td>
							<td class="textcenter">
								<textarea name="parcelforce_48_insurance" cols="40" rows="5"><?php echo $parcelforce_48_insurance; ?></textarea>
								<?php echo $text_insurance_hint; ?>
							</td>
						</tr>
				</tbody>
			</table>
			</div>

			<div id="tab-option" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_display_weight; ?></th>
						<th scope="col" class="center"><?php echo $column_display_insurance; ?></th>
						<th scope="col" class="center"><?php echo $column_display_time; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="">
								<?php if ($parcelforce_48_display_weight) { ?>
									<input type="radio" name="parcelforce_48_display_weight" value="1" checked="checked" />
									<?php echo $text_yes; ?>
									<input type="radio" name="parcelforce_48_display_weight" value="0" />
									<?php echo $text_no; ?>
								<?php } else { ?>
									<input type="radio" name="parcelforce_48_display_weight" value="1" />
									<?php echo $text_yes; ?>
									<input type="radio" name="parcelforce_48_display_weight" value="0" checked="checked" />
									<?php echo $text_no; ?>
								<?php } ?>
								<?php echo $text_display_weight_hint; ?>
							</td>
							<td class="textcenter">
								<?php if ($parcelforce_48_display_insurance) { ?>
									<input type="radio" name="parcelforce_48_display_insurance" value="1" checked="checked" />
									<?php echo $text_yes; ?>
									<input type="radio" name="parcelforce_48_display_insurance" value="0" />
									<?php echo $text_no; ?>
								<?php } else { ?>
									<input type="radio" name="parcelforce_48_display_insurance" value="1" />
									<?php echo $text_yes; ?>
									<input type="radio" name="parcelforce_48_display_insurance" value="0" checked="checked" />
									<?php echo $text_no; ?>
								<?php } ?>
								<?php echo $text_display_insurance_hint; ?>
							</td>
							<td class="textcenter">
								<?php if ($parcelforce_48_display_time) { ?>
									<input type="radio" name="parcelforce_48_display_time" value="1" checked="checked" />
									<?php echo $text_yes; ?>
									<input type="radio" name="parcelforce_48_display_time" value="0" />
									<?php echo $text_no; ?>
								<?php } else { ?>
									<input type="radio" name="parcelforce_48_display_time" value="1" />
									<?php echo $text_yes; ?>
									<input type="radio" name="parcelforce_48_display_time" value="0" checked="checked" />
									<?php echo $text_no; ?>
								<?php } ?>
								<?php echo $text_display_time_hint; ?>
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
								<select name="parcelforce_48_tax_class_id">
									<option value="0"><?php echo $text_none; ?></option>
									<?php foreach ($tax_classes as $tax_class) { ?>
										<?php if ($tax_class['tax_class_id'] == $parcelforce_48_tax_class_id) { ?>
											<option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="textcenter">
								<select name="parcelforce_48_geo_zone_id">
									<option value="0"><?php echo $text_all_zones; ?></option>
									<?php foreach ($geo_zones as $geo_zone) { ?>
										<?php if ($geo_zone['geo_zone_id'] == $parcelforce_48_geo_zone_id) { ?>
											<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="textcenter">
								<input type="text" name="parcelforce_48_sort_order" value="<?php echo $parcelforce_48_sort_order; ?>" />
							</td>
							<td class="textcenter">
								<select name="parcelforce_48_status">
									<?php if ($parcelforce_48_status) { ?>
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