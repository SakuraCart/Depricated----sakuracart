<?php echo $header; ?>

<article>

<div itemscope itemtype="http://schema.org/Product">

	<header>
		<h1 itemprop="name">
			<?php echo $heading_title; ?>
			<?php if ($meta_description) { ?>
				<summary itemprop="description">
					(<?php echo $meta_description; ?>)
				</summary>
			<?php } ?>
		</h1>
	</header>


	<div id="tabs" class="htabs">
		<a href="#tab-product"><?php echo $tab_product; ?></a>
		<a href="#tab-description"><?php echo $tab_description; ?></a>
		<?php if ($attribute_groups) { ?>
			<a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
		<?php } ?>
		<?php if ($review_status) { ?>
			<a href="#tab-review"><?php echo $tab_review; ?></a>
		<?php } ?>
		<?php if ($products) { ?>
			<a href="#tab-related"><?php echo $tab_related; ?> (<?php echo count($products); ?>)</a>
		<?php } ?>
	</div>


	<div id="tab-product" class="tab-content">
		<div class="row">

			<div class="col4">
<!-- -------------------------------------------- BEGIN Images -------------------------------------------- -->
				<figure class="">
				<?php if ($thumb || $images) { ?>
					<div class="slider-wrapper theme-omega">
						<div id="slider" class="nivoSlider">
						<?php if ($slider) { ?>
							<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="" rel="popup">
								<img src="<?php echo $slider; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
							</a>
						<?php } ?>
						<?php if ($images) { ?>
							<?php foreach ($images as $image) { ?>
								<a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="" rel="popup">
									<img src="<?php echo $image['slider']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
								</a>
							<?php } ?>
						<?php } ?>
						</div>
					</div>
					<?php if ($images) { ?>
						<ul id="inline">
							<li id="inline">
								<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="zoom_rounded" rel="inline">
									<img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
								</a>
							</li>
							<?php foreach ($images as $image) { ?>
								<li id="inline">
									<a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="zoom_rounded" rel="inline">
										<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
									</a>
								</li>
							<?php } ?>
						</ul>
					<?php } ?>
				<?php } ?>
				</figure>
<!-- -------------------------------------------- END Images -------------------------------------------- -->
				<?php if ($manufacturer) { ?>
					<span itemprop="manufacturer">
							<?php echo $entry_manufacturer; ?>
							<a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a>
					</span>
					<br />
				<?php } ?>
				<?php if ($manufacturer) { ?>
					<span itemprop="model">
						<?php echo $entry_model; ?>
						<?php echo $model; ?>
					</span>
					<br />
				<?php } ?>
				<span itemprop="availability" href="http://schema.org/InStock" >
					<?php echo $entry_stock; ?>
					<?php echo $stock; ?>
				</span>
				<br />
				<?php if ($reward) { ?>
					<span>
						<?php echo $entry_reward; ?>
						<?php echo $reward; ?>
					</span>
					<br />
				<?php } ?>
<!-- -------------------------------------------- START Rating -------------------------------------------- -->
				<div itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
					<span itemprop="ratingValue">
						<img src="<?php echo ICON; ?>stars/stars-<?php echo $rating; ?>.png" alt="<?php echo $rating; ?>" />
					</span>
					<span itemprop="reviewCount">
						<a onclick="$('a[href=\'#tab-review\']').trigger('click');">
							<?php echo $reviews; ?>
						</a>
					</span>
					<?php if ($logged) { ?>
						<a onclick="$('a[href=\'#tab-review\']').trigger('click');">
							<?php echo $text_write; ?>
						</a>
					<?php } ?>
				</div>
<!-- -------------------------------------------- Start Tags -------------------------------------------- -->
				<?php if ($tags) { ?>
					<?php echo $entry_tags; ?>
					<?php foreach ($tags as $tag) { ?>
						<a href="<?php echo $tag['href']; ?>"><?php echo $tag['tag']; ?></a>,
					<?php } ?>
				<?php } ?>

