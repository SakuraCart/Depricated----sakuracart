<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($success) { ?>
	<div class="success"><?php echo $success; ?></div>
<?php } ?>

<?php if ($rewards) { ?>
	<table id="datatable" class="datatable">
		<thead>
			<tr>
				<th scope="col" class="textleft"><?php echo $column_date_added; ?></th>
				<th scope="col" class="textleft"><?php echo $column_description; ?></th>
				<th scope="col" class="textleft"><?php echo $column_points; ?></th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($rewards as $reward) { ?>
				<tr>
					<td scope="row" class="textleft">
						<?php echo $reward['date_added']; ?>
					</td>
					<td scope="row" class="">
						<?php echo $reward['description']; ?>
					</td>
					<td scope="row" class="textleft">
						<?php echo $reward['points']; ?>
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