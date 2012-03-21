<?php echo $header; ?>

<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div id="content">

	<h3><?php echo $text_order_information; ?></h3>
		<div class="content_left">
			<ul>
				<?php if ($invoice_no) { ?>
					<li><?php echo $text_invoice_no; ?> <?php echo $invoice_no; ?></li>
				<?php } ?>
				<li><?php echo $text_order_id; ?> #<?php echo $order_id; ?></li>
				<li><?php echo $text_date_added; ?> <?php echo $date_added; ?></li>
			</ul>
		</div>
		<div class="content_right">
			<ul>
				<li><?php echo $text_payment_method; ?> <?php echo $payment_method; ?></li>
				<?php if ($shipping_method) { ?>
					<li><?php echo $text_shipping_method; ?> <?php echo $shipping_method; ?></li>
				<?php } ?>
			</ul>
		</div>

	<div class="clearfix"></div>

	<h3><?php echo $text_address; ?></h3>
		<div class="content_left">
			<dl>
				<?php if ($shipping_address) { ?>
					<dt><?php echo $text_shipping_address; ?></dt>
					<dd><?php echo $shipping_address; ?></dd>
				<?php } ?>
			</dl>
		</div>
		<div class="content_right">
			<dl>
				<?php if ($payment_address) { ?>
					<dt><?php echo $text_payment_address; ?></dt>
					<dd><?php echo $payment_address; ?></dd>
				<?php } ?>
			</dl>
		</div>

	<div class="clearfix"></div>

	<h3><?php echo $text_items; ?></h3>

	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="order">
<table class="">
	<thead>
		<tr>
			<td scope="col"class="checkbox"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
			<th scope="col"><?php echo $column_name; ?></th>
			<th scope="col"><?php echo $column_model; ?></th>
			<th scope="col"><?php echo $column_quantity; ?></th>
			<th scope="col"><?php echo $column_price; ?></th>
			<th scope="col"><?php echo $column_total; ?></th>
		</tr>
	</thead>
	<tbody>
		<?php foreach ($products as $product) { ?>
			<tr>
				<td class="checkbox">
					<?php if ($product['selected']) { ?>
						<input type="checkbox" name="selected[]" value="<?php echo $product['order_product_id']; ?>" checked="checked" />
					<?php } else { ?>
						<input type="checkbox" name="selected[]" value="<?php echo $product['order_product_id']; ?>" />
					<?php } ?>
				</td>
				<td class="name">
					<?php echo $product['name']; ?>
					<?php foreach ($product['option'] as $option) { ?>
						<br />
						&nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
					<?php } ?>
				</td>
				<td class="model">
					<?php echo $product['model']; ?>
				</td>
				<td class="quantity">
					<?php echo $product['quantity']; ?>
				</td>
				<td class="price">
					<?php echo $product['price']; ?>
				</td>
				<td class="total">
					<?php echo $product['total']; ?>
				</td>
			</tr>
		<?php } ?>
		<?php foreach ($totals as $total) { ?>
			<tr>
				<td colspan="5" class="textright">
					<b><?php echo $total['title']; ?>:</b>
				</td>
				<td class="total">
					<?php echo $total['text']; ?>
				</td>
			</tr>
		<?php } ?>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="6" class="textright">
				<?php echo $text_action; ?>
				<select name="action">
					<option value=""><?php echo $text_selected; ?></option>
					<option value="reorder"><?php echo $text_reorder; ?></option>
					<option value="return"><?php echo $text_return; ?></option>
				</select>
			</th>
		</tr>
	</tfoot>
</table>
	</form>

	<?php if ($comment) { ?>
		<h3><?php echo $text_comment; ?></h3>
			<p>
				<?php echo $comment; ?>
			</p>
	<?php } ?>

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

	<div class="button_container container_grey">
		<a href="<?php echo $continue; ?>" class="button button_blue left"><?php echo $button_back; ?></a>
		<a onclick="$('#order').submit();" class="button button_green right"><?php echo $button_continue; ?></a>
	</div>

	</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>