var return_product_row = return_product_row;

function addReturnProduct() {
	html = '<div id="return-product-row' + return_product_row + '">';
	html += '<div class="content">';
	html += '		<div class="return-product">';
	html += '			<div class="return-name"><span class="required">*</span> ' + entry_product + '<br /><input type="text" name="return_product[' + return_product_row + '][name]" value="" /></div>';
	html += '			<div class="return-model"><span class="required">*</span> ' + entry_model + '<br /><input type="text" name="return_product[' + return_product_row + '][model]" value="" /></div>';
	html += '			<div class="return-quantity">' + entry_quantity + '<br /><input type="text" name="return_product[' + return_product_row + '][quantity]" value="1" /></div>';
	html += '		</div>';
	html += '		<div class="return-detail">';
	html += '			<div class="return-reason"><span class="required">*</span> ' + entry_reason + '<br />';
	html += '				<table>';
for (var return_reason in return_reasons) {
	html += '<tr>';
	html += '<td width="1"><input type="radio" name="return_product[' + return_product_row + '][return_reason_id]" value="' + return_reason['return_reason_id'] + '" id="return-reason-id' + return_product_row + return_reason['return_reason_id'] + '" /></td>';
	html += '<td><label for="return-reason-id' + return_product_row + return_reason['return_reason_id'] + '">' + return_reason['name'] + '</label></td>';
	html += '</tr>';
}
	html += '				</table>';
	html += '		</div>';
	html += '		<div class="return-opened">' + entry_opened + '<br />';
	html += '			<input type="radio" name="return_product[' + return_product_row + '][opened]" value="1" id="opened' + return_product_row + '" checked="checked" />' + text_yes + '<label for="opened' + return_product_row + '"></label> <input type="radio" name="return_product[' + return_product_row + '][opened]" value="0" id="unopened' + return_product_row + '" /><label for="unopened' + return_product_row + '">' + text_no + '</label><br /><br />';
	html += entry_fault_detail + '<br /><textarea name="return_product[' + return_product_row + '][comment]" cols="45" rows="6"></textarea>';
	html += '		</div>';
	html += '		<div class="return-remove"><a onclick="$(\'#return-product-row' + return_product_row + '\').remove();" class="button"><span>' + button_remove + '</span></a></div>';
	html += '</div>';
	html += '</div>';
	html += '<div class="clearfix"></div>';

	$('#return-product').append(html);
 
	$('#return-product-row' + return_product_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});

	return_product_row++;
}

$('.date').datepicker({dateFormat: 'yy-mm-dd'});