<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/modules.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<div class="row">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
		<div class="col12 last">

			<div class="vtabs">
				<?php $module_row = 1; ?>
				<?php foreach ($modules as $module) { ?>
						<a href="#tab-module-<?php echo $module_row; ?>" id="module-<?php echo $module_row; ?>"><?php echo $text_message . ' ' . $module_row; ?>
							&nbsp;
							<img src="../image/icons/delete.png" alt="" onclick="$('.vtabs a:first').trigger('click'); $('#module-<?php echo $module_row; ?>').remove(); $('#tab-module-<?php echo $module_row; ?>').remove(); return false;" />
						</a>
					<?php $module_row++; ?>
				<?php } ?>
				<span id="module-add"><?php echo $text_add_message; ?>&nbsp;<img src="../image/icons/16/add.png" alt="" onclick="addModule();" /></span>
			</div>

			<?php $module_row = 1; ?>
			<div id="message_area">
			<?php foreach ($modules as $module) { ?>
				<div id="tab-module-<?php echo $module_row; ?>" class="vtabs-content">

					<div id="language-<?php echo $module_row; ?>" class="htabs">
						<?php foreach ($languages as $language) { ?>
							<a href="#tab-language-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>"><img src="../image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
						<?php } ?>
					</div>
					<?php foreach ($languages as $language) { ?>
						<div id="tab-language-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>">
							<table class="">
								<tr>
									<th class="texttop"><?php echo $entry_title; ?></th>
									<td class="textleft">
										<input type="text" name="<?php echo $module_name ?>[<?php echo $module_row; ?>][title][<?php echo $language['language_id']; ?>]" id="title-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>" value="<?php echo isset($module['title'][$language['language_id']]) ? $module['title'][$language['language_id']] : ''; ?>" />
									</td>
								</tr>
								<tr>
									<th class="texttop"><?php echo $entry_description; ?></th>
									<td class="textleft">
										<textarea name="<?php echo $module_name ?>[<?php echo $module_row; ?>][description][<?php echo $language['language_id']; ?>]" id="description-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>"><?php echo isset($module['description'][$language['language_id']]) ? $module['description'][$language['language_id']] : ''; ?></textarea>
									</td>
								</tr>
							</table>
						</div>
					<?php } ?>
					<table class="">
					<thead>
						<tr>
							<th scope="col" class="center"><?php echo $column_layout; ?></th>
							<th scope="col" class="center"><?php echo $column_position; ?></th>
							<th scope="col" class="center"><?php echo $column_action; ?></th>
							<th scope="col" class="center"><?php echo $column_sort_order; ?></th>
						</tr>
					</thead>
					<tbody id="module-row<?php echo $module_row; ?>">
						<tr>
							<td>
								<select name="<?php echo $module_name ?>[<?php echo $module_row; ?>][layout_id]">
								<?php foreach ($layouts as $layout) { ?>
									<?php if ($layout['layout_id'] == $module['layout_id']) { ?>
										<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
									<?php } ?>
								<?php } ?>
								</select>
							</td>
							<td>
								<select name="<?php echo $module_name ?>[<?php echo $module_row; ?>][position]">
								<?php if ($module['position'] == 'content_header') { ?>
									<option value="content_header" selected="selected"><?php echo $text_content_header; ?></option>
								<?php } else { ?>
									<option value="content_header"><?php echo $text_content_header; ?></option>
								<?php } ?>
								<?php if ($module['position'] == 'content_left') { ?>
									<option value="content_left" selected="selected"><?php echo $text_content_left; ?></option>
								<?php } else { ?>
									<option value="content_left"><?php echo $text_content_left; ?></option>
								<?php } ?>
								<?php if ($module['position'] == 'content_center') { ?>
									<option value="content_center" selected="selected"><?php echo $text_content_center; ?></option>
								<?php } else { ?>
									<option value="content_center"><?php echo $text_content_center; ?></option>
								<?php } ?>
								<?php if ($module['position'] == 'content_right') { ?>
									<option value="content_right" selected="selected"><?php echo $text_content_right; ?></option>
								<?php } else { ?>
									<option value="content_right"><?php echo $text_content_right; ?></option>
								<?php } ?>
								<?php if ($module['position'] == 'content_footer') { ?>
									<option value="content_footer" selected="selected"><?php echo $text_content_footer; ?></option>
								<?php } else { ?>
									<option value="content_footer"><?php echo $text_content_footer; ?></option>
								<?php } ?>
								</select>
							</td>
							<td>
								<select name="<?php echo $module_name ?>[<?php echo $module_row; ?>][status]">
									<?php if ($module['status']) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>
							</td>
							<td>
								<input type="text" name="<?php echo $module_name ?>[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" />
							</td>
						</tr>
					</tbody>
					</table>
				</div>
				<?php $module_row++; ?>
			<?php } ?>
			</div>

