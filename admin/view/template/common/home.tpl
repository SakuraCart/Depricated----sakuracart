<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/info_folder.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_install) { ?>
			<div class="warning"><?php echo $error_install; ?></div>
		<?php } ?>
		<?php if ($error_image) { ?>
			<div class="warning"><?php echo $error_image; ?></div>
		<?php } ?>
		<?php if ($error_image_cache) { ?>
			<div class="warning"><?php echo $error_image_cache; ?></div>
		<?php } ?>
		<?php if ($error_cache) { ?>
			<div class="warning"><?php echo $error_cache; ?></div>
		<?php } ?>
		<?php if ($error_download) { ?>
			<div class="warning"><?php echo $error_download; ?></div>
		<?php } ?>
		<?php if ($error_logs) { ?>
			<div class="warning"><?php echo $error_logs; ?></div>
		<?php } ?>

<div class="col6">
	<h3 class="box_content rounded_corners_all border_blue container_grey">
		<?php echo $text_overview; ?>
	</h3>

	<table>
	<tbody class="zebra">
		<tr>
			<th><?php echo $text_total_sale; ?></th>
			<td><?php echo $total_sale; ?></td>
		</tr>
		<tr>
			<th><?php echo $text_total_sale_year; ?></th>
			<td><?php echo $total_sale_year; ?></td>
		</tr>
		<tr>
			<th><?php echo $text_total_order; ?></th>
			<td><?php echo $total_order; ?></td>
		</tr>
		<tr>
			<th><?php echo $text_total_customer; ?></th>
			<td><?php echo $total_customer; ?></td>
		</tr>
		<tr>
			<th><?php echo $text_total_customer_approval; ?></th>
			<td><?php echo $total_customer_approval; ?></td>
		</tr>
		<tr>
			<th><?php echo $text_total_review_approval; ?></th>
			<td><?php echo $total_review_approval; ?></td>
		</tr>
		<tr>
			<th><?php echo $text_total_affiliate; ?></th>
			<td><?php echo $total_affiliate; ?></td>
		</tr>
		<tr>
			<th><?php echo $text_total_affiliate_approval; ?></th>
			<td><?php echo $total_affiliate_approval; ?></td>
		</tr>
	</tbody>
	</table>
</div>

<div class="col6 last">
	<h3 class="box_content rounded_corners_all border_blue container_grey">
		<?php echo $text_statistics; ?>
		<div class="range"><?php echo $entry_range; ?>
			<select id="range" onchange="getSalesChart(this.value)">
				<option value="day"><?php echo $text_day; ?></option>
				<option value="week"><?php echo $text_week; ?></option>
				<option value="month"><?php echo $text_month; ?></option>
				<option value="year"><?php echo $text_year; ?></option>
			</select>
		</div>
	</h3>

	<div id="overviewLegend"></div>
	<div id="report"></div>
</div>

<div class="col12 last">
<?php if ($orders) { ?>
	<table id="datatable" class="datatable">
		<caption>
			<?php echo $text_latest_10_orders; ?>
		</caption>
		<thead>
			<tr>
				<th scope="col"><?php echo $column_order; ?></th>
				<th scope="col"><?php echo $column_customer; ?></th>
				<th scope="col"><?php echo $column_status; ?></th>
				<th scope="col"><?php echo $column_date_added; ?></th>
				<th scope="col"><?php echo $column_total; ?></th>
				<th scope="col"><?php echo $column_action; ?></th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($orders as $order) { ?>
				<tr>
					<th scope="row">
						<?php echo $order['order_id']; ?>
					</th>
					<td class="">
						<?php echo $order['customer']; ?>
					</td>
					<td class="">
						<?php echo $order['status']; ?>
					</td>
					<td class="">
						<?php echo $order['date_added']; ?>
					</td>
					<td class="">
						<?php echo $order['total']; ?>
					</td>
					<td class="view">
						<?php foreach ($order['action'] as $action) { ?>
							<a href="<?php echo $action['href']; ?>" class="button button_green"><?php echo $action['text']; ?></a>
						<?php } ?>
					</td>
				</tr>
			<?php } ?>
		</tbody>
	</table>
<?php } else { ?>
		<?php echo $text_no_results; ?>
<?php } ?>
</div>

	</div>
</section>

	</div>
</div>


<script type="text/javascript"><!--
function getSalesChart(range) {
	$.ajax({
		type: 'GET',
		url: 'index.php?route=common/home/chart&token=<?php echo $token; ?>&range=' + range,
		dataType: 'json',
		async: false,
		success: function(json) {
			var option = {
				shadowSize: 0,
				lines: {
					show: true,
					fill: true,
					lineWidth: 1
				},
				grid: {
					backgroundColor: '#FFFFFF'
				},
				xaxis: {
					ticks: json.xaxis
				},
/*
legend: {
	show: boolean
	labelFormatter: null or (fn: string, series object -> string)
	labelBoxBorderColor: color
	noColumns: number
	position: "ne" or "nw" or "se" or "sw"
	margin: number of pixels or [x margin, y margin]
	backgroundColor: null or color
	backgroundOpacity: number between 0 and 1
	container: null or jQuery object/DOM element/jQuery expression
}
*/
				legend: {
					show: true,
					margin: 10,
					backgroundOpacity: 0.5,
					container: $("#overviewLegend"),
				}
			}
			$.plot($('#report'), [json.order, json.customer], option);
		}
	});
}

getSalesChart($('#range').val());
//--></script>

<?php echo $footer; ?>