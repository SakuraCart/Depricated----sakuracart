<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>

<?php if ($histories) { ?>
	<table id="datatable" class="datatable">
		<thead>
			<tr>
				<th scope="col" class="center"><?php echo $column_date_added; ?></th>
				<th scope="col" class="textleft"><?php echo $column_comment; ?></th>
				<th scope="col" class="center"><?php echo $column_status; ?></th>
				<th scope="col" class="center"><?php echo $column_notify; ?></th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($histories as $history) { ?>
				<tr>
					<td scope="row" class="">
						<?php echo $history['date_added']; ?>
					</td>
					<td scope="row" class="textleft">
						<?php echo $history['comment']; ?>
					</td>
					<td scope="row" class="">
						<?php echo $history['status']; ?>
					</td>
					<td scope="row" class="">
						<?php echo $history['notify']; ?>
					</td>
				</tr>
			<?php } ?>
		</tbody>
	</table>
<?php } else { ?>
		<?php echo $text_no_results; ?>
<?php } ?>