<!-- -------------------------------------------- Start Links -------------------------------------------- -->
				<ul>
					<li>
						<a onclick="addToWishList('<?php echo $product_id; ?>');" class="button button_blue"><?php echo $button_wishlist; ?></a>
					</li>
					<li>
						<a onclick="addToCompare('<?php echo $product_id; ?>');" class="button button_blue"><?php echo $button_compare; ?></a>
					</li>
				</ul>

			</div>

			<details>
				<div class="col4">
					<?php if ($options) { ?>
						<div class="options">
							<br />
							<?php foreach ($options as $option) { ?>

								<?php if ($option['type'] == 'select') { ?>
									<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
										<?php if ($option['required']) { ?>
											<em class="required">*</em>
										<?php } ?>
										<?php echo $option['name']; ?>:
										<br />
										<select name="option[<?php echo $option['product_option_id']; ?>]">
											<option value=""><?php echo $text_select; ?></option>
											<?php foreach ($option['option_value'] as $option_value) { ?>
												<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
													<?php if ($option_value['price']) { ?>
														(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
													<?php } ?>
												</option>
											<?php } ?>
										</select>
									</div>
									<br />
								<?php } ?>

								<?php if ($option['type'] == 'radio') { ?>
									<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
										<?php if ($option['required']) { ?>
											<em class="required">*</em>
										<?php } ?>
										<?php echo $option['name']; ?>:
										<br />
										<?php foreach ($option['option_value'] as $option_value) { ?>
											<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
											<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
												<?php echo $option_value['name']; ?>
												<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
												<?php } ?>
											</label>
											<br />
										<?php } ?>
									</div>
									<br />
								<?php } ?>

								<?php if ($option['type'] == 'checkbox') { ?>
									<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
										<?php if ($option['required']) { ?>
											<em class="required">*</em>
										<?php } ?>
										<?php echo $option['name']; ?>:
										<br />
										<?php foreach ($option['option_value'] as $option_value) { ?>
											<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
											<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
												<?php echo $option_value['name']; ?>
												<?php if ($option_value['price']) { ?>
													(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
												<?php } ?>
											</label>
											<br />
										<?php } ?>
									</div>
									<br />
								<?php } ?>

								<?php if ($option['type'] == 'text') { ?>
									<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
										<?php if ($option['required']) { ?>
											<em class="required">*</em>
										<?php } ?>
										<?php echo $option['name']; ?>:
										<br />
										<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
									</div>
									<br />
								<?php } ?>

								<?php if ($option['type'] == 'textarea') { ?>
									<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
										<?php if ($option['required']) { ?>
											<em class="required">*</em>
										<?php } ?>
										<?php echo $option['name']; ?>:
										<br />
										<textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="25" rows="5"><?php echo $option['option_value']; ?></textarea>
									</div>
									<br />
								<?php } ?>

								<?php if ($option['type'] == 'file') { ?>
									<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
										<?php if ($option['required']) { ?>
											<em class="required">*</em>
										<?php } ?>
										<?php echo $option['name']; ?>:
										<br />
										<a id="button-option-<?php echo $option['product_option_id']; ?>" class="button button_blue"><?php echo $button_upload; ?></a>
										<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
									</div>
									<br />
								<?php } ?>

								<?php if ($option['type'] == 'date') { ?>
									<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
										<?php if ($option['required']) { ?>
											<em class="required">*</em>
										<?php } ?>
										<?php echo $option['name']; ?>:
										<br />
										<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
									</div>
									<br />
								<?php } ?>

								<?php if ($option['type'] == 'datetime') { ?>
									<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
										<?php if ($option['required']) { ?>
											<em class="required">*</em>
										<?php } ?>
										<?php echo $option['name']; ?>:
										<br />
										<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
									</div>
									<br />
								<?php } ?>

								<?php if ($option['type'] == 'time') { ?>
									<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
										<?php if ($option['required']) { ?>
											<em class="required">*</em>
										<?php } ?>
										<?php echo $option['name']; ?>:
										<br />
										<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
									</div>
									<br />
								<?php } ?>

							<?php } ?>
						</div>
					<?php } ?>
				</div>
				<div class="col4 last">
<!-- -------------------------------------------- BEGIN Price -------------------------------------------- -->
					<div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
						<?php if ($price) { ?>
							<span itemprop="price">
								<div class="">
									<ul class="prices border_blue">
										<?php if (!$special) { ?>
											<li><strong><?php echo $entry_price; ?></strong> <em><?php echo $price; ?></em></li>
										<?php } else { ?>
											<li><strong><?php echo $entry_price; ?></strong> <em><span class="strike"><?php echo $price; ?></span></em></li>
											<li><strong><?php echo $entry_special; ?></strong> <em><?php echo $special; ?></em></li>
										<?php } ?>

										<?php if ($tax) { ?>
											<li><strong><?php echo $entry_tax; ?></strong> <em><?php echo $tax; ?></em></li>
										<?php } ?>

										<?php if ($points) { ?>
											<li><strong><?php echo $entry_points; ?></strong> <em><?php echo $points; ?></em></li>
										<?php } ?>
									</ul>
								</div>
								<?php if ($discounts) { ?>
									<ul class="prices border_green">
										<?php foreach ($discounts as $discount) { ?>
											<li>
											<?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?>
											</li>
										<?php } ?>
									</ul>
								<?php } ?>
							</span>
						<?php } ?>
					</div>
<!-- -------------------------------------------- END Price -------------------------------------------- -->
					<div class="cart">
						<?php if ($minimum > 1) { ?>
							<div class="minimum">
								<?php echo $text_minimum; ?>
							</div>
						<?php } ?>
						<?php echo $text_qty; ?>
						<input type="text" name="quantity" size="2" value="<?php echo $minimum; ?>" />
						<input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
						<ul>
							<li>
								<a id="button-cart" class="button button_green right"><?php echo $button_cart; ?></a>
							</li>
						</ul>
					</div>
				</div>
			</details>

		</div>
	</div>


	<div id="tab-description" class="tab-content">
		<?php echo $description; ?>
	</div>


	<?php if ($attribute_groups) { ?>
		<div id="tab-attribute" class="tab-content">
			<?php foreach ($attribute_groups as $attribute_group) { ?>
				<table class="">
					<thead>
						<tr>
							<th scope="col" colspan="2" class="textleft"><?php echo $attribute_group['name']; ?></th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
							<tr>
								<td><?php echo $attribute['name']; ?></td>
								<td><?php echo $attribute['text']; ?></td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
			<?php } ?>
		</div>
	<?php } ?>


	<?php if ($review_status) { ?>
		<div id="tab-review" class="tab-content">
			<div id="review"></div>
			<?php if ($logged) { ?>
				<h2 id="review-title"><?php echo $text_write; ?></h2>
				<?php echo $entry_name; ?>
				<br />
				<input type="text" name="name" value="" />
				<br />
				<br />
				<?php echo $entry_review; ?>
				<textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
				<span style="font-size: 11px;">
					<?php echo $text_note; ?>
				</span>
				<br />
				<br />
				<?php echo $entry_rating; ?>
				<img src="<?php echo ICON; ?>16/down-grey.png" alt="down" />
				&nbsp;
				<input type="radio" name="rating" value="1" />
				&nbsp;
				<input type="radio" name="rating" value="2" />
				&nbsp;
				<input type="radio" name="rating" value="3" />
				&nbsp;
				<input type="radio" name="rating" value="4" />
				&nbsp;
				<input type="radio" name="rating" value="5" />
				&nbsp;
				<img src="<?php echo ICON; ?>16/up.png" alt="up" />
				<br />
				<br />
				<?php echo $entry_captcha; ?>
				<br />
				<input type="text" name="captcha" value="" />
				<br />
				<img src="index.php?route=product/product/captcha" alt="" id="captcha" />
				<br />
				<br />
				<div class="buttons">
					<div class="right">
						<a id="button-review" class="button button_green"><?php echo $button_continue; ?></a>
					</div>
				</div>
			<?php } else { ?>
				<div class="notice">
					<?php echo $text_review_login; ?>
				</div>
			<?php } ?>
		</div>
	<?php } ?>


	<?php if ($products) { ?>
		<div id="tab-related" class="tab-content">
			<div class="filter">
				<div class="display">
					<?php echo $text_display; ?>
					<?php echo $text_list; ?>
					/
					<a onclick="display('grid');"><?php echo $text_grid; ?></a>
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


		</div>
	<?php } ?>


</article>


	<div class="button_container container_grey">
		<a href="<?php echo $continue; ?>" class="button button_blue right"><?php echo $button_continue; ?></a>
	</div>


<script language="javascript" type="text/javascript">
	var text_display = '<?php echo $text_display; ?>';
	var text_list = '<?php echo $text_list; ?>';
	var text_grid = '<?php echo $text_grid; ?>';
</script>

<script language="javascript" type="text/javascript">
	var template_image = '<?php echo $template_image; ?>';
	var product_id = '<?php echo $product_id; ?>';
	var text_wait = '<?php echo $text_wait; ?>';
</script>

<script language="javascript" type="text/javascript">
	var entry_product = '<?php echo $entry_product; ?>';
	var entry_model = '<?php echo $entry_model; ?>';
	var entry_quantity = '<?php echo $entry_quantity; ?>';
	var entry_reason = '<?php echo $entry_reason; ?>';
	var entry_opened = '<?php echo $entry_opened; ?>';
	var text_yes = '<?php echo $text_yes; ?>';
	var entry_fault_detail = '<?php echo $entry_fault_detail; ?>';
	var button_remove = '<?php echo $button_remove; ?>';

	var return_reasons = '<?php echo $return_reasons; ?>';
</script>
<script language="javascript" type="text/javascript">
	var text_modify = '<?php echo $text_modify; ?>';
	var text_checkout_account = '<?php echo $text_checkout_account; ?>';
	var text_checkout_payment_address = '<?php echo $text_checkout_payment_address; ?>';
	var logged = '<?php echo $logged; ?>';
	var shipping_required = '<?php echo $shipping_required; ?>';
</script>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>