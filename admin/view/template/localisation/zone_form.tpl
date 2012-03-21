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
							<th scope="col" class="center"><?php echo $column_code; ?></th>
							<th scope="col" class="center"><?php echo $column_country; ?></th>
							<th scope="col" class="center"><?php echo $column_status; ?></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td scope="row" class="">
								<?php if ($error_name) { ?>
									<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $error_name; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="name" value="<?php echo $name; ?>" />
								<?php } ?>
							</td>
							<td scope="row" class="">
								<input type="text" name="code" value="<?php echo $code; ?>" />
							</td>
							<td scope="row" class="">
								<select name="country_id">
									<?php foreach ($countries as $country) { ?>
										<?php if ($country['country_id'] == $country_id) { ?>
											<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td scope="row" class="">
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