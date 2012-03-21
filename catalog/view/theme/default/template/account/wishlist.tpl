<?php echo $header; ?>
		<div id="container">

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div id="content">

<?php if ($products) { ?>

	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="wishlist">
<table id="datatable" border="0" cellpadding="0" cellspacing="0" class="datatable">
	<caption>
		<?php echo $text_product_information; ?>
	</caption>
	<thead>
		<tr>
			<th scope="col"><?php echo $column_name; ?></th>
			<th scope="col"><?php echo $column_image; ?></th>
			<th scope="col"><?php echo $column_link; ?></th>
			<th scope="col"><?php echo $column_model; ?></th>
			<th scope="col"><?php echo $column_stock; ?></th>
			<th scope="col"><?php echo $column_price; ?></th>
			<th scope="col"><?php echo $column_view; ?></th>
			<th scope="col"><?php echo $column_cart; ?></th>
			<th scope="col"><?php echo $column_remove; ?></th>
		</tr>
	</thead>
	<tbody>
<?php foreach ($products as $product) { ?>
	<tr>
		<th scope="row">
			<?php echo $product['name']; ?>
		</th>
		<td class="image">
			<?php if ($product['thumb']) { ?>
				<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
			<?php } ?>
		</td>
		<td class="name">
			<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
		</td>
		<td class="model">
			<?php echo $product['model']; ?>
		</td>
		<td class="stock">
			<?php echo $product['stock']; ?>
		</td>
		<td class="price">
			<?php if ($product['price']) { ?>
				<div class="price">
					<?php if (!$product['special']) { ?>
						<?php echo $product['price']; ?>
					<?php } else { ?>
						<s><?php echo $product['price']; ?></s> <b><?php echo $product['special']; ?></b>
					<?php } ?>
				</div>
			<?php } ?>
		</td>
		<td class="view">
			<a href="<?php echo $product['href']; ?>" class="button button_green"><?php echo $button_view; ?></a>
		</td>
		<td class="cart">
			<a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button button_green"><?php echo $button_cart; ?></a>
		</td>
		<td class="remove">
			<input type="checkbox" name="remove[]" value="<?php echo $product['product_id']; ?>" />
		</td>
	</tr>
<?php } ?>
	</tbody>
</table>
	</form>

	<div class="button_container container_grey">
		<a href="<?php echo $continue; ?>" class="button button_blue left"><?php echo $button_continue; ?></a>
		<a onclick="$('#wishlist').submit();" class="button button_green right"><?php echo $button_update; ?></a>
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