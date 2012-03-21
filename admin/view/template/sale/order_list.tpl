<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/order.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>
		<?php if ($success) { ?>
			<div class="success"><?php echo $success; ?></div>
		<?php } ?>

		<form action="" method="post" enctype="multipart/form-data" id="form">

<!--
			<table class="">
				<tbody>
					<th scope="row" class="">
						<?php echo $entry_filter; ?>
					</th>
					<td>
						<select name="filter_order_status_id">
							<option value="*"></option>
							<?php if ($filter_order_status_id == '0') { ?>
								<option value="0" selected="selected"><?php echo $text_abandoned_orders; ?></option>
							<?php } else { ?>
								<option value="0"><?php echo $text_abandoned_orders; ?></option>
							<?php } ?>
							<?php foreach ($order_statuses as $order_status) { ?>
								<?php if ($order_status['order_status_id'] == $filter_order_status_id) { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
								<?php } ?>
							<?php } ?>
						</select>
					</td>
					<td align="">
						<a onclick="filter();" class="button button_green"><?php echo $button_filter; ?></a>
					</td>
				</tbody>
			</table>
-->

			<?php if ($orders) { ?>
				<table id="datatable" class="datatable">
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></th>
							<th scope="col" class="textleft"><?php echo $column_order_id; ?></th>
							<th scope="col" class="center"><?php echo $column_customer; ?></th>
							<th scope="col" class="center"><?php echo $column_total; ?></th>
							<th scope="col" class="center"><?php echo $column_date_added; ?></th>
							<th scope="col" class="center"><?php echo $column_date_modified; ?></th>
							<th scope="col" class="center"><?php echo $column_status; ?></th>
							<th scope="col" class="center"><?php echo $column_action; ?></th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($orders as $order) { ?>
							<tr>
								<td scope="row">
									<?php if ($order['selected']) { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
									<?php } else { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
									<?php } ?>
								</td>
								<td scope="row" class="textleft">
									<?php echo $order['order_id']; ?>
								</td>
								<td scope="row" class="">
									<?php echo $order['customer']; ?>
								</td>
								<td scope="row" class="">
									<?php echo $order['total']; ?>
								</td>
								<td scope="row" class="">
									<?php echo $order['date_added']; ?>
								</td>
								<td scope="row" class="">
									<?php echo $order['date_modified']; ?>
								</td>
								<td scope="row" class="">
									<?php echo $order['status']; ?>
								</td>
								<td scope="row" class="">
									<?php foreach ($order['action'] as $action) { ?>
										[ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
									<?php } ?>
								</td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
			<?php } else { ?>
					<?php echo $text_no_results; ?>
			<?php } ?>

<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=sale/order&token=<?php echo $token; ?>';
	var filter_order_status_id = $('select[name=\'filter_order_status_id\']').attr('value');
	location = url;
}
//--></script>
<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) {
		filter();
	}
});
//--></script>


			<div class="button_container container_grey">
				<a onclick="$('#form').attr('action', '<?php echo $delete; ?>'); $('#form').attr('target', '_self'); $('#form').submit();" class="button button_red left"><?php echo $button_delete; ?></a>
				<a onclick="location = '<?php echo $insert; ?>'" class="button button_green right"><?php echo $button_insert; ?></a>
				<a onclick="$('#form').attr('action', '<?php echo $invoice; ?>'); $('#form').attr('target', '_blank'); $('#form').submit();" class="button button_blue right"><?php echo $button_invoice; ?></a>
			</div>

		</form>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>