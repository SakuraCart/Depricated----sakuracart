<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/products.png" alt="lock" /> <?php echo $heading_title; ?>
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
			<a href="#tab-stock-shipping"><?php echo $tab_stock_shipping; ?></a>
			<a href="#tab-links"><?php echo $tab_links; ?></a>
			<a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
			<a href="#tab-option"><?php echo $tab_option; ?></a>
			<a href="#tab-discount"><?php echo $tab_discount; ?></a>
			<a href="#tab-special"><?php echo $tab_special; ?></a>
			<a href="#tab-image"><?php echo $tab_image; ?></a>
			<a href="#tab-reward"><?php echo $tab_reward; ?></a>
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
									<input type="text" name="product_description[<?php echo $language['language_id']; ?>][name]" size="120" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $error_name[$language['language_id']]; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="product_description[<?php echo $language['language_id']; ?>][name]" size="120" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_model; ?>
							</th>
							<td class="textleft">
								<?php if ($error_model) { ?>
									<input type="text" name="model" size="120" value="<?php echo $model; ?>" placeholder="<?php echo $error_model; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="model" size="120" value="<?php echo $model; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_description; ?>
							</th>
							<td class="textleft">
								<textarea name="product_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_meta_description; ?>
							</th>
							<td class="textleft">
								<textarea name="product_description[<?php echo $language['language_id']; ?>][meta_description]" cols="120" rows="2"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_meta_keyword; ?>
							</th>
							<td class="textleft">
								<textarea name="product_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="120" rows="2"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
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
								<input type="text" name="product_tag[<?php echo $language['language_id']; ?>]" value="<?php echo isset($product_tag[$language['language_id']]) ? $product_tag[$language['language_id']] : ''; ?>" size="80" />
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
						<th scope="col" class="center"><?php echo $column_sku; ?></th>
						<th scope="col" class="center"><?php echo $column_upc; ?></th>
						<th scope="col" class="center"><?php echo $column_location; ?></th>
						<th scope="col" class="center"><?php echo $column_price; ?></th>
						<th scope="col" class="center"><?php echo $column_tax_class; ?></th>
						<th scope="col" class="center"><?php echo $column_date_available; ?></th>
						<th scope="col" class="center"><?php echo $column_sort_order; ?></th>
						<th scope="col" class="center"><?php echo $column_status; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="texttop">
								<input type="text" name="sku" value="<?php echo $sku; ?>" />
							</td>
							<td class="texttop">
								<input type="text" name="upc" value="<?php echo $upc; ?>" />
							</td>
							<td class="texttop">
								<input type="text" name="location" value="<?php echo $location; ?>" />
							</td>
							<td class="texttop">
								<input type="text" size="8" name="price" value="<?php echo $price; ?>" />
							</td>
							<td class="texttop">
								<select name="tax_class_id">
									<option value="0"><?php echo $text_none; ?></option>
									<?php foreach ($tax_classes as $tax_class) { ?>
										<?php if ($tax_class['tax_class_id'] == $tax_class_id) { ?>
											<option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="texttop">
								<input type="text" name="date_available" value="<?php echo $date_available; ?>" size="12" class="date" />
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


<div id="tab-stock-shipping">
			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_quantity; ?></th>
						<th scope="col" class="center"><?php echo $column_minimum; ?></th>
						<th scope="col" class="center"><?php echo $column_subtract; ?></th>
						<th scope="col" class="center"><?php echo $column_stock_status; ?></th>
						<th scope="col" class="center"><?php echo $column_shipping; ?></th>
						<th scope="col" class="center"><?php echo $column_dimension; ?></th>
						<th scope="col" class="center"><?php echo $column_length; ?></th>
						<th scope="col" class="center"><?php echo $column_weight; ?></th>
						<th scope="col" class="center"><?php echo $column_weight_class; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td>
								<input type="text" name="quantity" value="<?php echo $quantity; ?>" size="2" />
							</td>
							<td>
								<input type="text" name="minimum" value="<?php echo $minimum; ?>" size="2" />
								<?php echo $text_minimum_hint; ?>
							</td>
							<td>
								<select name="subtract">
									<?php if ($subtract) { ?>
										<option value="1" selected="selected"><?php echo $text_yes; ?></option>
										<option value="0"><?php echo $text_no; ?></option>
									<?php } else { ?>
										<option value="1"><?php echo $text_yes; ?></option>
										<option value="0" selected="selected"><?php echo $text_no; ?></option>
									<?php } ?>
								</select>
							</td>
							<td>
								<select name="stock_status_id">
									<?php foreach ($stock_statuses as $stock_status) { ?>
										<?php if ($stock_status['stock_status_id'] == $stock_status_id) { ?>
											<option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
								<?php echo $text_stock_status_hint; ?>
							</td>
							<td>
								<?php if ($shipping) { ?>
									<input type="radio" name="shipping" value="1" checked="checked" />
									<?php echo $text_yes; ?>
									<input type="radio" name="shipping" value="0" />
									<?php echo $text_no; ?>
								<?php } else { ?>
									<input type="radio" name="shipping" value="1" />
									<?php echo $text_yes; ?>
									<input type="radio" name="shipping" value="0" checked="checked" />
									<?php echo $text_no; ?>
								<?php } ?>
							</td>
							<td width="20%">
								<input type="text" name="length" value="<?php echo $length; ?>" size="4" />
								<input type="text" name="width" value="<?php echo $width; ?>" size="4" />
								<input type="text" name="height" value="<?php echo $height; ?>" size="4" />
								<?php echo $text_dimension_hint; ?>
							</td>
							<td>
								<select name="length_class_id">
									<?php foreach ($length_classes as $length_class) { ?>
										<?php if ($length_class['length_class_id'] == $length_class_id) { ?>
											<option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td>
								<input type="text" name="weight" value="<?php echo $weight; ?>" size="8" />
							</td>
							<td>
								<select name="weight_class_id">
									<?php foreach ($weight_classes as $weight_class) { ?>
										<?php if ($weight_class['weight_class_id'] == $weight_class_id) { ?>
											<option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
										<?php } ?>
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
						<th scope="col" class="center"><?php echo $column_manufacturer; ?></th>
						<th scope="col" class="center"><?php echo $column_category; ?></th>
						<th scope="col" class="center"><?php echo $column_store; ?></th>
						<th scope="col" class="center"><?php echo $column_download; ?></th>
						<th scope="col" class="center"><?php echo $column_related; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="texttop">
								<select name="manufacturer_id">
									<option value="0" selected="selected"><?php echo $text_none; ?></option>
									<?php foreach ($manufacturers as $manufacturer) { ?>
										<?php if ($manufacturer['manufacturer_id'] == $manufacturer_id) { ?>
											<option value="<?php echo $manufacturer['manufacturer_id']; ?>" selected="selected"><?php echo $manufacturer['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option>
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
											<?php if (in_array($category['category_id'], $product_category)) { ?>
												<input type="checkbox" name="product_category[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
												<?php echo $category['name']; ?>
											<?php } else { ?>
												<input type="checkbox" name="product_category[]" value="<?php echo $category['category_id']; ?>" />
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
										<?php if (in_array(0, $product_store)) { ?>
											<input type="checkbox" name="product_store[]" value="0" checked="checked" />
											<?php echo $text_default; ?>
										<?php } else { ?>
											<input type="checkbox" name="product_store[]" value="0" />
											<?php echo $text_default; ?>
										<?php } ?>
									</div>
									<?php foreach ($stores as $store) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<div class="<?php echo $class; ?>">
										<?php if (in_array($store['store_id'], $product_store)) { ?>
											<input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
											<?php echo $store['name']; ?>
										<?php } else { ?>
											<input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" />
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
											<?php if (in_array($download['download_id'], $product_download)) { ?>
												<input type="checkbox" name="product_download[]" value="<?php echo $download['download_id']; ?>" checked="checked" />
												<?php echo $download['name']; ?>
											<?php } else { ?>
												<input type="checkbox" name="product_download[]" value="<?php echo $download['download_id']; ?>" />
												<?php echo $download['name']; ?>
											<?php } ?>
										</div>
									<?php } ?>
								</div>
							</td>
							<td class="texttop">
								<div id="product-related" class="scrollbox">
									<?php $class = 'odd'; ?>
									<?php foreach ($product_related as $product_related) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<div id="product-related<?php echo $product_related['product_id']; ?>" class="<?php echo $class; ?>"> <?php echo $product_related['name']; ?><img src="<?php echo ICON; ?>/16/delete.png" />
											<input type="hidden" name="product_related[]" value="<?php echo $product_related['product_id']; ?>" />
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


<div id="tab-attribute">
			<table id="attribute" class="">
				<thead>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_attribute; ?></th>
						<th scope="col" class="center"><?php echo $column_text; ?></th>
						<th scope="col" class="center"><?php echo $column_action; ?></th>
					</tr>
				</thead>
				<?php $attribute_row = 0; ?>
				<?php foreach ($product_attributes as $product_attribute) { ?>
					<tbody id="attribute-row<?php echo $attribute_row; ?>">
						<tr>
							<td class="texttop">
								<input type="text" name="product_attribute[<?php echo $attribute_row; ?>][name]" value="<?php echo $product_attribute['name']; ?>" />
								<input type="hidden" name="product_attribute[<?php echo $attribute_row; ?>][attribute_id]" value="<?php echo $product_attribute['attribute_id']; ?>" />
							</td>
							<td class="texttop">
								<?php foreach ($languages as $language) { ?>
									<textarea name="product_attribute[<?php echo $attribute_row; ?>][product_attribute_description][<?php echo $language['language_id']; ?>][text]" cols="40" rows="5"><?php echo isset($product_attribute['product_attribute_description'][$language['language_id']]) ? $product_attribute['product_attribute_description'][$language['language_id']]['text'] : ''; ?></textarea>
									<img src="<?php echo URL_IMAGE; ?>flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
								<?php } ?>
							</td>
							<td class="center">
								<a onclick="$('#image-row<?php echo $image_row; ?>').remove();" class="button button_red"><?php echo $button_subtract; ?></a>
							</td>
						</tr>
					</tbody>
				<?php $attribute_row++; ?>
				<?php } ?>
				<tfoot>
					<tr>
						<td colspan="2">
						</td>
						<td class="center">
							<a onclick="addAttribute();" class="button button_green"><?php echo $button_add; ?></a>
						</td>
					</tr>
				</tfoot>
			</table>
</div>


<div id="tab-option">
			<div id="vtab-option" class="vtabs">
				<?php $option_row = 0; ?>
				<?php foreach ($product_options as $product_option) { ?>
					<a href="#tab-option-<?php echo $option_row; ?>" id="option-<?php echo $option_row; ?>"><?php echo $product_option['name']; ?>&nbsp;<img src="<?php echo ICON; ?>/16/delete.png" alt="" onclick="$('#vtabs a:first').trigger('click'); $('#option-<?php echo $option_row; ?>').remove(); $('#tab-option-<?php echo $option_row; ?>').remove(); return false;" /></a>
					<?php $option_row++; ?>
				<?php } ?>
				<span id="option-add">
					<input name="option" value="" style="width: 130px;" />
					&nbsp;<img src="<?php echo ICON; ?>/add.png" alt="<?php echo $button_add_option; ?>" title="<?php echo $button_add_option; ?>" />
				</span>
			</div>

			<?php $option_row = 0; ?>
			<?php $option_value_row = 0; ?>

			<?php foreach ($product_options as $product_option) { ?>
				<div id="tab-option-<?php echo $option_row; ?>" class="vtabs-content">
					<input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_id]" value="<?php echo $product_option['product_option_id']; ?>" />
					<input type="hidden" name="product_option[<?php echo $option_row; ?>][name]" value="<?php echo $product_option['name']; ?>" />
					<input type="hidden" name="product_option[<?php echo $option_row; ?>][option_id]" value="<?php echo $product_option['option_id']; ?>" />
					<input type="hidden" name="product_option[<?php echo $option_row; ?>][type]" value="<?php echo $product_option['type']; ?>" />
					<table class="">
						<tbody>
							<tr>
								<th class="textleft"><?php echo $entry_required; ?></th>
								<td class="textleft">
									<select name="product_option[<?php echo $option_row; ?>][required]">
										<?php if ($product_option['required']) { ?>
											<option value="1" selected="selected"><?php echo $text_yes; ?></option>
											<option value="0"><?php echo $text_no; ?></option>
										<?php } else { ?>
											<option value="1"><?php echo $text_yes; ?></option>
											<option value="0" selected="selected"><?php echo $text_no; ?></option>
										<?php } ?>
									</select>
								</td>
							</tr>

							<?php if ($product_option['type'] == 'text') { ?>
								<tr>
									<td class="textleft"><?php echo $entry_option_value; ?></td>
									<td class="textleft">
										<input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" />
									</td>
								</tr>
							<?php } ?>

							<?php if ($product_option['type'] == 'textarea') { ?>
								<tr>
									<td class="textleft"><?php echo $entry_option_value; ?></td>
									<td class="textleft">
										<textarea name="product_option[<?php echo $option_row; ?>][option_value]" cols="40" rows="5"><?php echo $product_option['option_value']; ?></textarea>
									</td>
								</tr>
							<?php } ?>

							<?php if ($product_option['type'] == 'file') { ?>
								<tr>
									<td class="textleft"><?php echo $entry_option_value; ?></td>
									<td class="textleft">
										<input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" />
									</td>
								</tr>
							<?php } ?>

							<?php if ($product_option['type'] == 'date') { ?>
								<tr>
									<td class="textleft"><?php echo $entry_option_value; ?></td>
									<td class="textleft">
										<input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="date" />
									</td>
								</tr>
							<?php } ?>

							<?php if ($product_option['type'] == 'datetime') { ?>
								<tr>
									<td class="textleft"><?php echo $entry_option_value; ?></td>
									<td class="textleft">
										<input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="datetime" />
									</td>
								</tr>
							<?php } ?>

							<?php if ($product_option['type'] == 'time') { ?>
								<tr>
									<td class="textleft"><?php echo $entry_option_value; ?></td>
									<td class="textleft">
										<input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="time" />
									</td>
								</tr>
							<?php } ?>

						</tbody>
					</table>

					<?php if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') { ?>
						<table id="option-value<?php echo $option_row; ?>" class="">
							<thead>
								<tr>
									<th scope="col" class="center"><?php echo $column_option_value; ?></th>
									<th scope="col" class="center"><?php echo $column_quantity; ?></th>
									<th scope="col" class="center"><?php echo $column_subtract; ?></th>
									<th scope="col" class="center"><?php echo $column_weight; ?></th>
									<th scope="col" class="center"><?php echo $column_price; ?></th>
									<th scope="col" class="center"><?php echo $column_option_points; ?></th>
									<th></th>
								</tr>
							</thead>
							<?php foreach ($product_option['product_option_value'] as $product_option_value) { ?>
								<tbody id="option-value-row<?php echo $option_value_row; ?>">
									<tr>
										<td class="center">
											<select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][option_value_id]">
												<?php if (isset($option_values[$product_option['option_id']])) { ?>
													<?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
														<?php if ($option_value['option_value_id'] == $product_option_value['option_value_id']) { ?>
															<option value="<?php echo $option_value['option_value_id']; ?>" selected="selected"><?php echo $option_value['name']; ?></option>
														<?php } else { ?>
															<option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
														<?php } ?>
													<?php } ?>
												<?php } ?>
											</select>
											<input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_value_id]" value="<?php echo $product_option_value['product_option_value_id']; ?>" />
										</td>
										<td class="center">
											<input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][quantity]" value="<?php echo $product_option_value['quantity']; ?>" size="3" />
										</td>
										<td class="center">
											<select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]">
												<?php if ($product_option_value['subtract']) { ?>
													<option value="1" selected="selected"><?php echo $text_yes; ?></option>
													<option value="0"><?php echo $text_no; ?></option>
												<?php } else { ?>
													<option value="1"><?php echo $text_yes; ?></option>
													<option value="0" selected="selected"><?php echo $text_no; ?></option>
												<?php } ?>
											</select>
										</td>
										<td class="center">
											<select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight_prefix]">
												<?php if ($product_option_value['weight_prefix'] == '+') { ?>
													<option value="+" selected="selected">+</option>
												<?php } else { ?>
													<option value="+">+</option>
												<?php } ?>
												<?php if ($product_option_value['weight_prefix'] == '-') { ?>
													<option value="-" selected="selected">-</option>
												<?php } else { ?>
													<option value="-">-</option>
												<?php } ?>
											</select>
											<input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight]" value="<?php echo $product_option_value['weight']; ?>" size="5" />
										</td>
										<td class="center">
											<select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price_prefix]">
												<?php if ($product_option_value['price_prefix'] == '+') { ?>
													<option value="+" selected="selected">+</option>
												<?php } else { ?>
													<option value="+">+</option>
												<?php } ?>
												<?php if ($product_option_value['price_prefix'] == '-') { ?>
													<option value="-" selected="selected">-</option>
												<?php } else { ?>
													<option value="-">-</option>
												<?php } ?>
											</select>
											<input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price]" value="<?php echo $product_option_value['price']; ?>" size="5" />
										</td>
										<td class="center">
											<select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points_prefix]">
												<?php if ($product_option_value['points_prefix'] == '+') { ?>
													<option value="+" selected="selected">+</option>
												<?php } else { ?>
													<option value="+">+</option>
												<?php } ?>
												<?php if ($product_option_value['points_prefix'] == '-') { ?>
													<option value="-" selected="selected">-</option>
												<?php } else { ?>
													<option value="-">-</option>
												<?php } ?>
											</select>
											<input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points]" value="<?php echo $product_option_value['points']; ?>" size="5" />
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
									<td colspan="6">
									</td>
									<td class="center">
										<a onclick="addOptionValue('<?php echo $option_row; ?>');" class="button button_green"><?php echo $button_add; ?></a>
									</td>
								</tr>
							</tfoot>
						</table>

						<select id="option-values<?php echo $option_row; ?>" style="display: none;">
							<?php if (isset($option_values[$product_option['option_id']])) { ?>
								<?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
									<option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					<?php } ?>

				</div>
				<?php $option_row++; ?>
			<?php } ?>
</div>


<div id="tab-discount">
			<table id="discount" class="">
				<thead>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_customer_group; ?></th>
						<th scope="col" class="center"><?php echo $column_quantity; ?></th>
						<th scope="col" class="center"><?php echo $column_priority; ?></th>
						<th scope="col" class="center"><?php echo $column_price; ?></th>
						<th scope="col" class="center"><?php echo $column_date_start; ?></th>
						<th scope="col" class="center"><?php echo $column_date_end; ?></th>
						<th></th>
					</tr>
				</thead>
				<?php $discount_row = 0; ?>
				<?php foreach ($product_discounts as $product_discount) { ?>
					<tbody id="discount-row<?php echo $discount_row; ?>">
						<tr>
							<td class="textleft">
								<select name="product_discount[<?php echo $discount_row; ?>][customer_group_id]">
									<?php foreach ($customer_groups as $customer_group) { ?>
										<?php if ($customer_group['customer_group_id'] == $product_discount['customer_group_id']) { ?>
											<option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td class="center">
								<input type="text" name="product_discount[<?php echo $discount_row; ?>][quantity]" value="<?php echo $product_discount['quantity']; ?>" size="2" />
							</td>
							<td class="center">
								<input type="text" name="product_discount[<?php echo $discount_row; ?>][priority]" value="<?php echo $product_discount['priority']; ?>" size="2" />
							</td>
							<td class="center">
								<input type="text" name="product_discount[<?php echo $discount_row; ?>][price]" value="<?php echo $product_discount['price']; ?>" />
							</td>
							<td class="center">
								<input type="text" name="product_discount[<?php echo $discount_row; ?>][date_start]" value="<?php echo $product_discount['date_start']; ?>" class="date" />
							</td>
							<td class="center">
								<input type="text" name="product_discount[<?php echo $discount_row; ?>][date_end]" value="<?php echo $product_discount['date_end']; ?>" class="date" />
							</td>
							<td class="center">
								<a onclick="$('#discount-row<?php echo $discount_row; ?>').remove();" class="button button_red"><?php echo $button_subtract; ?></a>
							</td>
						</tr>
					</tbody>
				<?php $discount_row++; ?>
				<?php } ?>
				<tfoot>
					<tr>
						<td colspan="6">
						</td>
						<td class="center">
							<a onclick="addDiscount();" class="button button_green"><?php echo $button_add; ?></a>
						</td>
					</tr>
				</tfoot>
			</table>
</div>


<div id="tab-special">
			<table id="special" class="">
				<thead>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_customer_group; ?></th>
						<th scope="col" class="center"><?php echo $column_priority; ?></th>
						<th scope="col" class="center"><?php echo $column_price; ?></th>
						<th scope="col" class="center"><?php echo $column_date_start; ?></th>
						<th scope="col" class="center"><?php echo $column_date_end; ?></th>
						<th></th>
					</tr>
				</thead>
				<?php $special_row = 0; ?>
				<?php foreach ($product_specials as $product_special) { ?>
					<tbody id="special-row<?php echo $special_row; ?>">
						<tr>
							<td class="textleft">
								<select name="product_special[<?php echo $special_row; ?>][customer_group_id]">
								<?php foreach ($customer_groups as $customer_group) { ?>
									<?php if ($customer_group['customer_group_id'] == $product_special['customer_group_id']) { ?>
										<option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
									<?php } ?>
								<?php } ?>
								</select>
							</td>
							<td class="center">
								<input type="text" name="product_special[<?php echo $special_row; ?>][priority]" value="<?php echo $product_special['priority']; ?>" size="2" />
							</td>
							<td class="center">
								<input type="text" name="product_special[<?php echo $special_row; ?>][price]" value="<?php echo $product_special['price']; ?>" />
							</td>
							<td class="center">
								<input type="text" name="product_special[<?php echo $special_row; ?>][date_start]" value="<?php echo $product_special['date_start']; ?>" class="date" />
							</td>
							<td class="center">
								<input type="text" name="product_special[<?php echo $special_row; ?>][date_end]" value="<?php echo $product_special['date_end']; ?>" class="date" />
							</td>
							<td class="center">
								<a onclick="$('#special-row<?php echo $special_row; ?>').remove();" class="button button_red"><?php echo $button_subtract; ?></a>
							</td>
						</tr>
					</tbody>
				<?php $special_row++; ?>
				<?php } ?>
				<tfoot>
					<tr>
						<td colspan="5">
						</td>
						<td class="center">
							<a onclick="addSpecial();" class="button button_green"><?php echo $button_add; ?></a>
						</td>
					</tr>
				</tfoot>
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
						<th></th>
					</tr>
				</thead>
				<?php $image_row = 0; ?>
				<?php foreach ($product_images as $product_image) { ?>
					<tbody id="image-row<?php echo $image_row; ?>">
						<tr>
							<td class="textleft">
								<div class="image">
									<img src="<?php echo $product_image['thumb']; ?>" alt="" id="thumb<?php echo $image_row; ?>" />
									<input type="hidden" name="product_image[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="image<?php echo $image_row; ?>" />
									<br />
									<a onclick="image_upload('image<?php echo $image_row; ?>', 'thumb<?php echo $image_row; ?>');"><?php echo $text_browse; ?></a>
									&nbsp;&nbsp;|&nbsp;&nbsp;
									<a onclick="$('#thumb<?php echo $image_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $image_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a>
								</div>
							</td>
							<td class="center">
								<input type="text" name="product_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $product_image['sort_order']; ?>" size="2" />
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


<div id="tab-reward">
			<table class="">
				<tbody>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_points; ?></th>
						<td class="textleft">
							<input type="text" name="points" value="<?php echo $points; ?>" />
							<?php echo $text_points_hint; ?>
						</td>
					</tr>
				</tbody>
			</table>

			<table class="">
				<thead>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_customer_group; ?></th>
						<th scope="col" class="textleft"><?php echo $column_reward; ?></th>
					</tr>
				</thead>
				<?php foreach ($customer_groups as $customer_group) { ?>
					<tbody>
						<tr>
							<td class="textleft">
								<?php echo $customer_group['name']; ?>
							</td>
							<td class="textleft">
								<input type="text" name="product_reward[<?php echo $customer_group['customer_group_id']; ?>][points]" value="<?php echo isset($product_reward[$customer_group['customer_group_id']]) ? $product_reward[$customer_group['customer_group_id']]['points'] : ''; ?>" />
							</td>
						</tr>
					</tbody>
				<?php } ?>
			</table>
</div>


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
								<select name="product_layout[0][layout_id]">
									<option value=""></option>
									<?php foreach ($layouts as $layout) { ?>
										<?php if (isset($product_layout[0]) && $product_layout[0] == $layout['layout_id']) { ?>
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
									<select name="product_layout[<?php echo $store['store_id']; ?>][layout_id]">
										<option value=""></option>
										<?php foreach ($layouts as $layout) { ?>
											<?php if (isset($product_layout[$store['store_id']]) && $product_layout[$store['store_id']] == $layout['layout_id']) { ?>
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
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	},

	select: function(event, ui) {
		$('#product-related' + ui.item.value).remove();
		$('#product-related').append('<div id="product-related' + ui.item.value + '">' + ui.item.label + '<img src="<?php echo ICON; ?>/16/delete.png" /><input type="hidden" name="product_related[]" value="' + ui.item.value + '" /></div>');
		$('#product-related div:odd').attr('class', 'odd');
		$('#product-related div:even').attr('class', 'even');
		return false;
	}
});

$('#product-related div img').live('click', function() {
	$(this).parent().remove();
	$('#product-related div:odd').attr('class', 'odd');
	$('#product-related div:even').attr('class', 'even');
});
//--></script>

<script type="text/javascript"><!--
var attribute_row = <?php echo $attribute_row; ?>;

function addAttribute() {
	html = '<tbody id="attribute-row' + attribute_row + '">';
	html += '<tr>';
	html += '<td class="texttop"><input type="text" name="product_attribute[' + attribute_row + '][name]" value="" /><input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
	html += '<td class="texttop">';
	<?php foreach ($languages as $language) { ?>
		html += '<textarea name="product_attribute[' + attribute_row + '][product_attribute_description][<?php echo $language['language_id']; ?>][text]" cols="40" rows="5"></textarea><img src="<?php echo URL_IMAGE; ?>flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />';
	<?php } ?>
	html += '</td>';
	html += '<td class="center"><a onclick="$(\'#attribute-row' + attribute_row + '\').remove();" class="button button_red"><?php echo $button_subtract; ?></a></td>';
	html += '</tr>';
	html += '</tbody>';

	$('#attribute tfoot').before(html);
	attributeautocomplete(attribute_row);
	attribute_row++;
}

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

function attributeautocomplete(attribute_row) {
	$('input[name=\'product_attribute[' + attribute_row + '][name]\']').catcomplete({
		delay: 0,
		source: function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/attribute/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							category: item.attribute_group,
							label: item.name,
							value: item.attribute_id
						}
					}));
				}
			});
		},

		select: function(event, ui) {
			$('input[name=\'product_attribute[' + attribute_row + '][name]\']').attr('value', ui.item.label);
			$('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').attr('value', ui.item.value);
			return false;
		}
	});
}

