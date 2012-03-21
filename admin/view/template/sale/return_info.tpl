<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/product_return.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<div class="htabs">
			<a href="#tab-return"><?php echo $tab_return; ?></a>
			<a href="#tab-product"><?php echo $tab_product; ?></a>
			<a href="#tab-history"><?php echo $tab_return_history; ?></a>
		</div>

<div id="tab-return" class="htabs-content">

		<table class="">
			<tbody>
					<tr>
						<th class="texttop">
							<?php echo $text_return_id; ?>
						</th>
						<td class="textleft">
							<?php echo $return_id; ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $text_order_id; ?>
						</th>
						<td class="textleft">
							<?php if ($order) { ?>
								<a href="<?php echo $order; ?>"><?php echo $order_id; ?></a>
							<?php } else { ?>
								<?php echo $order_id; ?>
							<?php } ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $text_date_ordered; ?>
						</th>
						<td class="textleft">
							<?php echo $date_ordered; ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $text_customer; ?>
						</th>
						<td class="textleft">
							<?php if ($customer) { ?>
								<a href="<?php echo $customer; ?>"><?php echo $firstname; ?> <?php echo $lastname; ?></a>
							<?php } else { ?>
								<?php echo $firstname; ?> <?php echo $lastname; ?>
							<?php } ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $text_email; ?>
						</th>
						<td class="textleft">
							<?php echo $email; ?>
						</td>
					</tr>
					<tr>
						<th class="texttop">
							<?php echo $text_telephone; ?>
						</th>
						<td class="textleft">
							<?php echo $telephone; ?>
						</td>
					<tr>
					<?php if ($return_status) { ?>
						</tr>
							<th class="texttop">
								<?php echo $text_return_status; ?>
							</th>
							<td class="textleft" id="return-status">
								<?php echo $return_status; ?>
							</td>
						</tr>
					<?php } ?>
					<?php if ($comment) { ?>
						<tr>
							<th class="texttop">
								<?php echo $text_comment; ?>
							</th>
							<td class="textleft">
								<?php echo $comment; ?>
							</td>
						</tr>
					<?php } ?>
					<tr>
						<th class="texttop">
							<?php echo $text_date_added; ?>
						</th>
						<td class="textleft">
							<?php echo $date_added; ?>
						</td>
					<tr>
					<tr>
						<th class="texttop">
							<?php echo $text_date_modified; ?>
						</th>
						<td class="textleft">
							<?php echo $date_modified; ?>
						</td>
					<tr>
			</tbody>
		</table>

</div>


<div id="tab-product" class="htabs-content">

		<table id="product" class="">
			<thead>
				<tr>
					<th scope="col" class="textleft"><?php echo $column_product; ?></th>
					<th scope="col" class="textleft"><?php echo $column_model; ?></th>
					<th scope="col" class="center"><?php echo $column_quantity; ?></th>
					<th scope="col" class="textleft"><?php echo $column_reason; ?></th>
					<th scope="col" class="center"><?php echo $column_opened; ?></th>
					<th scope="col" class="textleft"><?php echo $column_comment; ?></th>
					<th scope="col" class="center"><?php echo $column_action; ?></th>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($return_products as $return_product) { ?>
					<tr>
						<td scope="row" class="textleft">
							<?php echo $return_product['name']; ?>
						</td>
						<td scope="row" class="textleft">
							<?php echo $return_product['model']; ?>
						</td>
						<td scope="row" class="">
							<?php echo $return_product['quantity']; ?>
						</td>
						<td scope="row" class="textleft">
							<?php echo $return_product['reason']; ?>
						</td>
						<td scope="row" class="">
							<?php echo $return_product['opened'] ? $text_yes : $text_no; ?>
						</td>
						<td scope="row" class="textleft">
							<?php echo $return_product['comment']; ?>
						</td>
						<td scope="row" class="">
							<select name="return_product[<?php echo $return_product['return_product_id']; ?>][return_action_id]">
								<option value="0"></option>
								<?php foreach ($return_actions as $return_action) { ?>
									<?php if ($return_action['return_action_id'] == $return_product['return_action_id']) { ?>
										<option value="<?php echo $return_action['return_action_id']; ?>" selected="selected"><?php echo $return_action['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $return_action['return_action_id']; ?>"><?php echo $return_action['name']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</td>
					</tr>
				<?php } ?>
			</tbody>
		</table>

</div>


<div id="tab-history" class="htabs-content">

		<div id="history"></div>

		<table class="">
			<tbody>
			<tr>
				<th class="texttop">
					<?php echo $entry_return_status; ?>
				</th>
				<td class="textleft">
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
					<?php echo $entry_notify; ?>
				</th>
				<td class="textleft">
					<input type="checkbox" name="notify" value="1" />
				</td>
			</tr>
			<tr>
				<th class="texttop">
					<?php echo $entry_comment; ?>
				</th>
				<td class="textleft">
					<textarea name="comment" cols="40" rows="8" style="width: 99%"></textarea>
					<br />
					<br />
					<a onclick="history();" id="button-history" class="button button_green right"><?php echo $button_add_history; ?></a>
				</td>
			</tr>
		</tbody>
	</table>

</div>


<script type="text/javascript"><!--
$('#product select').bind('change', function() {
	var element = this;

	$.ajax({
		url: 'index.php?route=sale/return/product&token=<?php echo $token; ?>&return_id=<?php echo $return_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $('#product select'),
		beforeSend: function() {
			$(element).after('<span class="wait">&nbsp;<img src="view/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},
		success: function(json) {
			$('.success, .warning').remove();
			if (json['error']) {
				$('#product').before('<div class="warning">' + json['error'] + '</div>');
			}
			if (json['success']) {
				$('#product').before('<div class="success">' + json['success'] + '</div>');
			}
		}
	});});

$('#history .pagination a').live('click', function() {
	$('#history').load(this.href);
	return false;
});
$('#history').load('index.php?route=sale/return/history&token=<?php echo $token; ?>&return_id=<?php echo $return_id; ?>');

function history() {
	$.ajax({
		url: 'index.php?route=sale/return/history&token=<?php echo $token; ?>&return_id=<?php echo $return_id; ?>',
		type: 'post',
		dataType: 'html',
		data: 'return_status_id=' + encodeURIComponent($('select[name=\'return_status_id\']').val()) + '&notify=' + encodeURIComponent($('input[name=\'notify\']').attr('checked') ? 1 : 0) + '&append=' + encodeURIComponent($('input[name=\'append\']').attr('checked') ? 1 : 0) + '&comment=' + encodeURIComponent($('textarea[name=\'comment\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-history').attr('disabled', true);
			$('#history').prepend('<div class="attention"><img src="view/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-history').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(html) {
			$('#history').html(html);
			$('textarea[name=\'comment\']').val('');
			$('#return-status').html($('select[name=\'return_status_id\'] option:selected').text());
		}
	});
}
//--></script>


			<div class="button_container container_grey">
				<a onclick="location = '<?php echo $cancel; ?>';" class="button button_red left"><?php echo $button_cancel; ?></a>
			</div>

		</form>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>