<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div id="content">
<?php if ($returns) { ?>

	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="return-list">
<table id="datatable" border="0" cellpadding="0" cellspacing="0" class="datatable">
	<caption>
		<?php echo $text_return_information; ?>
	</caption>
	<thead>
		<tr>
			<th scope="col"><?php echo $column_return_id; ?></th>
			<th scope="col"><?php echo $column_status; ?></th>
			<th scope="col"><?php echo $column_date_added; ?></th>
			<th scope="col"><?php echo $column_order_id; ?></th>
			<th scope="col"><?php echo $column_customer; ?></th>
			<th scope="col"><?php echo $column_number_items; ?></th>
			<th scope="col"><?php echo $column_view; ?></th>
		</tr>
	</thead>
	<tbody>
<?php foreach ($returns as $return) { ?>
	<tr>
		<th scope="row">
			<?php echo $return['return_id']; ?>
		</th>
		<td class="status">
			<?php echo $return['status']; ?>
		</td>
		<td class="date_added">
			<?php echo $return['date_added']; ?>
		</td>
		<td class="order_id">
			<?php echo $return['order_id']; ?>
		</td>
		<td class="name">
			<?php echo $return['name']; ?>
		</td>
		<td class="products">
			<?php echo $return['products']; ?>
		</td>
		<td class="cart">
			<a href="<?php echo $return['href']; ?>" class="button button_green"><?php echo $button_view; ?></a>
		</td>
	</tr>
<?php } ?>
	</tbody>
</table>
	</form>

	<div class="button_container container_grey">
		<a href="<?php echo $continue; ?>" class="button button_blue right"><?php echo $button_continue; ?></a>
	</div>

<?php } else { ?>
		<?php echo $text_empty; ?>
		<div class="button_container container_grey">
			<a href="<?php echo $continue; ?>" class="button button_blue right"><?php echo $button_continue; ?></a>
		</div>
<?php } ?>

		</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>