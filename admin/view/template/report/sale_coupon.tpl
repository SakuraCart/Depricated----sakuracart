<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/coupon.png" alt="lock" /> <?php echo $heading_title; ?>
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
			<div class="right">
				<a onclick="filter();" class="button button_blue"><?php echo $button_filter; ?></a>
			</div>
		</aside>

		<?php if ($coupons) { ?>
			<table id="datatable" class="datatable">
				<thead>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_name; ?></th>
						<th scope="col" class="textleft"><?php echo $column_code; ?></th>
						<th scope="col" class="textleft"><?php echo $column_orders; ?></th>
						<th scope="col" class="textleft"><?php echo $column_total; ?></th>
						<th scope="col" class="textright"><?php echo $column_action; ?></th>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($coupons as $coupon) { ?>
						<tr>
							<td scope="row" class="textleft">
								<?php echo $coupon['date_start']; ?>
							</td>
							<td scope="row" class="textleft">
								<?php echo $coupon['date_end']; ?>
							</td>
							<td scope="row" class="textleft">
								<?php echo $coupon['title']; ?>
							</td>
							<td scope="row" class="textleft">
								<?php echo $coupon['coupons']; ?>
							</td>
							<td scope="row" class="textright">
								<?php foreach ($coupon['action'] as $action) { ?>
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

		<br />

<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=report/sale_order&token=<?php echo $token; ?>';
	var filter_date_start = $('input[name=\'filter_date_start\']').attr('value');
	if (filter_date_start) {
		url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
	}
	var filter_date_end = $('input[name=\'filter_date_end\']').attr('value');
	if (filter_date_end) {
		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
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