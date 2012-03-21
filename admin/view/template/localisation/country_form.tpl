<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/country.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

				<table id="" class="">
					<thead>
						<tr>
							<th scope="col" class="center"><?php echo $column_name; ?></th>
							<th scope="col" class="center"><?php echo $column_iso_code_2; ?></th>
							<th scope="col" class="center"><?php echo $column_iso_code_3; ?></th>
							<th scope="col" class="center"><?php echo $column_address_format; ?></th>
							<th scope="col" class="center"><?php echo $column_postcode_required; ?></th>
							<th scope="col" class="center"><?php echo $column_status; ?></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td scope="row" class="texttop">
								<?php if ($error_name) { ?>
									<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $error_name; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="name" value="<?php echo $name; ?>" />
								<?php } ?>
							</td>
							<td scope="row" class="texttop">
								<input type="text" name="iso_code_2" value="<?php echo $iso_code_2; ?>" />
							</td>
							<td scope="row" class="texttop">
								<input type="text" name="iso_code_3" value="<?php echo $iso_code_3; ?>" />
							</td>
							<td scope="row" class="texttop">
								<textarea name="address_format" cols="40" rows="5"><?php echo $address_format; ?></textarea>
								<?php echo $text_address_format_hint; ?>
							</td>
							<td scope="row" class="texttop">
								<?php if ($postcode_required) { ?>
									<input type="radio" name="postcode_required" value="1" checked="checked" />
									<?php echo $text_yes; ?>
									<input type="radio" name="postcode_required" value="0" />
									<?php echo $text_no; ?>
								<?php } else { ?>
									<input type="radio" name="postcode_required" value="1" />
									<?php echo $text_yes; ?>
									<input type="radio" name="postcode_required" value="0" checked="checked" />
									<?php echo $text_no; ?>
								<?php } ?>
							</td>
							<td scope="row" class="texttop">
								<select name="status">
									<?php if ($status) { ?>
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