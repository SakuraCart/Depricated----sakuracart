<?php echo $header; ?>

	<?php if ($attention) { ?>
		<div class="attention"><?php echo $attention; ?></div>
	<?php } ?>
	<?php if ($success) { ?>
		<div class="success"><?php echo $success; ?></div>
	<?php } ?>
	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

<a name="#top"></a>

	<div id="content">

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="basket" name="basket" class="uniForm">
<table id="datatable" border="0" cellpadding="0" cellspacing="0" class="datatable">
	<caption>
		<?php echo $text_product_information; ?>
	</caption>
	<thead>
		<tr>
			<th scope="col"><?php echo $column_remove; ?></th>
			<th scope="col"><?php echo $column_image; ?></th>
			<th scope="col"><?php echo $column_name; ?></th>
			<th scope="col"><?php echo $column_model; ?></th>
			<?php if ($weight) { ?>
				<th scope="col"><?php echo $column_weight; ?></th>
			<?php } ?>
			<th scope="col"><?php echo $column_quantity; ?></th>
			<th scope="col"><?php echo $column_price; ?></th>
			<th scope="col"><?php echo $column_total; ?></th>
		</tr>
	</thead>
	<tbody>
<?php foreach ($products as $product) { ?>
	<tr>
		<td class="remove">
			<input type="checkbox" name="remove[]" value="<?php echo $product['key']; ?>" />
		</td>
		<td class="image">
			<?php if ($product['thumb']) { ?>
				<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
			<?php } ?>
		</td>
		<td class="name">
			<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
			<?php if (!$product['stock']) { ?>
				<span class="stock">***</span>
			<?php } ?>
			<div>
				<?php foreach ($product['option'] as $option) { ?>
					- <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
					<br />
				<?php } ?>
			</div>
			<?php if ($product['points']) { ?>
				<small><?php echo $product['points']; ?></small>
			<?php } ?>
		</td>
		<td class="model">
			<?php echo $product['model']; ?>
		</td>
		<?php if ($weight) { ?>
			<td class="weight">
				<?php echo $weight; ?>
			</td>
		<?php } ?>
		<td class="quantity">
			<input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="3" />
		</td>
		<td class="price">
			<?php echo $product['price']; ?>
		</td>
		<td class="total">
			<?php echo $product['total']; ?>
		</td>
	</tr>
<?php } ?>
	</tbody>
</table>
</form>

	<div class="cart-module">
		<?php foreach ($modules as $module) { ?>
			<?php echo $module; ?>
		<?php } ?>
	</div>

	<table class="half_right">
		<?php foreach ($totals as $total) { ?>
			<tr>
				<th><?php echo $total['title']; ?>:</th>
				<td><?php echo $total['text']; ?></td>
			</tr>
		<?php } ?>
	</table>

	<div class="button_container container_grey">
		<a href="#top" class="button button_blue left" rel="nofollow"><?php echo $button_top; ?></a>
		<a href="<?php echo $continue; ?>" class="button button_blue left"><?php echo $button_shopping; ?></a>
		<a href="<?php echo $checkout; ?>" class="button button_green right"><?php echo $button_checkout; ?></a>
		<a onclick="$('#basket').submit();" class="button button_green right"><?php echo $button_update; ?></a>
	</div>

	</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>
