<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/languages.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

			<table class="">
				<tbody>
				<tr>
					<th scope="col" class="">
						<?php echo $entry_name; ?>
					</th>
					<td class="textleft">
						<?php if ($error_name) { ?>
							<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $error_name; ?>" class="input_error" />
						<?php } else { ?>
							<input type="text" name="name" value="<?php echo $name; ?>" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th scope="col" class="">
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
					<th scope="col" class="">
						<?php echo $entry_locale; ?>
					</th>
					<td class="textleft">
						<?php if ($error_locale) { ?>
							<input type="text" name="locale" value="<?php echo $locale; ?>" placeholder="<?php echo $error_locale; ?>" class="input_error" />
						<?php } else { ?>
							<input type="text" name="locale" value="<?php echo $locale; ?>" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th scope="col" class="">
						<?php echo $entry_image; ?>
					</th>
					<td class="textleft">
						<?php if ($error_image) { ?>
							<input type="text" name="image" value="<?php echo $image; ?>" placeholder="<?php echo $error_image; ?>" class="input_error" />
						<?php } else { ?>
							<input type="text" name="image" value="<?php echo $image; ?>" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th scope="col" class="">
						<?php echo $entry_directory; ?>
					</th>
					<td class="textleft">
						<?php if ($error_directory) { ?>
							<input type="text" name="directory" value="<?php echo $directory; ?>" placeholder="<?php echo $error_directory; ?>" class="input_error" />
						<?php } else { ?>
							<input type="text" name="directory" value="<?php echo $directory; ?>" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th scope="col" class="">
						<?php echo $entry_filename; ?>
					</th>
					<td class="textleft">
						<?php if ($error_filename) { ?>
							<input type="text" name="filename" value="<?php echo $filename; ?>" placeholder="<?php echo $error_filename; ?>" class="input_error" />
						<?php } else { ?>
							<input type="text" name="filename" value="<?php echo $filename; ?>" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th scope="col" class="">
						<?php echo $entry_sort_order; ?>
					</th>
					<td class="textleft">
						<input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="1" />
					</td>
				</tr>
				<tr>
					<th scope="col" class="">
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