<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/options.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_name; ?></th>
						<th scope="col" class="center"><?php echo $column_type; ?></th>
						<th scope="col" class="center"><?php echo $column_sort_order; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="texttop">
								<?php foreach ($languages as $language) { ?>
									<?php if ($error_name) { ?>
										<input type="text" name="option_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($option_description[$language['language_id']]) ? $option_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $error_name[$language['language_id']]; ?>" class="input_error" size="50" />
										<img src="<?php echo URL_IMAGE; ?>flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
									<?php } else { ?>
										<input type="text" name="option_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($option_description[$language['language_id']]) ? $option_description[$language['language_id']]['name'] : ''; ?>" />
										<img src="<?php echo URL_IMAGE; ?>flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
									<?php } ?>
								<br />
								<?php } ?>
							</td>
							<td>
								<select name="type">
									<optgroup label="<?php echo $text_choose; ?>">
										<?php if ($type == 'select') { ?>
											<option value="select" selected><?php echo $text_select; ?></option>
										<?php } else { ?>
											<option value="select"><?php echo $text_select; ?></option>
										<?php } ?>
										<?php if ($type == 'radio') { ?>
											<option value="radio" selected><?php echo $text_radio; ?></option>
										<?php } else { ?>
											<option value="radio"><?php echo $text_radio; ?></option>
										<?php } ?>
										<?php if ($type == 'checkbox') { ?>
											<option value="checkbox" selected><?php echo $text_checkbox; ?></option>
										<?php } else { ?>
											<option value="checkbox"><?php echo $text_checkbox; ?></option>
										<?php } ?>
										<?php if ($type == 'image') { ?>
											<option value="image" selected><?php echo $text_image; ?></option>
										<?php } else { ?>
											<option value="image"><?php echo $text_image; ?></option>
										<?php } ?>
									</optgroup>
									<optgroup label="<?php echo $text_input; ?>">
										<?php if ($type == 'text') { ?>
											<option value="text" selected><?php echo $text_text; ?></option>
										<?php } else { ?>
											<option value="text"><?php echo $text_text; ?></option>
										<?php } ?>
										<?php if ($type == 'textarea') { ?>
											<option value="textarea" selected><?php echo $text_textarea; ?></option>
										<?php } else { ?>
											<option value="textarea"><?php echo $text_textarea; ?></option>
										<?php } ?>
									</optgroup>
									<optgroup label="<?php echo $text_file; ?>">
										<?php if ($type == 'file') { ?>
											<option value="file" selected><?php echo $text_file; ?></option>
										<?php } else { ?>
											<option value="file"><?php echo $text_file; ?></option>
										<?php } ?>
									</optgroup>
									<optgroup label="<?php echo $text_date; ?>">
										<?php if ($type == 'date') { ?>
											<option value="date" selected><?php echo $text_date; ?></option>
										<?php } else { ?>
											<option value="date"><?php echo $text_date; ?></option>
										<?php } ?>
										<?php if ($type == 'time') { ?>
											<option value="time" selected><?php echo $text_time; ?></option>
										<?php } else { ?>
											<option value="time"><?php echo $text_time; ?></option>
										<?php } ?>
										<?php if ($type == 'datetime') { ?>
											<option value="datetime" selected><?php echo $text_datetime; ?></option>
										<?php } else { ?>
											<option value="datetime"><?php echo $text_datetime; ?></option>
										<?php } ?>
									</optgroup>
								</select>
							</td>
							<td>
								<input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="3" />
							</td>
						</tr>
				</tbody>
			</table>



			<table id="option-value" class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_value; ?></th>
						<th scope="col" class="center"><?php echo $column_image; ?></th>
						<th scope="col" class="center"><?php echo $column_sort_order; ?></th>
						<th scope="col" class="center"></th>
					</tr>
				</thead>
				<?php $option_value_row = 0; ?>
				<?php foreach ($option_values as $option_value) { ?>
				<tbody id="option-value-row<?php echo $option_value_row; ?>">
					<tr>
						<td>
							<input type="hidden" name="option_value[<?php echo $option_value_row; ?>][option_value_id]" value="<?php echo $option_value['option_value_id']; ?>" />
							<?php foreach ($languages as $language) { ?>
								<?php if ($error_name) { ?>
									<input type="text" name="option_value[<?php echo $option_value_row; ?>][option_value_description][<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($option_value['option_value_description'][$language['language_id']]) ? $option_value['option_value_description'][$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $error_name[$language['language_id']]; ?>" class="input_error" size="50" />
									<img src="<?php echo URL_IMAGE; ?>flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
								<?php } else { ?>
									<input type="text" name="option_value[<?php echo $option_value_row; ?>][option_value_description][<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($option_value['option_value_description'][$language['language_id']]) ? $option_value['option_value_description'][$language['language_id']]['name'] : ''; ?>" />
									<img src="<?php echo URL_IMAGE; ?>flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
								<?php } ?>
							<br />
							<?php } ?>
						</td>
						<td class="texttop">
							<div class="image"><img src="<?php echo $option_value['thumb']; ?>" alt="" id="thumb<?php echo $option_value_row; ?>" />
								<input type="hidden" name="option_value[<?php echo $option_value_row; ?>][image]" value="<?php echo $option_value['image']; ?>" id="image<?php echo $option_value_row; ?>"  />
								<br />
								<a onclick="image_upload('image<?php echo $option_value_row; ?>', 'thumb<?php echo $option_value_row; ?>');"><?php echo $text_browse; ?></a>
								&nbsp;&nbsp;|&nbsp;&nbsp;
								<a onclick="$('#thumb<?php echo $option_value_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $option_value_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a>
							</div>
						</td>
						<td>
							<input type="text" name="option_value[<?php echo $option_value_row; ?>][sort_order]" value="<?php echo $option_value['sort_order']; ?>" size="1" />
						</td>
						<td class="center">
							<a onclick="$('#option-value-row<?php echo $option_value_row; ?>').remove();" class="button button_red"><?php echo $button_subtract; ?></a>
						</td>
					</tr>
				</tbody>
				<?php $option_value_row++; ?>
				<?php } ?>
				<tfoot>
					<tr>
						<td colspan="3"></td>
						<td class="center"><a onclick="addOptionValue();" class="button button_green"><?php echo $button_add; ?></a></td>
					</tr>
				</tfoot>
			</table>