$('#attribute tbody').each(function(index, element) {
	attributeautocomplete(index);
});
//--></script>

<script type="text/javascript"><!--
var option_row = <?php echo $option_row; ?>;

$('input[name=\'option\']').catcomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/option/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						category: item.category,
						label: item.name,
						value: item.option_id,
						type: item.type,
						option_value: item.option_value
					}
				}));
			}
		});
	},

	select: function(event, ui) {
		html = '<div id="tab-option-' + option_row + '" class="vtabs-content">';
		html += '<input type="hidden" name="product_option[' + option_row + '][product_option_id]" value="" />';
		html += '<input type="hidden" name="product_option[' + option_row + '][name]" value="' + ui.item.label + '" />';
		html += '<input type="hidden" name="product_option[' + option_row + '][option_id]" value="' + ui.item.value + '" />';
		html += '<input type="hidden" name="product_option[' + option_row + '][type]" value="' + ui.item.type + '" />';
		html += '<table class="">';
		html += '<tr>';
		html += '<th class="textleft"><?php echo $entry_required; ?></th>';
		html += '<td class="textleft"><select name="product_option[' + option_row + '][required]">';
		html += '<option value="1"><?php echo $text_yes; ?></option>';
		html += '<option value="0"><?php echo $text_no; ?></option>';
		html += '</select></td>';
		html += '</tr>';

		if (ui.item.type == 'text') {
			html += '<tr>';
			html += '<td class="textleft"><?php echo $entry_option_value; ?></td>';
			html += '<td class="textleft"><input type="text" name="product_option[' + option_row + '][option_value]" value="" /></td>';
			html += '</tr>';
		}

		if (ui.item.type == 'textarea') {
			html += '<tr>';
			html += '<td class="textleft"><?php echo $entry_option_value; ?></td>';
			html += '<td class="textleft"><textarea name="product_option[' + option_row + '][option_value]" cols="40" rows="5"></textarea></td>';
			html += '</tr>';
		}

		if (ui.item.type == 'file') {
			html += '<tr style="display: none;">';
			html += '<td class="textleft"><?php echo $entry_option_value; ?></td>';
			html += '<td class="textleft"><input type="text" name="product_option[' + option_row + '][option_value]" value="" /></td>';
			html += '</tr>';
		}

		if (ui.item.type == 'date') {
			html += '<tr>';
			html += '<td class="textleft"><?php echo $entry_option_value; ?></td>';
			html += '<td class="textleft"><input type="text" name="product_option[' + option_row + '][option_value]" value="" class="date" /></td>';
			html += '</tr>';
		}

		if (ui.item.type == 'datetime') {
			html += '<tr>';
			html += '<td class="textleft"><?php echo $entry_option_value; ?></td>';
			html += '<td class="textleft"><input type="text" name="product_option[' + option_row + '][option_value]" value="" class="datetime" /></td>';
			html += '</tr>';
		}

		if (ui.item.type == 'time') {
			html += '<tr>';
			html += '<td class="textleft"><?php echo $entry_option_value; ?></td>';
			html += '<td class="textleft"><input type="text" name="product_option[' + option_row + '][option_value]" value="" class="time" /></td>';
			html += '</tr>';
		}

		html += '  </table>';

		if (ui.item.type == 'select' || ui.item.type == 'radio' || ui.item.type == 'checkbox' || ui.item.type == 'image') {
			html += '<table id="option-value' + option_row + '" class="">';
			html += '   <thead>';
			html += '      <tr>';
			html += '<th scope="col" class="center"><?php echo $column_option_value; ?></th>';
			html += '<th scope="col" class="center"><?php echo $column_quantity; ?></th>';
			html += '<th scope="col" class="center"><?php echo $column_subtract; ?></th>';
			html += '<th scope="col" class="center"><?php echo $column_weight; ?></th>';
			html += '<th scope="col" class="center"><?php echo $column_price; ?></th>';
			html += '<th scope="col" class="center"><?php echo $column_option_points; ?></th>';
			html += '<th></th>';
			html += '      </tr>';
			html += '    </thead>';
			html += '    <tfoot>';
			html += '      <tr>';
			html += '        <td colspan="6"></td>';
			html += '        <td class="center"><a onclick="addOptionValue(' + option_row + ');" class="button button_green"><?php echo $button_add; ?></a></td>';
			html += '      </tr>';
			html += '    </tfoot>';
			html += '  </table>';
			html += '  <select id="option-values' + option_row + '" style="display: none;">';

			for (i = 0; i < ui.item.option_value.length; i++) {
				html += '  <option value="' + ui.item.option_value[i]['option_value_id'] + '">' + ui.item.option_value[i]['name'] + '</option>';
		    }

			html += '  </select>';
			html += '</div>';
		}

		$('#tab-option').append(html);
		$('#option-add').before('<a href="#tab-option-' + option_row + '" id="option-' + option_row + '">' + ui.item.label + '&nbsp;<img src="<?php echo ICON; ?>/16/delete.png" alt="" onclick="$(\'#vtab-option a:first\').trigger(\'click\'); $(\'#option-' + option_row + '\').remove(); $(\'#tab-option-' + option_row + '\').remove(); return false;" /></a>');
		$('#vtab-option a').tabs();
//		$('#option-' + option_row).trigger('click');
		$('#option-' + option_row).trigger('focus');

		$('.date').datepicker({dateFormat: 'yy-mm-dd'});
		$('.datetime').datetimepicker({
			dateFormat: 'yy-mm-dd',
			timeFormat: 'h:m'
		});

		$('.time').timepicker({timeFormat: 'h:m'});

		option_row++;
		return false;
	}
});
//--></script>

