<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($success) { ?>
	<div class="success"><?php echo $success; ?></div>
<?php } ?>

<?php if ($transactions) { ?>
	<table id="datatable" class="datatable">
		<thead>
			<tr>
				<th scope="col" class="textleft"><?php echo $column_date_added; ?></th>
				<th scope="col" class="textleft"><?php echo $column_description; ?></th>
				<th scope="col" class="textleft"><?php echo $column_amount; ?></th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($transactions as $transaction) { ?>
				<tr>
					<td scope="row" class="textleft">
						<?php echo $transaction['date_added']; ?>
					</td>
					<td scope="row" class="">
						<?php echo $transaction['description']; ?>
					</td>
					<td scope="row" class="textleft">
						<?php echo $transaction['amount']; ?>
					</td>
				</tr>
			<?php } ?>
		</tbody>
	</table>

	<table id="" class="">
		<tbody>
			<tr>
				<th scope="row" class="">
					<?php echo $text_balance; ?>
				</th>
				<td scope="row" class="textleft">
					<?php echo $balance; ?>
				</td>
			</tr>
		</tbody>
	</table>

<?php } else { ?>
		<?php echo $text_no_results; ?>
<?php } ?>