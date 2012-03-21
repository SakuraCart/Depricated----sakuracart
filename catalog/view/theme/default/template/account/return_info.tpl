<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div id="content">

<h3><?php echo $text_order_information; ?></h3>
	<table class="">
		<thead>
			<tr>
				<th scope="col"><?php echo $column_return_id; ?></th>
				<th scope="col"><?php echo $column_order_id; ?></th>
				<th scope="col"><?php echo $column_date_ordered; ?></th>
				<th scope="col"><?php echo $column_date_added; ?></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="return_id"><?php echo $return_id; ?></td>
				<td class="order_id"><?php echo $order_id; ?></td>
				<td class="date_ordered"><?php echo $date_ordered; ?></td>
				<td class="date_added"><?php echo $date_added; ?></td>
			</tr>
		</tbody>
	</table>

<h3><?php echo $text_return_information; ?></h3>
	<table class="">
		<thead>
			<tr>
				<th scope="col"><?php echo $column_name; ?></th>
				<th scope="col"><?php echo $column_model; ?></th>
				<th scope="col"><?php echo $column_quantity; ?></th>
				<th scope="col"><?php echo $column_opened; ?></th>
				<th scope="col"><?php echo $column_reason; ?></th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($products as $product) { ?>
			<tr>
				<td class="name"><?php echo $product['name']; ?></td>
				<td class="model"><?php echo $product['model']; ?></td>
				<td class="quantity"><?php echo $product['quantity']; ?></td>
				<td class="opened"><?php echo $product['opened']; ?></td>
				<td class="reason"><?php echo $product['reason']; ?></td>
			</tr>
			<?php } ?>
		</tbody>
	</table>

	<h3><?php echo $text_return_details; ?></h3>
		<p>
			<?php echo $product['comment']; ?>
		</p>

	<?php if ($comment) { ?>
		<h3><?php echo $text_comment; ?></h3>
			<p>
				<?php echo $comment; ?>
			</p>
	<?php } ?>

<h3><?php echo $text_return_information; ?></h3>

	<div class="box container_grey">
		<h3><?php echo $text_product_return_status; ?></h3>
			<p>
				<?php echo $product['action']; ?>
			</p>

	<?php if ($histories) { ?>
	<h3><?php echo $text_history; ?></h3>
	<table class="">
		<thead>
			<tr>
				<th scope="col"><?php echo $column_date_added; ?></th>
				<th scope="col"><?php echo $column_status; ?></th>
				<th scope="col"><?php echo $column_comment; ?></th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($histories as $history) { ?>
			<tr>
				<td class="date_added"><?php echo $history['date_added']; ?></td>
				<td class="status"><?php echo $history['status']; ?></td>
				<td class="comment"><?php echo $history['comment']; ?></td>
			</tr>
			<?php } ?>
		</tbody>
	</table>
	<?php } ?>
	</div>


	<div class="button_container container_grey">
		<a href="<?php echo $continue; ?>" class="button button_blue right"><?php echo $button_back; ?></a>
	</div>


	</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>