<script type="text/javascript" src="../js/libs/ckeditor/ckeditor.js"></script>
<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>
	<?php foreach ($languages as $language) { ?>
		CKEDITOR.replace('description-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>', {
			filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
			filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
			filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
			filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
			filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
		});
	<?php } ?>
	<?php $module_row++; ?>
<?php } ?>
//--></script>

<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;
var module_name = <?php echo $module_name; ?>;
function addModule() {
	html = '<div id="tab-module-' + module_row + '" class="vtabs-content">';
	html += '<div id="language-' + module_row + '" class="htabs">';
	<?php foreach ($languages as $language) { ?>
		html += '<a href="#tab-language-'+ module_row + '-<?php echo $language['language_id']; ?>"><img src="../image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>';
	<?php } ?>
	html += '</div>';
	<?php foreach ($languages as $language) { ?>
		html += '<div id="tab-language-'+ module_row + '-<?php echo $language['language_id']; ?>">';
		html += '<table class="">';
		html += '<tr>';
		html += '<th class="texttop"><?php echo $entry_title; ?></th>';
		html += '<td class="textleft"><input type="text" name="<?php echo $module_name ?>[' + module_row + '][title][<?php echo $language['language_id']; ?>]" id="title-' + module_row + '-<?php echo $language['language_id']; ?>" value="<?php echo isset($module['title'][$language['language_id']]) ? $module['title'][$language['language_id']] : ''; ?>" /></td>';
		html += '</tr>';
		html += '<tr>';
		html += '<th class="texttop"><?php echo $entry_description; ?></th>';
		html += '<td class="textleft"><textarea name="<?php echo $module_name ?>[' + module_row + '][description][<?php echo $language['language_id']; ?>]" id="description-' + module_row + '-<?php echo $language['language_id']; ?>"></textarea></td>';
		html += '</tr>';
		html += '</table>';
		html += '</div>';
	<?php } ?>
	html += '<table class="">';
	html += '<thead><tr>';
	html += '<th scope="col" class="center"><?php echo $column_layout; ?></th>';
	html += '<th scope="col" class="center"><?php echo $column_position; ?></th>';
	html += '<th scope="col" class="center"><?php echo $column_action; ?></th>';
	html += '<th scope="col" class="center"><?php echo $column_sort_order; ?></th>';
	html += '</tr></thead>';
	html += '<tbody id="module-row' + module_row + '">';
	html += '<tr>';
	html += '<td><select name="<?php echo $module_name ?>[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '           <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '</select></td>';
	html += '<td><select name="<?php echo $module_name ?>[' + module_row + '][position]">';
		html += '<option value="content_header"><?php echo $text_content_header; ?></option>';
		html += '<option value="content_left"><?php echo $text_content_left; ?></option>';
		html += '<option value="content_center"><?php echo $text_content_center; ?></option>';
		html += '<option value="content_right"><?php echo $text_content_right; ?></option>';
		html += '<option value="content_footer"><?php echo $text_content_footer; ?></option>';
	html += '</select></td>';
	html += '<td><select name="<?php echo $module_name ?>[' + module_row + '][status]">';
		html += '<option value="1"><?php echo $text_enabled; ?></option>';
		html += '<option value="0"><?php echo $text_disabled; ?></option>';
	html += '</select></td>';
	html += '<td><input type="text" name="<?php echo $module_name ?>[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '</tr>';
	html += '</tbody>';
	html += '</table>';
	html += '</div>';

	$('#message_area').append(html);

	<?php foreach ($languages as $language) { ?>
		CKEDITOR.replace('description-' + module_row + '-<?php echo $language['language_id']; ?>', {
			filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
			filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
			filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
			filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
			filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
		});
	<?php } ?>

	$('#language-' + module_row + ' a').tabs();
	$('#module-add').before('<a href="#tab-module-' + module_row + '" id="module-' + module_row + '"><?php echo $text_new_message; ?> ' + module_row + '&nbsp;<img src="../image/icons/delete.png" alt="" onclick="$(\'.vtabs a:first\').trigger(\'click\'); $(\'#module-' + module_row + '\').remove(); $(\'#tab-module-' + module_row + '\').remove(); return false;" /></a>');
	$('.vtabs a').tabs();
//	$('#module-' + module_row).trigger('click');
	$('#module-' + module_row).trigger('focus');

	module_row++;
}
//--></script>

<script type="text/javascript"><!--
	<?php $module_row = 1; ?>
	<?php foreach ($modules as $module) { ?>
		$('#language-<?php echo $module_row; ?> a').tabs();
		<?php $module_row++; ?>
	<?php } ?>
//--></script>



		</div>
		</form>
		</div>

			<div class="button_container container_grey">
				<a onclick="location = '<?php echo $cancel; ?>';" class="button button_red left"><?php echo $button_cancel; ?></a>
				<a onclick="$('#form').submit();" class="button button_green right"><?php echo $button_save; ?></a>
			</div>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>