<script type="text/javascript"><!--
var option_value_row = <?php echo $option_value_row; ?>;

function addOptionValue(option_row) {
	html  = '<tbody id="option-value-row' + option_value_row + '">';
	html += '  <tr>';

	html += '    <td class="center"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][option_value_id]">';
	html += $('#option-values' + option_row).html();
	html += '    </select><input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_value_id]" value="" /></td>';

	html += '    <td class="center"><input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][quantity]" value="" size="3" /></td>';

	html += '    <td class="center"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]">';
	html += '      <option value="1"><?php echo $text_yes; ?></option>';
	html += '      <option value="0"><?php echo $text_no; ?></option>';
	html += '    </select></td>';

	html += '    <td class="center"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]">';
	html += '      <option value="+">+</option>';
	html += '      <option value="-">-</option>';
	html += '    </select>';
	html += '    <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="" size="5" /></td>';

	html += '    <td class="center"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price_prefix]">';
	html += '      <option value="+">+</option>';
	html += '      <option value="-">-</option>';
	html += '    </select>';
	html += '    <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price]" value="" size="5" /></td>';

	html += '    <td class="center"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points_prefix]">';
	html += '      <option value="+">+</option>';
	html += '      <option value="-">-</option>';
	html += '    </select>';
	html += '    <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="" size="5" /></td>';


	html += '    <td class="center"><a onclick="$(\'#option-value-row' + option_value_row + '\').remove();" class="button button_red"><?php echo $button_subtract; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#option-value' + option_row + ' tfoot').before(html);
	option_value_row++;
}
//--></script>