<script type="text/javascript"><!--
// image manager
var text_image_manager = "<?php echo $text_image_manager; ?>";
var token = "<?php echo $token; ?>";

$('select[name=\'type\']').bind('change', function() {
	if (this.value == 'select' || this.value == 'radio' || this.value == 'checkbox' || this.value == 'image') {
		$('#option-value').show();
	} else {
		$('#option-value').hide();
	}
});

var option_value_row = <?php echo $option_value_row; ?>;

function addOptionValue() {
	html  = '<tbody id="option-value-row' + option_value_row + '">';
	html += '<tr>';
	html += '<td><input type="hidden" name="option_value[' + option_value_row + '][option_value_id]" value="" />';
	<?php foreach ($languages as $language) { ?>
	html += '<input type="text" name="option_value[' + option_value_row + '][option_value_description][<?php echo $language['language_id']; ?>][name]" value="" /> <img src="<?php echo URL_IMAGE; ?>flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />';
	<?php } ?>
	html += '</td>';
	html += '<td class="texttop"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + option_value_row + '" /><input type="hidden" name="option_value[' + option_value_row + '][image]" value="" id="image' + option_value_row + '" /><br /><a onclick="image_upload(\'image' + option_value_row + '\', \'thumb' + option_value_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + option_value_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + option_value_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
	html += '<td><input type="text" name="option_value[' + option_value_row + '][sort_order]" value="" size="1" /></td>';
	html += '<td class="center"><a onclick="$(\'#option-value-row' + option_value_row + '\').remove();" class="button button_red"><?php echo $button_subtract; ?></a></td>';
	html += '</tr>';
	html += '</tbody>';

	$('#option-value tfoot').before(html);
	option_value_row++;
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