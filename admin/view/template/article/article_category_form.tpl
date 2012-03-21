<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/site_directory.png" alt="directory" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

			<div id="tabs" class="htabs">
				<a href="#tab-general"><?php echo $tab_general; ?></a>
				<a href="#tab-data"><?php echo $tab_data; ?></a>
				<a href="#tab-design"><?php echo $tab_design; ?></a>
			</div>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

<div id="tab-general" class="htabs-content">
			<div id="tab-languages" class="langtabs">
				<?php foreach ($languages as $language) { ?>
					<a href="#tab-language<?php echo $language['language_id']; ?>"><img src="<?php echo URL_IMAGE; ?>flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
				<?php } ?>
			</div>
			<?php foreach ($languages as $language) { ?>
				<div id="tab-language<?php echo $language['language_id']; ?>" class="htabs-content">
					<table class="">
						<tbody>
						<tr>
							<th class="texttop">
								<?php echo $entry_name; ?>
							</th>
							<td class="textleft">
								<?php if (isset($error_name[$language['language_id']])) { ?>
									<input type="text" name="category_description[<?php echo $language['language_id']; ?>][name]" size="120" value="<?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $error_name[$language['language_id']]; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="category_description[<?php echo $language['language_id']; ?>][name]" size="120" value="<?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['name'] : ''; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_meta_description; ?>
							</th>
							<td class="textleft">
								<textarea name="category_description[<?php echo $language['language_id']; ?>][meta_description]" cols="120" rows="2"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_meta_keyword; ?>
							</th>
							<td class="textleft">
								<textarea name="category_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="120" rows="2"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_description; ?>
							</th>
							<td class="textleft">
								<textarea name="category_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['description'] : ''; ?></textarea>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
			<?php } ?>
</div>

<div id="tab-data" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_parent; ?></th>
						<th scope="col" class="center"><?php echo $column_store; ?></th>
						<th scope="col" class="center"><?php echo $column_keyword; ?></th>
						<th scope="col" class="center"><?php echo $column_image; ?></th>
						<th scope="col" class="center"><?php echo $column_top; ?></th>
						<th scope="col" class="center"><?php echo $column_column; ?></th>
						<th scope="col" class="center"><?php echo $column_sort_order; ?></th>
						<th scope="col" class="center"><?php echo $column_status; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="texttop">
								<select name="parent_id">
									<option value="0"><?php echo $text_none; ?></option>
									<?php foreach ($categories as $category) { ?>
										<?php if ($category['category_id'] == $parent_id) { ?>
											<option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="texttop">
								<div class="scrollbox">
									<?php $class = 'even'; ?>
									<div class="<?php echo $class; ?>">
										<?php if (in_array(0, $category_store)) { ?>
											<input type="checkbox" name="category_store[]" value="0" checked="checked" />
											<?php echo $text_default; ?>
										<?php } else { ?>
											<input type="checkbox" name="category_store[]" value="0" />
											<?php echo $text_default; ?>
										<?php } ?>
									</div>
									<?php foreach ($stores as $store) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<div class="<?php echo $class; ?>">
											<?php if (in_array($store['store_id'], $category_store)) { ?>
												<input type="checkbox" name="category_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
												<?php echo $store['name']; ?>
											<?php } else { ?>
												<input type="checkbox" name="category_store[]" value="<?php echo $store['store_id']; ?>" />
												<?php echo $store['name']; ?>
											<?php } ?>
										</div>
									<?php } ?>
								</div>
							</td>
							<td class="texttop">
								<input type="text" name="keyword" value="<?php echo $keyword; ?>" />
							</td>
							<td class="texttop" width="10%">
								<div class="image">
									<img src="<?php echo $thumb; ?>" alt="" id="thumb" />
									<input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
									<br />
									<a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>
									<br/>
									<br/>
									<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a>
								</div>
							</td>
							<td class="texttop">
								<?php if ($top) { ?>
									<input type="checkbox" name="top" value="1" checked="checked" />
								<?php } else { ?>
									<input type="checkbox" name="top" value="1" />
								<?php } ?>
								<?php echo $text_top_hint; ?>
							</td>
							<td class="texttop">
								<input type="text" name="column" value="<?php echo $column; ?>" size="1" />
								<?php echo $text_column_hint; ?>
							</td>
							<td class="texttop">
								<input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="1" />
							</td>
							<td class="texttop">
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
</div>

<div id="tab-design" class="htabs-content">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_store; ?></th>
						<th scope="col" class="center"><?php echo $column_layout; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>
								<?php echo $text_default; ?>
							</td>
							<td>
								<select name="category_layout[0][layout_id]">
									<option value=""></option>
									<?php foreach ($layouts as $layout) { ?>
										<?php if (isset($category_layout[0]) && $category_layout[0] == $layout['layout_id']) { ?>
											<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
						</tr>
						<?php foreach ($stores as $store) { ?>
							<tr>
								<td>
									<?php echo $store['name']; ?>
								</td>
								<td>
									<select name="category_layout[<?php echo $store['store_id']; ?>][layout_id]">
										<option value=""></option>
										<?php foreach ($layouts as $layout) { ?>
											<?php if (isset($category_layout[$store['store_id']]) && $category_layout[$store['store_id']] == $layout['layout_id']) { ?>
												<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
								</td>
							</tr>
						<?php } ?>
				</tbody>
			</table>
</div>


<script type="text/javascript"><!--
// image manager
var text_image_manager = "<?php echo $text_image_manager; ?>";
var token = "<?php echo $token; ?>";

<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('description<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
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