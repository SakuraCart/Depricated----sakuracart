<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/send_email.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

<table id="mail" class="form">
	<tr>
		<th scope="row" class="">
			<?php echo $entry_store; ?>
		</th>
		<td class="textleft">
			<select name="store_id">
				<option value="0"><?php echo $text_default; ?></option>
				<?php foreach ($stores as $store) { ?>
					<option value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
				<?php } ?>
			</select>
		</td>
	</tr>
	<tr>
		<th scope="row" class="">
			<?php echo $entry_to; ?>
		</th>
		<td class="textleft">
			<select name="to">
				<option value="newsletter"><?php echo $text_newsletter; ?></option>
				<option value="customer_all"><?php echo $text_customer_all; ?></option>
				<option value="customer_group"><?php echo $text_customer_group; ?></option>
				<option value="customer"><?php echo $text_customer; ?></option>
				<option value="affiliate_all"><?php echo $text_affiliate_all; ?></option>
				<option value="affiliate"><?php echo $text_affiliate; ?></option>
				<option value="product"><?php echo $text_product; ?></option>
			</select>
		</td>
	</tr>

	<tbody id="to-customer-group" class="to">
		<tr>
			<th scope="row" class="">
				<?php echo $entry_customer_group; ?>
			</th>
			<td class="textleft">
				<select name="customer_group_id">
					<?php foreach ($customer_groups as $customer_group) { ?>
						<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
					<?php } ?>
				</select>
			</td>
		</tr>
	</tbody>

	<tbody id="to-customer" class="to">
		<tr>
			<th scope="row" class="">
				<?php echo $entry_customer; ?>
			</th>
			<td class="textleft">
				<input type="text" name="customers" value="" />
			</td>
		</tr>
		<tr>
			<th scope="row" class="">
			</th>
			<td class="textleft">
				<div id="customer" class="scrollbox"></div>
			</td>
		</tr>
	</tbody>

	<tbody id="to-affiliate" class="to">
		<tr>
			<th scope="row" class="">
				<?php echo $entry_affiliate; ?>
			</th>
			<td class="textleft">
				<input type="text" name="affiliates" value="" />
			</td>
		</tr>
		<tr>
			<th scope="row" class="">
			</th>
			<td class="textleft">
				<div id="affiliate" class="scrollbox"></div>
			</td>
		</tr>
	</tbody>

	<tbody id="to-product" class="to">
		<tr>
			<th scope="row" class="">
				<?php echo $entry_product; ?>
			</th>
			<td class="textleft">
				<input type="text" name="products" value="" />
			</td>
		</tr>
		<tr>
			<th scope="row" class="">
			</th>
			<td class="textleft">
				<div id="product" class="scrollbox"></div>
			</td>
		</tr>
	</tbody>

	<tr>
		<th scope="row" class="">
			<?php echo $entry_subject; ?>
		</th>
		<td class="textleft">
			<input type="text" name="subject" value="" />
		</td>
	</tr>
	<tr>
		<th scope="row" class="texttop">
			<?php echo $entry_message; ?>
		</th>
		<td class="textleft">
			<textarea name="message"></textarea>
		</td>
	</tr>
</table>


<script type="text/javascript"><!--
$('textarea[name=\'message\']').ckeditor({
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
//--></script>
<script type="text/javascript"><!--$('select[name=\'to\']').bind('change', function() {
	$('#mail .to').hide();
	$('#mail #to-' + $(this).attr('value').replace('_', '-')).show();
});
$('select[name=\'to\']').trigger('change');
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

$('input[name=\'customers\']').catcomplete({
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
						value: item.customer_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('#customer' + ui.item.value).remove();
		$('#customer').append('<div id="customer' + ui.item.value + '">' + ui.item.label + '<img src="<?php echo ICON; ?>/16/delete.png" /><input type="hidden" name="customer[]" value="' + ui.item.value + '" /></div>');
		$('#customer div:odd').attr('class', 'odd');
		$('#customer div:even').attr('class', 'even');
		return false;
	}
});

$('#customer div img').live('click', function() {
	$(this).parent().remove();
	$('#customer div:odd').attr('class', 'odd');
	$('#customer div:even').attr('class', 'even');});
//--></script>
<script type="text/javascript"><!--$('input[name=\'affiliates\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=sale/affiliate/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.affiliate_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('#affiliate' + ui.item.value).remove();
		$('#affiliate').append('<div id="affiliate' + ui.item.value + '">' + ui.item.label + '<img src="<?php echo ICON; ?>/16/delete.png" /><input type="hidden" name="affiliate[]" value="' + ui.item.value + '" /></div>');
		$('#affiliate div:odd').attr('class', 'odd');
		$('#affiliate div:even').attr('class', 'even');
		return false;
	}
});

$('#affiliate div img').live('click', function() {
	$(this).parent().remove();
	$('#affiliate div:odd').attr('class', 'odd');
	$('#affiliate div:even').attr('class', 'even');});

$('input[name=\'products\']').autocomplete({
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
		$('#product' + ui.item.value).remove();
		$('#product').append('<div id="product' + ui.item.value + '">' + ui.item.label + '<img src="<?php echo ICON; ?>/16/delete.png" /><input type="hidden" name="product[]" value="' + ui.item.value + '" /></div>');
		$('#product div:odd').attr('class', 'odd');
		$('#product div:even').attr('class', 'even');
		return false;
	}
});

$('#product div img').live('click', function() {
	$(this).parent().remove();
	$('#product div:odd').attr('class', 'odd');
	$('#product div:even').attr('class', 'even');
});

function send(url) {
	$('textarea[name=\'message\']').html($('textarea[name=\'message\']').val());
	$.ajax({
		url: url,
		type: 'post',
		data: $('select, input, textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-send').attr('disabled', true);
			$('#button-send').before('<span class="wait"><img src="view/image/loading.gif" alt="" />&nbsp;</span>');
		},
		complete: function() {
			$('#button-send').attr('disabled', false);
			$('.wait').remove();
		},
		success: function(json) {
			$('.success, .warning, .error').remove();

			if (json['error']) {
				if (json['error']['warning']) {
					$('.box').before('<div class="warning" style="display: none;">' + json['error']['warning'] + '</div>');
					$('.warning').fadeIn('slow');
				}

				if (json['error']['subject']) {
					$('input[name=\'subject\']').after('<span class="error">' + json['error']['subject'] + '</span>');
				}

				if (json['error']['message']) {
					$('textarea[name=\'message\']').parent().append('<span class="error">' + json['error']['message'] + '</span>');
				}
			}

			if (json['next']) {
				if (json['success']) {
					$('.box').before('<div class="success">' + json['success'] + '</div>');
					send(json['next']);
				}
			} else {
				if (json['success']) {
					$('.box').before('<div class="success" style="display: none;">' + json['success'] + '</div>');
					$('.success').fadeIn('slow');
				}
			}
		}
	});
}
//--></script>


			<div class="button_container container_grey">
				<a onclick="location = '<?php echo $cancel; ?>';" class="button button_red left"><?php echo $button_cancel; ?></a>
				<a id="button-send" onclick="send('index.php?route=sale/contact/send&token=<?php echo $token; ?>');" class="button button_green right"><?php echo $button_send; ?></a>
			</div>

		</form>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>