<?php echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $language; ?>" xml:lang="<?php echo $language; ?>">
<head>
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/1140.css" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/admin.css" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/table.css" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/invoice.css" />
</head>
<body>


<?php foreach ($orders as $order) { ?>
	<div style="page-break-after: always;">

		<div class="container row">
			<div class="col12 last">
				<h1><?php echo $text_invoice; ?></h1>
			</div>
		</div>

		<div class="container row">
			<div class="col8">
				<?php echo $order['store_name']; ?>
				<br />
				<?php echo $order['store_address']; ?>
				<br />
				<?php echo $text_telephone; ?>:<?php echo $order['store_telephone']; ?>
				<br />
				<?php if ($order['store_fax']) { ?>
					<?php echo $text_fax; ?> <?php echo $order['store_fax']; ?>
				<br />
				<?php } ?>
				<?php echo $order['store_email']; ?>
				<br />
				<?php echo $order['store_url']; ?>
			</div>
			<div class="col4 last">
				<dl>
					<dt>
						<?php echo $text_date_added; ?>
					</dt>
					<dd>
						<?php echo $order['date_added']; ?>
					</dd>
					<?php if ($order['invoice_no']) { ?>
						<dt>
							<?php echo $text_invoice_no; ?>
						</dt>
						<dd>
							<?php echo $order['invoice_no']; ?>
						</dd>
					<?php } ?>
					<dt>
						<?php echo $text_order_id; ?>
					</dt>
					<dd>
						<?php echo $order['order_id']; ?>
					</dd>
					<dt>
						<?php echo $text_payment_method; ?>
					</dt>
					<dd>
						<?php echo $order['payment_method']; ?>
					</dd>
					<dt>
						<?php echo $text_shipping_method; ?>
					</dt>
					<dd>
						<?php echo $order['shipping_method']; ?>
					</dd>
				</dl>
			</div>
		</div>

		<br />

		<div class="container row">
			<div class="col6">
				<h2><?php echo $text_to; ?></h2>
				<?php echo $order['payment_address']; ?>
				<br/>
				<?php echo $order['email']; ?>
				<br/>
				<?php echo $order['telephone']; ?>
			</div>
			<div class="col6 last">
				<h2><?php echo $text_ship_to; ?></h2>
				<?php echo $order['shipping_address']; ?>
			</div>
		</div>

		<br />

		<div class="container row">
			<div class="col12 last">
				<table id="datatable" class="datatable">
					<thead>
						<tr>
							<th scope="col" class="textleft"><?php echo $column_product; ?></th>
							<th scope="col" class="center"><?php echo $column_model; ?></th>
							<th scope="col" class="center"><?php echo $column_quantity; ?></th>
							<th scope="col" class="center"><?php echo $column_price; ?></th>
							<th scope="col" class="textright"><?php echo $column_total; ?></th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($order['product'] as $product) { ?>
							<tr>
								<td scope="row" class="textleft">
									<?php echo $product['name']; ?>
									<?php foreach ($product['option'] as $option) { ?>
										<br />
										&nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
									<?php } ?>
								</td>
								<td scope="row" class="">
									<?php echo $product['model']; ?>
								</td>
								<td scope="row" class="">
									<?php echo $product['quantity']; ?>
								</td>
								<td scope="row" class="">
									<?php echo $product['price']; ?>
								</td>
								<td scope="row" class="textright">
									<?php echo $product['total']; ?>
								</td>
							</tr>
						<?php } ?>
						<?php foreach ($order['total'] as $total) { ?>
							<tr>
								<th scope="row" class="textright" colspan="4"><b><?php echo $total['title']; ?>:</b></th>
								<td scope="row" class="textright"><?php echo $total['text']; ?></td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
			</div>
		</div>

		<?php if ($order['comment']) { ?>
			<div class="container row">
				<div class="col12 last">
					<h2><?php echo $column_comment; ?></h2>
					<?php echo $order['comment']; ?>
				</div>
			</div>
		<?php } ?>

	</div>
<?php } ?>

</body>
</html>