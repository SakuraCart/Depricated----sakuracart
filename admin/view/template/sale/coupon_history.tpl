<?php if ($histories) { ?>
	<table id="datatable" class="datatable">
		<thead>
			<tr>
				<th scope="col" class="center"><?php echo $column_order_id; ?></th>
				<th scope="col" class="textleft"><?php echo $column_customer; ?></th>
				<th scope="col" class="textleft"><?php echo $column_amount; ?></th>
				<th scope="col" class="textleft"><?php echo $column_date_added; ?></th>
			</tr>
		</thead>
		<tbody>
		<?php foreach ($histories as $history) { ?>
			<tr>
				<td scope="row" class="">
					<?php echo $history['order_id']; ?>
				</td>
				<td scope="row" class="">
					<?php echo $history['customer']; ?>
				</td>
				<td scope="row" class="">
					<?php echo $history['amount']; ?>
				</td>
				<td scope="row" class="">
					<?php echo $history['date_added']; ?>
				</td>
			</tr>
		<?php } ?>
		</tbody>
	</table>
<?php } else { ?>
	<?php echo $text_no_results; ?>
<?php } ?>