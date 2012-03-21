<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

<div id="content">

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

	<?php if ($transactions) { ?>
		<table id="datatable" class="datatable">
			<thead>
				<tr>
					<th scope="col" class="center"><?php echo $column_date_added; ?></th>
					<th scope="col" class="center"><?php echo $column_description; ?></th>
					<th scope="col" class="textleft"><?php echo $column_amount; ?></th>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($transactions as $transaction) { ?>
					<tr>
						<td scope="row" class="center">
							<?php echo $transaction['date_added']; ?>
						</td>
						<td scope="row" class="center">
							<?php echo $transaction['description']; ?>
						</td>
						<td scope="row" class="textleft">
							<?php echo $transaction['amount']; ?>
						</td>
					</tr>
				<?php } ?>
			</tbody>
		</table>
	<?php } else { ?>
			<?php echo $text_no_results; ?>
	<?php } ?>


	<div class="button_container container_grey">
		<a href="<?php echo $continue; ?>" class="button button_green right"><?php echo $button_back; ?></a>
	</div>

</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>