<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div id="content">
<?php if ($orders) { ?>

<table id="datatable" class="datatable">
	<caption>
		<?php echo $text_order_information; ?>
	</caption>
	<thead>
		<tr>
			<th scope="col"><?php echo $column_id; ?></th>
			<th scope="col"><?php echo $column_status; ?></th>
			<th scope="col"><?php echo $column_date_added; ?></th>
			<th scope="col"><?php echo $column_number_items; ?></th>
			<th scope="col"><?php echo $column_customer; ?></th>
			<th scope="col"><?php echo $column_total; ?></th>
			<th scope="col"><?php echo $column_view; ?></th>
		</tr>
	</thead>
	<tbody>
<?php foreach ($orders as $order) { ?>
	<tr>
		<th scope="row">
			<?php echo $order['order_id']; ?>
		</th>
		<td class="">
			<?php echo $order['status']; ?>
		</td>
		<td class="">
			<?php echo $order['date_added']; ?>
		</td>
		<td class="">
			<?php echo $order['products']; ?>
		</td>
		<td class="">
			<?php echo $order['name']; ?>
		</td>
		<td class="">
			<?php echo $order['total']; ?>
		</td>
		<td class="view">
			<a href="<?php echo $order['href']; ?>" class="button button_green"><?php echo $button_view; ?></a>
		</td>
	</tr>
<?php } ?>
	</tbody>
</table>


<?php } else { ?>
		<?php echo $text_empty; ?>
<?php } ?>

	<div class="button_container container_grey">
		<a href="<?php echo $continue; ?>" class="button button_blue right"><?php echo $button_continue; ?></a>
	</div>

	</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>