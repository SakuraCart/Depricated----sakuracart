<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/tax.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<aside class="button_container border_green">
			<div class="left">
				<?php echo $entry_date_start; ?>
				<input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" id="date-start" size="12" />
			</div>
			<div class="left">
				<?php echo $entry_date_end; ?>
				<input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" id="date-end" size="12" />
			</div>
			<div class="left">
				<?php echo $entry_group; ?>
				<select name="filter_group">
					<?php foreach ($groups as $groups) { ?>
						<?php if ($groups['value'] == $filter_group) { ?>
							<option value="<?php echo $groups['value']; ?>" selected="selected"><?php echo $groups['text']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $groups['value']; ?>"><?php echo $groups['text']; ?></option>
						<?php } ?>
					<?php } ?>
				</select>
			</div>
			<div class="left">
				<?php echo $entry_status; ?>
				<select name="filter_order_status_id">
					<option value="0"><?php echo $text_all_status; ?></option>
					<?php foreach ($order_statuses as $order_status) { ?>
						<?php if ($order_status['order_status_id'] == $filter_order_status_id) { ?>
							<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
						<?php } ?>
					<?php } ?>
				</select>
			</div>
			<div class="right">
				<a onclick="filter();" class="button button_blue"><?php echo $button_filter; ?></a>
			</div>
		</aside>

		<?php if ($orders) { ?>
			<table id="datatable" class="datatable">
				<thead>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_date_start; ?></th>
						<th scope="col" class="textleft"><?php echo $column_date_end; ?></th>
						<th scope="col" class="textleft"><?php echo $column_title; ?></th>
						<th scope="col" class="textleft"><?php echo $column_orders; ?></th>
						<th scope="col" class="textright"><?php echo $column_total; ?></th>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($orders as $order) { ?>
						<tr>
							<td scope="row" class="textleft">
								<?php echo $order['date_start']; ?>
							</td>
							<td scope="row" class="textleft">
								<?php echo $order['date_end']; ?>
							</td>
							<td scope="row" class="textleft">
								<?php echo $order['title']; ?>
							</td>
							<td scope="row" class="textleft">
								<?php echo $order['orders']; ?>
							</td>
							<td scope="row" class="textright">
								<?php echo $order['total']; ?>
							</td>
						</tr>
					<?php } ?>
				</tbody>
			</table>
		<?php } else { ?>
				<?php echo $text_no_results; ?>
		<?php } ?>

		<br />

<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=report/sale_tax&token=<?php echo $token; ?>';
	var filter_date_start = $('input[name=\'filter_date_start\']').attr('value');
	if (filter_date_start) {
		url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
	}
	var filter_date_end = $('input[name=\'filter_date_end\']').attr('value');
	if (filter_date_end) {
		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
	}
	var filter_group = $('select[name=\'filter_group\']').attr('value');
	if (filter_group) {
		url += '&filter_group=' + encodeURIComponent(filter_group);
	}
	var filter_order_status_id = $('select[name=\'filter_order_status_id\']').attr('value');
	if (filter_order_status_id) {
		url += '&filter_order_status_id=' + encodeURIComponent(filter_order_status_id);
	}
	location = url;
}
//--></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#date-start').datepicker({dateFormat: 'yy-mm-dd'});
	$('#date-end').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>