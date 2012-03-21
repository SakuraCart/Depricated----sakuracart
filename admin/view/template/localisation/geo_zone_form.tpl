<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/geo_zone.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

			<table class="">
				<thead>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_name; ?></th>
						<th scope="col" class="textleft"><?php echo $column_description; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="textleft">
								<?php if ($error_name) { ?>
									<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $error_name; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="name" value="<?php echo $name; ?>" />
								<?php } ?>
							</td>
							<td class="textleft">
								<?php if ($error_description) { ?>
									<input type="text" name="description" value="<?php echo $description; ?>" placeholder="<?php echo $error_description; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="description" value="<?php echo $description; ?>" />
								<?php } ?>
							</td>
						</tr>
				</tbody>
			</table>

<br />

			<table id="zone-to-geo-zone" class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_country; ?></th>
						<th scope="col" class="center"><?php echo $column_zone; ?></th>
						<th scope="col" class="center"></th>
					</tr>
				</thead>
				<?php $zone_to_geo_zone_row = 0; ?>
				<?php foreach ($zone_to_geo_zones as $zone_to_geo_zones) { ?>
				<tbody id="zone-to-geo-zone-row<?php echo $zone_to_geo_zone_row; ?>">
					<tr>
						<td class="center">
							<select name="zone_to_geo_zone[<?php echo $zone_to_geo_zone_row; ?>][country_id]" id="country<?php echo $zone_to_geo_zone_row; ?>" onchange="$('#zone<?php echo $zone_to_geo_zone_row; ?>').load('index.php?route=localisation/geo_zone/zone&token=<?php echo $token; ?>&country_id=' + this.value + '&zone_id=0');">
								<?php foreach ($countries as $country) { ?>
									<?php  if ($country['country_id'] == $zone_to_geo_zone['country_id']) { ?>
										<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</td>
						<td class="center">
							<select name="zone_to_geo_zone[<?php echo $zone_to_geo_zone_row; ?>][zone_id]" id="zone<?php echo $zone_to_geo_zone_row; ?>">
							</select>
						</td>
						<td class="">
							<a onclick="$('#zone-to-geo-zone-row<?php echo $zone_to_geo_zone_row; ?>').remove();" class="button button_red"><?php echo $button_subtract; ?></a>
						</td>
					</tr>
				</tbody>
				<?php $zone_to_geo_zone_row++; ?>
				<?php } ?>
				<tfoot>
					<tr>
						<td colspan="2"></td>
						<td class="center"><a onclick="addGeoZone();" class="button button_green"><?php echo $button_add; ?></a></td>
					</tr>
				</tfoot>
			</table>


<script type="text/javascript"><!--
$('#zone-id').load('index.php?route=localisation/geo_zone/zone&token=<?php echo $token; ?>&country_id=' + $('#country-id').attr('value') + '&zone_id=0');
//--></script>
<?php $zone_to_geo_zone_row = 0; ?>
<?php foreach ($zone_to_geo_zones as $zone_to_geo_zone) { ?>
<script type="text/javascript"><!--
$('#zone<?php echo $zone_to_geo_zone_row; ?>').load('index.php?route=localisation/geo_zone/zone&token=<?php echo $token; ?>&country_id=<?php echo $zone_to_geo_zone['country_id']; ?>&zone_id=<?php echo $zone_to_geo_zone['zone_id']; ?>');
//--></script>
<?php $zone_to_geo_zone_row++; ?>
<?php } ?>
<script type="text/javascript"><!--
var zone_to_geo_zone_row = <?php echo $zone_to_geo_zone_row; ?>;

function addGeoZone() {
	html  = '<tbody id="zone-to-geo-zone-row' + zone_to_geo_zone_row + '">';
	html += '<tr>';
	html += '<td class="center"><select name="zone_to_geo_zone[' + zone_to_geo_zone_row + '][country_id]" id="country' + zone_to_geo_zone_row + '" onchange="$(\'#zone' + zone_to_geo_zone_row + '\').load(\'index.php?route=localisation/geo_zone/zone&token=<?php echo $token; ?>&country_id=\' + this.value + \'&zone_id=0\');">';
	<?php foreach ($countries as $country) { ?>
	html += '<option value="<?php echo $country['country_id']; ?>"><?php echo addslashes($country['name']); ?></option>';
	<?php } ?>
	html += '</select></td>';
	html += '<td class="center"><select name="zone_to_geo_zone[' + zone_to_geo_zone_row + '][zone_id]" id="zone' + zone_to_geo_zone_row + '"></select></td>';
	html += '<td class="center"><a onclick="$(\'#zone-to-geo-zone-row' + zone_to_geo_zone_row + '\').remove();" class="button button_red"><?php echo $button_subtract; ?></a></td>';
	html += '</tr>';
	html += '</tbody>';

	$('#zone-to-geo-zone > tfoot').before(html);
	$('#zone' + zone_to_geo_zone_row).load('index.php?route=localisation/geo_zone/zone&token=<?php echo $token; ?>&country_id=' + $('#country' + zone_to_geo_zone_row).attr('value') + '&zone_id=0');
	zone_to_geo_zone_row++;
}
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