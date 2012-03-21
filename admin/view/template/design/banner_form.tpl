<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/layout.png" alt="lock" /> <?php echo $heading_title; ?>
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
						<th scope="col" class="textleft"><?php echo $column_status; ?></th>
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

			<table id="images" class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_title; ?></th>
						<th scope="col" class="center"><?php echo $column_link; ?></th>
						<th scope="col" class="center"><?php echo $column_image; ?></th>
						<th scope="col" class="center"></th>
					</tr>
				</thead>
				<?php $image_row = 0; ?>
				<?php foreach ($banner_images as $banner_image) { ?>
				<tbody id="image-row<?php echo $image_row; ?>">
					<tr>
						<td class="texttop">
							<?php foreach ($languages as $language) { ?>
								<?php if (isset($error_banner_image[$image_row][$language['language_id']])) { ?>
									<input type="text" name="banner_image[<?php echo $image_row; ?>][banner_image_description][<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($banner_image['banner_image_description'][$language['language_id']]) ? $banner_image['banner_image_description'][$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $error_banner_image[$image_row][$language['language_id']]; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="banner_image[<?php echo $image_row; ?>][banner_image_description][<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($banner_image['banner_image_description'][$language['language_id']]) ? $banner_image['banner_image_description'][$language['language_id']]['title'] : ''; ?>" />
								<?php } ?>
								<img src="<?php echo URL_IMAGE; ?>flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
							<?php } ?>
						</td>
						<td class="texttop">
							<input type="text" name="banner_image[<?php echo $image_row; ?>][link]" value="<?php echo $banner_image['link']; ?>" size="70" />
						</td>
						<td class="texttop">
								<div class="image">
									<img src="<?php echo $banner_image['thumb']; ?>" alt="" id="thumb<?php echo $image_row; ?>" />
									<input type="hidden" name="banner_image[<?php echo $image_row; ?>][image]" value="<?php echo $banner_image['image']; ?>" id="image<?php echo $image_row; ?>" />
									<br />
									<a onclick="image_upload('image<?php echo $image_row; ?>', 'thumb<?php echo $image_row; ?>');"><?php echo $text_browse; ?></a>
									&nbsp;&nbsp;|&nbsp;&nbsp;
									<a onclick="$('#thumb<?php echo $image_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $image_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a>
								</div>
						</td>
						<td class="">
							<a onclick="$('#image-row<?php echo $image_row; ?>').remove();" class="button button_red"><?php echo $button_subtract; ?></a>
						</td>
					</tr>
				</tbody>
				<?php $image_row++; ?>
				<?php } ?>
				<tfoot>
					<tr>
						<td colspan="3"></td>
						<td class="center"><a onclick="addImage();" class="button button_green"><?php echo $button_add; ?></a></td>
					</tr>
				</tfoot>
			</table>


<script type="text/javascript"><!--
// image manager
var text_image_manager = "<?php echo $text_image_manager; ?>";
var token = "<?php echo $token; ?>";

var image_row = <?php echo $image_row; ?>;

function addImage() {
	html  = '<tbody id="image-row' + image_row + '">';
	html += '<tr>';
	html += '<td class="texttop">';
	<?php foreach ($languages as $language) { ?>
	html += '<input type="text" name="banner_image[' + image_row + '][banner_image_description][<?php echo $language['language_id']; ?>][title]" value="" /> <img src="<?php echo URL_IMAGE; ?>flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />';
	<?php } ?>
	html += '</td>';
	html += '<td class="texttop"><input type="text" name="banner_image[' + image_row + '][link]" value="" size="70" /></td>';
	html += '<td class="texttop"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + image_row + '" /><input type="hidden" name="banner_image[' + image_row + '][image]" value="" id="image' + image_row + '" /><br /><a onclick="image_upload(\'image' + image_row + '\', \'thumb' + image_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + image_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + image_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
	html += '<td class=""><a onclick="$(\'#image-row' + image_row  + '\').remove();" class="button button_red"><?php echo $button_subtract; ?></a></td>';
	html += '</tr>';
	html += '</tbody>';
	$('#images tfoot').before(html);
	image_row++;
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