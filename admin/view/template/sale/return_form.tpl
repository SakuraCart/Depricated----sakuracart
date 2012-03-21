<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/product_return.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<div id="tabs" class="htabs">
			<a href="#tab-return"><?php echo $tab_return; ?></a>
			<a href="#tab-product"><?php echo $tab_product; ?></a>
		</div>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

<div id="tab-return" class="htabs-content">

			<table class="">
				<tbody>
						<tr>
							<th class="texttop">
								<?php echo $entry_order_id; ?>
							</th>
							<td class="textleft">
								<?php if ($error_order_id) { ?>
									<input type="text" name="order_id" size="120" value="<?php echo $order_id; ?>" placeholder="<?php echo $error_order_id; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="order_id" size="120" value="<?php echo $order_id; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_date_ordered; ?>
							</th>
							<td class="textleft">
								<input type="text" name="date_ordered" value="<?php echo $date_ordered; ?>" class="date" />
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_customer; ?>
							</th>
							<td class="textleft">
								<input type="hidden" name="customer_id" value="<?php echo $customer_id; ?>" />
								<input type="text" name="customer" size="120" value="<?php echo $customer; ?>" />
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_firstname; ?>
							</th>
							<td class="textleft">
								<?php if ($error_firstname) { ?>
									<input type="text" name="firstname" size="120" value="<?php echo $firstname; ?>" placeholder="<?php echo $error_firstname; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="firstname" size="120" value="<?php echo $firstname; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_lastname; ?>
							</th>
							<td class="textleft">
								<?php if ($error_firstname) { ?>
									<input type="text" name="lastname" size="120" value="<?php echo $lastname; ?>" placeholder="<?php echo $error_firstname; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="lastname" size="120" value="<?php echo $lastname; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_email; ?>
							</th>
							<td class="textleft">
								<?php if ($error_email) { ?>
									<input type="text" name="email" size="120" value="<?php echo $email; ?>" placeholder="<?php echo $error_email; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="email" size="120" value="<?php echo $email; ?>" />
								<?php } ?>
							</td>
						<tr>
						<tr>
							<th class="texttop">
								<?php echo $text_telephone; ?>
							</th>
							<td class="textleft">
								<?php if ($error_telephone) { ?>
									<input type="text" name="telephone" size="120" value="<?php echo $telephone; ?>" placeholder="<?php echo $error_telephone; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="telephone" size="120" value="<?php echo $telephone; ?>" />
								<?php } ?>
							</td>
						<tr>
						</tr>
							<th class="texttop">
								<?php echo $text_return_status; ?>
							</th>
							<td class="textleft" id="return-status">
								<select name="return_status_id">
									<?php foreach ($return_statuses as $return_status) { ?>
										<?php if ($return_status['return_status_id'] == $return_status_id) { ?>
											<option value="<?php echo $return_status['return_status_id']; ?>" selected="selected"><?php echo $return_status['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $return_status['return_status_id']; ?>"><?php echo $return_status['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $text_comment; ?>
							</th>
							<td class="textleft">
								<textarea name="comment" cols="120" rows="5"><?php echo $comment; ?></textarea>
							</td>
						</tr>
				</tbody>
			</table>

</div>


<div id="tab-product" class="htabs-content">

			<table id="product" class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_product; ?></th>
						<th scope="col" class="center"><?php echo $column_model; ?></th>
						<th scope="col" class="center"><?php echo $column_quantity; ?></th>
						<th scope="col" class="center"><?php echo $column_reason; ?></th>
						<th scope="col" class="center"><?php echo $column_opened; ?></th>
						<th scope="col" class="center"><?php echo $column_comment; ?></th>
						<th scope="col" class="center"><?php echo $column_action; ?></th>
					</tr>
				</thead>
				<?php $product_row = 0; ?>
				<?php foreach ($return_products as $return_product) { ?>
				<tbody id="product-row<?php echo $product_row; ?>">
					<tr>
						<td class="texttop">
							<input type="hidden" name="return_product[<?php echo $product_row; ?>][product_id]" value="<?php echo $return_product['product_id']; ?>" />
							<input type="text" name="return_product[<?php echo $product_row; ?>][name]" value="<?php echo $return_product['name']; ?>" />
						</td>
						<td class="texttop">
							<input type="text" name="return_product[<?php echo $product_row; ?>][model]" value="<?php echo $return_product['model']; ?>" />
						</td>
						<td class="texttop">
							<input type="text" name="return_product[<?php echo $product_row; ?>][quantity]" value="<?php echo $return_product['quantity']; ?>" size="3" />
						</td>
						<td class="texttop">
							<select name="return_product[<?php echo $product_row; ?>][return_reason_id]">
								<?php foreach ($return_reasons as $return_reason) { ?>
									<?php if ($return_reason['return_reason_id'] == $return_product['return_reason_id']) { ?>
										<option value="<?php echo $return_reason['return_reason_id']; ?>" selected="selected"><?php echo $return_reason['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $return_reason['return_reason_id']; ?>"><?php echo $return_reason['name']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</td>
						<td class="texttop">
							<select name="return_product[<?php echo $product_row; ?>][opened]">
								<?php if ($return_product['opened']) { ?>
									<option value="1" selected="selected"><?php echo $text_opened; ?></option>
									<option value="0"><?php echo $text_unopened; ?></option>
								<?php } else { ?>
									<option value="1"><?php echo $text_opened; ?></option>
									<option value="0" selected="selected"><?php echo $text_unopened; ?></option>
								<?php } ?>
							</select>
						</td>
						<td class="texttop">
							<textarea name="return_product[<?php echo $product_row; ?>][comment]" cols="40" rows="5"><?php echo $return_product['comment']; ?></textarea>
						</td>
						<td class="">
							<a onclick="$('#product-row<?php echo $product_row; ?>').remove();" class="button button_red"><?php echo $button_subtract; ?></a>
						</td>
					</tr>
				</tbody>
				<?php $product_row++; ?>
				<?php } ?>
				<tfoot>
					<tr>
						<td colspan="6"></td>
						<td class="center"><a onclick="addProduct();" class="button button_green"><?php echo $button_add; ?></a></td>
					</tr>
				</tfoot>
			</table>

</div>


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

$('input[name=\'customer\']').catcomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=sale/customer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						category: item.customer_group,
						label: item.name,
						value: item.customer_id,
						firstname: item.firstname,
						lastname: item.lastname,
						email: item.email,
						telephone: item.telephone
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'customer\']').attr('value', ui.item.label);
		$('input[name=\'customer_id\']').attr('value', ui.item.value);
		$('input[name=\'firstname\']').attr('value', ui.item.firstname);
		$('input[name=\'lastname\']').attr('value', ui.item.lastname);
		$('input[name=\'email\']').attr('value', ui.item.email);
		$('input[name=\'telephone\']').attr('value', ui.item.telephone);

		return false;
	}
});
//--></script>
<script type="text/javascript"><!--
var product_row = <?php echo $product_row; ?>;

function addProduct() {
    html  = '<tbody id="product-row' + product_row + '">';
    html += '  <tr>';
    html += '    <td class="texttop"><input type="text" name="return_product[' + product_row + '][name]" value="" /><input type="hidden" name="return_product[' + product_row + '][product_id]" value="" /></td>';
    html += '    <td class="texttop"><input type="text" name="return_product[' + product_row + '][model]" value="" /></td>';
	html += '    <td class="texttop"><input type="text" name="return_product[' + product_row + '][quantity]" value="1" size="3" /></td>';
    html += '    <td class="texttop"><select name="return_product[' + product_row + '][return_reason_id]">';
    <?php foreach ($return_reasons as $return_reason) { ?>
    html += '		<option value="<?php echo $return_reason['return_reason_id']; ?>"><?php echo $return_reason['name']; ?></option>';
    <?php } ?>
    html += '    </select></td>';
    html += '    <td class="texttop"><select name="return_product[' + product_row + '][opened]">';
    html += '      <option value="1"><?php echo $text_opened; ?></option>';
	html += '      <option value="0"><?php echo $text_unopened; ?></option>';
    html += '    </select></td>';	html += '    <td class="texttop"><textarea name="return_product[' + product_row + '][comment]" cols="40" rows="5"></textarea></td>';
    html += '    <td class=""><a onclick="$(\'#product-row' + product_row + '\').remove();" class="button button_red"><?php echo $button_subtract; ?></a></td>';
    html += '  </tr>';

	html += '<tr><td colspan="5"></td><td class="texttop"><select name="return_product[' + product_row + '][return_action_id]">';
    <?php foreach ($return_actions as $return_action) { ?>
    html += '<option value="<?php echo $return_action['return_action_id']; ?>"><?php echo $return_action['name']; ?></option>';
    <?php } ?>
    html += '</select></td><td></td></tr>';

	html += '</tbody>';
	$('#product tfoot').before(html);

	productautocomplete(product_row)

	product_row++;
}

function productautocomplete(product_row) {
	$('input[name=\'return_product[' + product_row + '][name]\']').autocomplete({
		delay: 0,
		source: function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item.name,
							value: item.product_id,
							model: item.model
						}
					}));
				}
			});
		},
		select: function(event, ui) {
			$('input[name=\'return_product[' + product_row + '][product_id]\']').attr('value', ui.item.value);
			$('input[name=\'return_product[' + product_row + '][name]\']').attr('value', ui.item.label);
			$('input[name=\'return_product[' + product_row + '][model]\']').attr('value', ui.item.model);

			return false;
		}
	});
}

$('#product tbody').each(function(index, element) {
	productautocomplete(index);
});//--></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
});
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