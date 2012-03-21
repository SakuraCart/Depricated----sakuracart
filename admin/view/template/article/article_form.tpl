<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/news.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<div id="tabs" class="htabs">
			<a href="#tab-text"><?php echo $tab_text; ?></a>
			<a href="#tab-general"><?php echo $tab_general; ?></a>
<!--
			<a href="#tab-data"><?php echo $tab_data; ?></a>
-->
			<a href="#tab-links"><?php echo $tab_links; ?></a>
			<a href="#tab-image"><?php echo $tab_image; ?></a>
			<a href="#tab-design"><?php echo $tab_design; ?></a>
		</div>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">


<div id="tab-text">
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
									<input type="text" name="article_description[<?php echo $language['language_id']; ?>][name]" size="120" value="<?php echo isset($article_description[$language['language_id']]) ? $article_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $error_name[$language['language_id']]; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="article_description[<?php echo $language['language_id']; ?>][name]" size="120" value="<?php echo isset($article_description[$language['language_id']]) ? $article_description[$language['language_id']]['name'] : ''; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_summary; ?>
							</th>
							<td class="textleft">
								<?php if ($error_summary) { ?>
									<input type="text" name="summary" size="120" value="<?php echo $summary; ?>" placeholder="<?php echo $error_summary; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="summary" size="120" value="<?php echo $summary; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_description; ?>
							</th>
							<td class="textleft">
								<textarea name="article_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($article_description[$language['language_id']]) ? $article_description[$language['language_id']]['description'] : ''; ?></textarea>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_meta_description; ?>
							</th>
							<td class="textleft">
								<textarea name="article_description[<?php echo $language['language_id']; ?>][meta_description]" cols="120" rows="2"><?php echo isset($article_description[$language['language_id']]) ? $article_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_meta_keyword; ?>
							</th>
							<td class="textleft">
								<textarea name="article_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="120" rows="2"><?php echo isset($article_description[$language['language_id']]) ? $article_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_keyword; ?>
							</th>
							<td class="textleft">
								<input type="text" name="keyword" value="<?php echo $keyword; ?>" />
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_tag; ?>
							</th>
							<td class="textleft">
								<input type="text" name="article_tag[<?php echo $language['language_id']; ?>]" value="<?php echo isset($article_tag[$language['language_id']]) ? $article_tag[$language['language_id']] : ''; ?>" size="80" />
							</td>
						</tr>
						</tbody>
					</table>
				</div>
			<?php } ?>
</div>


<div id="tab-general">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_date_available; ?></th>
						<th scope="col" class="center"><?php echo $column_headline; ?></th>
						<th scope="col" class="center"><?php echo $column_sort_order; ?></th>
						<th scope="col" class="center"><?php echo $column_status; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="texttop">
								<input type="text" name="date_available" value="<?php echo $date_available; ?>" size="12" class="date" />
							</td>
							<td class="texttop">
								<select name="headline">
									<?php if ($headline) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>
							</td>
							<td class="texttop">
								<input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="2" />
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


