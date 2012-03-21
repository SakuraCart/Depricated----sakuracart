<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/currency.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

			<table class="">
				<tbody>
				<tr>
					<th scope="row" class="">
						<?php echo $entry_title; ?>
					</th>
					<td class="textleft">
						<?php if ($error_title) { ?>
							<input type="text" name="title" value="<?php echo $title; ?>" placeholder="<?php echo $error_title; ?>" class="input_error" />
						<?php } else { ?>
							<input type="text" name="title" value="<?php echo $title; ?>" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th scope="row" class="">
						<?php echo $entry_code; ?>
					</th>
					<td class="textleft">
						<?php if ($error_code) { ?>
							<input type="text" name="code" value="<?php echo $code; ?>" placeholder="<?php echo $error_code; ?>" class="input_error" />
						<?php } else { ?>
							<input type="text" name="code" value="<?php echo $code; ?>" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th scope="row" class="">
						<?php echo $entry_symbol_left; ?>
					</th>
					<td class="textleft">
						<input type="text" name="symbol_left" value="<?php echo $symbol_left; ?>" />
					</td>
				</tr>
				<tr>
					<th scope="row" class="">
						<?php echo $entry_symbol_right; ?>
					</th>
					<td class="textleft">
						<input type="text" name="symbol_right" value="<?php echo $symbol_right; ?>" />
					</td>
				</tr>
				<tr>
					<th scope="row" class="">
						<?php echo $entry_decimal_place; ?>
					</th>
					<td class="textleft">
						<input type="text" name="decimal_place" value="<?php echo $decimal_place; ?>" />
					</td>
				</tr>
				<tr>
					<th scope="row" class="">
						<?php echo $entry_value; ?>
					</th>
					<td class="textleft">
						<input type="text" name="value" value="<?php echo $value; ?>" />
					</td>
				</tr>
				<tr>
					<th scope="row" class="">
						<?php echo $entry_status; ?>
					</th>
					<td class="textleft">
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