<script type="text/javascript"><!--
var discount_row = <?php echo $discount_row; ?>;

function addDiscount() {
	html = '<tbody id="discount-row' + discount_row + '">';
	html += '<tr>';
	html += '<td class="textleft"><select name="product_discount[' + discount_row + '][customer_group_id]">';
	<?php foreach ($customer_groups as $customer_group) { ?>
		html += '<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
	<?php } ?>
	html += '</select></td>';
	html += '<td class="center"><input type="text" name="product_discount[' + discount_row + '][quantity]" value="" size="2" /></td>';
	html += '<td class="center"><input type="text" name="product_discount[' + discount_row + '][priority]" value="" size="2" /></td>';
	html += '<td class="center"><input type="text" name="product_discount[' + discount_row + '][price]" value="" /></td>';
	html += '<td class="center"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" class="date" /></td>';
	html += '<td class="center"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" class="date" /></td>';
	html += '<td class="center"><a onclick="$(\'#discount-row' + discount_row + '\').remove();" class="button button_red"><?php echo $button_subtract; ?></a></td>';
	html += '</tr>';
	html += '</tbody>';

	$('#discount tfoot').before(html);
	$('#discount-row' + discount_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});
	discount_row++;
}
//--></script>

<script type="text/javascript"><!--
var special_row = <?php echo $special_row; ?>;