<div id="tab-links">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_author; ?></th>
						<th scope="col" class="center"><?php echo $column_category; ?></th>
						<th scope="col" class="center"><?php echo $column_store; ?></th>
						<th scope="col" class="center"><?php echo $column_download; ?></th>
						<th scope="col" class="center"><?php echo $column_related; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="texttop">
								<select name="author_id">
									<option value="0" selected="selected"><?php echo $text_none; ?></option>
									<?php foreach ($authors as $author) { ?>
										<?php if ($author['author_id'] == $author_id) { ?>
											<option value="<?php echo $author['author_id']; ?>" selected="selected"><?php echo $author['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $author['author_id']; ?>"><?php echo $author['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="texttop">
								<div class="scrollbox wide">
									<?php $class = 'odd'; ?>
									<?php foreach ($categories as $category) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<div class="<?php echo $class; ?>">
											<?php if (in_array($category['category_id'], $article_category)) { ?>
												<input type="checkbox" name="article_category[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
												<?php echo $category['name']; ?>
											<?php } else { ?>
												<input type="checkbox" name="article_category[]" value="<?php echo $category['category_id']; ?>" />
												<?php echo $category['name']; ?>
											<?php } ?>
										</div>
									<?php } ?>
								</div>
								<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
							</td>
							<td class="texttop">
								<div class="scrollbox">
									<?php $class = 'even'; ?>
									<div class="<?php echo $class; ?>">
										<?php if (in_array(0, $article_store)) { ?>
											<input type="checkbox" name="article_store[]" value="0" checked="checked" />
											<?php echo $text_default; ?>
										<?php } else { ?>
											<input type="checkbox" name="article_store[]" value="0" />
											<?php echo $text_default; ?>
										<?php } ?>
									</div>
									<?php foreach ($stores as $store) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<div class="<?php echo $class; ?>">
										<?php if (in_array($store['store_id'], $article_store)) { ?>
											<input type="checkbox" name="article_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
											<?php echo $store['name']; ?>
										<?php } else { ?>
											<input type="checkbox" name="article_store[]" value="<?php echo $store['store_id']; ?>" />
											<?php echo $store['name']; ?>
										<?php } ?>
										</div>
									<?php } ?>
								</div>
							</td>
							<td class="texttop">
								<div class="scrollbox">
									<?php $class = 'odd'; ?>
									<?php foreach ($downloads as $download) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<div class="<?php echo $class; ?>">
											<?php if (in_array($download['download_id'], $article_download)) { ?>
												<input type="checkbox" name="article_download[]" value="<?php echo $download['download_id']; ?>" checked="checked" />
												<?php echo $download['name']; ?>
											<?php } else { ?>
												<input type="checkbox" name="article_download[]" value="<?php echo $download['download_id']; ?>" />
												<?php echo $download['name']; ?>
											<?php } ?>
										</div>
									<?php } ?>
								</div>
							</td>
							<td class="texttop">
								<div id="article-related" class="scrollbox">
									<?php $class = 'odd'; ?>
									<?php foreach ($article_related as $article_related) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<div id="article-related<?php echo $article_related['article_id']; ?>" class="<?php echo $class; ?>"> <?php echo $article_related['name']; ?><img src="<?php echo ICON; ?>/16/delete.png" />
											<input type="hidden" name="article_related[]" value="<?php echo $article_related['article_id']; ?>" />
										</div>
									<?php } ?>
								</div>
								<div class="left">
									<?php echo $entry_search; ?>
									<br />
									<input type="text" name="related" value="" />
									<?php echo $text_related_hint; ?>
								</div>
							</td>
						</tr>
				</tbody>
			</table>
</div>


<div id="tab-image">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_main_image; ?></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="textleft">
							<div class="image"><img src="<?php echo $thumb; ?>" alt="" id="thumb" />
								<br />
								<input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
								<a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>
								&nbsp;&nbsp;|&nbsp;&nbsp;
								<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a>
							</div>
						</td>
					</tr>
				</tbody>
			</table>

			<table id="images" class="">
				<thead>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_image; ?></th>
						<th scope="col" class="center"><?php echo $column_sort_order; ?></th>
						<th scope="col" class="center"><?php echo $column_action; ?></th>
					</tr>
				</thead>
				<?php $image_row = 0; ?>
				<?php foreach ($article_images as $article_image) { ?>
					<tbody id="image-row<?php echo $image_row; ?>">
						<tr>
							<td class="textleft">
								<div class="image">
									<img src="<?php echo $article_image['thumb']; ?>" alt="" id="thumb<?php echo $image_row; ?>" />
									<input type="hidden" name="article_image[<?php echo $image_row; ?>][image]" value="<?php echo $article_image['image']; ?>" id="image<?php echo $image_row; ?>" />
									<br />
									<a onclick="image_upload('image<?php echo $image_row; ?>', 'thumb<?php echo $image_row; ?>');"><?php echo $text_browse; ?></a>
									&nbsp;&nbsp;|&nbsp;&nbsp;
									<a onclick="$('#thumb<?php echo $image_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $image_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a>
								</div>
							</td>
							<td class="center">
								<input type="text" name="article_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $article_image['sort_order']; ?>" size="2" />
							</td>
							<td class="center">
								<a onclick="$('#image-row<?php echo $image_row; ?>').remove();" class="button button_red"><?php echo $button_subtract; ?></a>
							</td>
						</tr>
					</tbody>
				<?php $image_row++; ?>
				<?php } ?>
				<tfoot>
					<tr>
						<td colspan="2">
						</td>
						<td class="center">
							<a onclick="addImage();" class="button button_green"><?php echo $button_add; ?></a>
						</td>
					</tr>
				</tfoot>
			</table>
