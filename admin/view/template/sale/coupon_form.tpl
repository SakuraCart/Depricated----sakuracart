<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/coupon.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

			<div id="tabs" class="htabs">
				<a href="#tab-general"><?php echo $tab_general; ?></a>
				<?php if ($coupon_id) { ?>
					<a href="#tab-history"><?php echo $tab_coupon_history; ?></a>
				<?php } ?>
			</div>

			<div id="tab-general">

				<table class="">
					<tbody>
						<tr>
							<th scope="row" class="">
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
							<th scope="row" class="">
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
							<th scope="row" class="">
								<?php echo $entry_type; ?>
							</th>
							<td class="textleft">
								<select name="type">
									<?php if ($type == 'P') { ?>
										<option value="P" selected="selected"><?php echo $text_percent; ?></option>
									<?php } else { ?>
										<option value="P"><?php echo $text_percent; ?></option>
									<?php } ?>
									<?php if ($type == 'F') { ?>
										<option value="F" selected="selected"><?php echo $text_amount; ?></option>
									<?php } else { ?>
										<option value="F"><?php echo $text_amount; ?></option>
									<?php } ?>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_discount; ?>
							</th>
							<td class="textleft">
								<input type="text" name="discount" value="<?php echo $discount; ?>" />
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_total; ?>
							</th>
							<td class="textleft">
								<input type="text" name="total" value="<?php echo $total; ?>" />
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_logged; ?>
							</th>
							<td class="textleft">
								<?php if ($logged) { ?>
									<input type="radio" name="logged" value="1" checked="checked" />
									<?php echo $text_yes; ?>
									<input type="radio" name="logged" value="0" />
									<?php echo $text_no; ?>
								<?php } else { ?>
									<input type="radio" name="logged" value="1" />
									<?php echo $text_yes; ?>
									<input type="radio" name="logged" value="0" checked="checked" />
									<?php echo $text_no; ?>
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_shipping; ?>
							</th>
							<td class="textleft">
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
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_category; ?>
							</th>
							<td class="textleft">
								<div class="scrollbox wide">
									<?php $class = 'odd'; ?>
									<?php foreach ($categories as $category) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<div class="<?php echo $class; ?>">
											<input type="checkbox" name="category[]" value="<?php echo $category['category_id']; ?>" />
											<?php echo $category['name']; ?>
										</div>
									<?php } ?>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_product; ?>
							</th>
							<td class="textleft">
								<input type="text" name="product" value="" />
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
							</th>
							<td class="textleft">
								<div id="coupon-product" class="scrollbox wide">
									<?php $class = 'odd'; ?>
									<?php foreach ($coupon_product as $coupon_product) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<div id="coupon-product<?php echo $coupon_product['product_id']; ?>" class="<?php echo $class; ?>"> <?php echo $coupon_product['name']; ?><img src="<?php echo ICON; ?>/16/delete.png" />
											<input type="hidden" name="coupon_product[]" value="<?php echo $coupon_product['product_id']; ?>" />
										</div>
									<?php } ?>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_date_start; ?>
							</th>
							<td class="textleft">
								<input type="text" name="date_start" value="<?php echo $date_start; ?>" size="12" id="date-start" />
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_date_end; ?>
							</th>
							<td class="textleft">
								<input type="text" name="date_end" value="<?php echo $date_end; ?>" size="12" id="date-end" />
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_uses_total; ?>
							</th>
							<td class="textleft">
								<input type="text" name="uses_total" value="<?php echo $uses_total; ?>" />
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
								<?php echo $entry_uses_customer; ?>
							</th>
							<td class="textleft">
								<input type="text" name="uses_customer" value="<?php echo $uses_customer; ?>" />
							</td>
						</tr>
						<tr>
							<th scope="row" class="">
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

			</div>

			<?php if ($coupon_id) { ?>
				<div id="tab-history">
					<div id="history"></div>
				</div>
			<?php } ?>


<script type="text/javascript"><!--
$('input[name=\'category[]\']').bind('change', function() {
	var filter_category_id = this;
	$.ajax({
		url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_category_id=' +  filter_category_id.value + '&limit=10000',
		dataType: 'json',
		success: function(json) {
			for (i = 0; i < json.length; i++) {
				if ($(filter_category_id).attr('checked') == 'checked') {
					$('#coupon-product' + json[i]['product_id']).remove();

					$('#coupon-product').append('<div id="coupon-product' + json[i]['product_id'] + '">' + json[i]['name'] + '<img src="<?php echo ICON; ?>/16/delete.png" /><input type="hidden" name="coupon_product[]" value="' + json[i]['product_id'] + '" /></div>');
				} else {
					$('#coupon-product' + json[i]['product_id']).remove();
				}
			}
			$('#coupon-product div:odd').attr('class', 'odd');
			$('#coupon-product div:even').attr('class', 'even');
		}
	});
});

$('input[name=\'product\']').autocomplete({
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
		$('#coupon-product' + ui.item.value).remove();
		$('#coupon-product').append('<div id="coupon-product' + ui.item.value + '">' + ui.item.label + '<img src="<?php echo ICON; ?>/16/delete.png" /><input type="hidden" name="coupon_product[]" value="' + ui.item.value + '" /></div>');
		$('#coupon-product div:odd').attr('class', 'odd');
		$('#coupon-product div:even').attr('class', 'even');
		$('input[name=\'product\']').val('');
		return false;
	}
});

$('#coupon-product div img').live('click', function() {
	$(this).parent().remove();
	$('#coupon-product div:odd').attr('class', 'odd');
	$('#coupon-product div:even').attr('class', 'even');});
//--></script>
<script type="text/javascript"><!--
$('#date-start').datepicker({dateFormat: 'yy-mm-dd'});
$('#date-end').datepicker({dateFormat: 'yy-mm-dd'});
//--></script>
<?php if ($coupon_id) { ?>
<script type="text/javascript"><!--
$('#history .pagination a').live('click', function() {
	$('#history').load(this.href);
	return false;
});

$('#history').load('index.php?route=sale/coupon/history&token=<?php echo $token; ?>&coupon_id=<?php echo $coupon_id; ?>');
//--></script>
<?php } ?>



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