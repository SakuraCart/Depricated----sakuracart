<?php echo $header; ?>

<section class="box_content">
	<a name="#top"></a>

	<?php if ($compare_count > '0') { ?>
		<div class="compare_total">
			<a href="<?php echo $compare; ?>" id="compare_total" class="button button_blue"><?php echo $text_compare; ?></a>
		</div>
	<?php } ?>

	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php echo $entry_search; ?>
		<?php if ($filter_name) { ?>
			<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" />
		<?php } else { ?>
			<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;" />
		<?php } ?>
		<select name="filter_category_id">
			<option value="0"><?php echo $text_category; ?></option>
			<?php foreach ($categories as $category_1) { ?>
				<?php if ($category_1['category_id'] == $filter_category_id) { ?>
					<option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
				<?php } else { ?>
					<option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
				<?php } ?>
				<?php foreach ($category_1['children'] as $category_2) { ?>
					<?php if ($category_2['category_id'] == $filter_category_id) { ?>
						<option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
					<?php } else { ?>
						<option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
					<?php } ?>
					<?php foreach ($category_2['children'] as $category_3) { ?>
						<?php if ($category_3['category_id'] == $filter_category_id) { ?>
							<option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
						<?php } ?>
					<?php } ?>
				<?php } ?>
			<?php } ?>
		</select>

		<br />
		<?php if ($filter_sub_category) { ?>
			<input type="checkbox" name="filter_sub_category" value="1" id="sub_category" checked="checked" />
		<?php } else { ?>
			<input type="checkbox" name="filter_sub_category" value="1" id="sub_category" />
		<?php } ?>
		<?php echo $text_sub_category; ?>

		<br />
		<?php if ($filter_description) { ?>
			<input type="checkbox" name="filter_description" value="1" id="description" checked="checked" />
		<?php } else { ?>
			<input type="checkbox" name="filter_description" value="1" id="description" />
		<?php } ?>
		<?php echo $entry_description; ?>

		<div class="button_container container_grey">
			<a id="button-search" class="button button_green right"><?php echo $button_search; ?></a>
		</div>

		<br />


<?php if ($products) { ?>
	<div class="filter">
		<div class="display">
			<?php echo $text_display; ?>
			<?php echo $text_list; ?>
			/
			<a onclick="display('grid');"><?php echo $text_grid; ?></a>
		</div>
		<div class="limit"><?php echo $text_limit; ?>
			<select onchange="location = this.value;">
				<?php foreach ($limits as $limits) { ?>
					<?php if ($limits['value'] == $limit) { ?>
						<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
					<?php } else { ?>
						<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
					<?php } ?>
				<?php } ?>
			</select>
		</div>
		<div class="sort"><?php echo $text_sort; ?>
			<select onchange="location = this.value;">
				<?php foreach ($sorts as $sorts) { ?>
					<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
						<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
					<?php } else { ?>
						<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
					<?php } ?>
				<?php } ?>
			</select>
		</div>
	</div>

	<div class="list">
		<?php foreach ($products as $product) { ?>

			<div>
				<?php if ($product['thumb']) { ?>
					<div class="image">
						<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
					</div>
				<?php } ?>

				<div class="name">
					<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
				</div>

				<div class="description">
					<?php echo $product['description']; ?>
				</div>

				<?php if ($product['rating']) { ?>
					<div class="rating">
						<img src="<?php echo ICON; ?>stars/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
					</div>
				<?php } ?>

				<?php if ($product['price']) { ?>
					<div class="price">
						<?php if ($product['tax']) { ?>
							<span class="price-tax">
								<?php echo $text_tax; ?>
								<?php echo $product['tax']; ?>
								<br />
							</span>
						<?php } ?>
						<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
							<br />
						<?php } else { ?>
							<span class="price-old"><?php echo $text_regular_price; ?> <?php echo $product['price']; ?></span>
							<br />
							<span class="price-new"><?php echo $text_sale_price; ?> <?php echo $product['special']; ?></span>
						<?php } ?>
					</div>
				<?php } ?>

				<div class="cart">
					<a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button button_green"><?php echo $button_cart; ?></a>
				</div>

				<div class="wishlist">
					<a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="button button_blue"><?php echo $button_wishlist; ?></a>
				</div>

				<div class="compare">
					<a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="button button_blue"><?php echo $button_compare; ?></a>
				</div>

			</div>
		<?php } ?>
	</div>

	<div class="pagination"><?php echo $pagination; ?></div>

<?php } else { ?>
	<?php echo $text_empty; ?>
<?php }?>

<script language="javascript" type="text/javascript">
	var text_display = '<?php echo $text_display; ?>';
	var text_list = '<?php echo $text_list; ?>';
	var text_grid = '<?php echo $text_grid; ?>';
</script>


	<div class="button_container container_grey">
		<a href="<?php echo $continue; ?>" class="button button_blue right"><?php echo $button_home; ?></a>
	</div>

	</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>