</div>

<!--
				<div id="tab-reward">
					<table class="form">
						<tr>
							<td><?php echo $entry_points; ?></td>
							<td><input type="text" name="points" value="<?php echo $points; ?>" /></td>
						</tr>
					</table>
					<table class="list">
						<thead>
							<tr>
								<td class="left"><?php echo $entry_customer_group; ?></td>
								<td class="right"><?php echo $entry_reward; ?></td>
							</tr>
						</thead>
						<?php foreach ($customer_groups as $customer_group) { ?>
						<tbody>
							<tr>
								<td class="left"><?php echo $customer_group['name']; ?></td>
								<td class="right"><input type="text" name="article_reward[<?php echo $customer_group['customer_group_id']; ?>][points]" value="<?php echo isset($article_reward[$customer_group['customer_group_id']]) ? $article_reward[$customer_group['customer_group_id']]['points'] : ''; ?>" /></td>
							</tr>
						</tbody>
						<?php } ?>
					</table>
				</div>
-->

<div id="tab-design">
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
								<select name="article_layout[0][layout_id]">
									<option value=""></option>
									<?php foreach ($layouts as $layout) { ?>
										<?php if (isset($article_layout[0]) && $article_layout[0] == $layout['layout_id']) { ?>
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
									<select name="article_layout[<?php echo $store['store_id']; ?>][layout_id]">
										<option value=""></option>
										<?php foreach ($layouts as $layout) { ?>
											<?php if (isset($article_layout[$store['store_id']]) && $article_layout[$store['store_id']] == $layout['layout_id']) { ?>
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
<script type="text/javascript"><!--
$('input[name=\'related\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=article/article/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.article_id
					}
				}));
			}
		});
	},

	select: function(event, ui) {
		$('#article-related' + ui.item.value).remove();
		$('#article-related').append('<div id="article-related' + ui.item.value + '">' + ui.item.label + '<img src="<?php echo ICON; ?>/16/delete.png" /><input type="hidden" name="article_related[]" value="' + ui.item.value + '" /></div>');
		$('#article-related div:odd').attr('class', 'odd');
		$('#article-related div:even').attr('class', 'even');
		return false;
	}
});

$('#article-related div img').live('click', function() {
	$(this).parent().remove();
	$('#article-related div:odd').attr('class', 'odd');
	$('#article-related div:even').attr('class', 'even');
});
//--></script>
<script type="text/javascript"><!--
$.widget('custom.catcomplete', $.ui.autocomplete, {
	_renderMenu: function(ul, items) {
		var self = this, currentCategory = '';

		$.each(items, function(index, item) {
			if (item.category != currentCategory) {
				ul.append('<li class="ui-autocomplete-category">' + item.category + '</li>');

				currentCategory = item.category;
			}

			self._renderItem(ul, item);
		});
	}
});
//--></script>


<script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
	html  = '<tbody id="image-row' + image_row + '">';
	html += '  <tr>';
	html += '    <td class="textleft"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + image_row + '" /><input type="hidden" name="article_image[' + image_row + '][image]" value="" id="image' + image_row + '" /><br /><a onclick="image_upload(\'image' + image_row + '\', \'thumb' + image_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + image_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + image_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
	html += '    <td class="center"><input type="text" name="article_image[' + image_row + '][sort_order]" value="" size="2" /></td>';
	html += '    <td class="center"><a onclick="$(\'#image-row' + image_row  + '\').remove();" class="button button_red"><?php echo $button_subtract; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#images tfoot').before(html);

	image_row++;
}
//--></script>

<script type="text/javascript"><!--
$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
	dateFormat: 'yy-mm-dd',
	timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});
//--></script>

<script type="text/javascript"><!--
//$('#tabs a').tabs();
//$('#languages a').tabs();
//$('#vtab-option a').tabs();
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