function addSpecial() {
	html = '<tbody id="special-row' + special_row + '">';
	html += '<tr>';
	html += '<td class="textleft"><select name="product_special[' + special_row + '][customer_group_id]">';
	<?php foreach ($customer_groups as $customer_group) { ?>
		html += '<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
	<?php } ?>
	html += '</select></td>';
	html += '<td class="center"><input type="text" name="product_special[' + special_row + '][priority]" value="" size="2" /></td>';
	html += '<td class="center"><input type="text" name="product_special[' + special_row + '][price]" value="" /></td>';
	html += '<td class="center"><input type="text" name="product_special[' + special_row + '][date_start]" value="" class="date" /></td>';
	html += '<td class="center"><input type="text" name="product_special[' + special_row + '][date_end]" value="" class="date" /></td>';
	html += '<td class="center"><a onclick="$(\'#special-row' + special_row + '\').remove();" class="button button_red"><?php echo $button_subtract; ?></a></td>';
	html += '</tr>';
	html += '</tbody>';

	$('#special tfoot').before(html);
	$('#special-row' + special_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});
	special_row++;
}
//--></script>

<script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
	html  = '<tbody id="image-row' + image_row + '">';
	html += '  <tr>';
	html += '    <td class="textleft"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + image_row + '" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="image' + image_row + '" /><br /><a onclick="image_upload(\'image' + image_row + '\', \'thumb' + image_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + image_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + image_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
	html += '    <td class="center"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" size="2" /></td>';
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