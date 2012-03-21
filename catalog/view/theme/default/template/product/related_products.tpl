<?php if ($products) { ?>
<span itemprop="products" itemscope itemtype="http://schema.org/Product">

	<ul id="inline">
		<?php foreach ($products as $product) { ?>
			<li id="inline">
				<figure>
					<?php if ($product['thumb']) { ?>
						<a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>" class="go" rel="inline">
							<img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
						</a>
					<?php } ?>
				</figure>
				<div class="name" itemprop="name">
					<?php echo $product['name']; ?>
				</div>

				<br />

				<?php if ($product['price']) { ?>
					<span itemprop="price">
						<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
						<?php } else { ?>
							<span class="price-old">
								<?php echo $product['price']; ?>
							</span>
							<br />
							<span class="price-new">
								<?php echo $product['special']; ?>
							</span>
						<?php } ?>
						<br />
					</span>
				<?php } ?>

				<?php if ($product['rating']) { ?>
					<div itemprop="reviews" itemscope itemtype="http://schema.org/Review">
						<div itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">
							<meta itemprop="worstRating" content = "1"/>
							<span itemprop="ratingValue">
								<img src="<?php echo ICON; ?>stars/stars-<?php echo $product['rating'] . '.png'; ?>" alt="<?php echo $product['reviews']; ?>" />
							</span>
							<meta itemprop="bestRating" content = "5"/>
						</div>
					</div>
					<br />
				<?php } ?>

				<a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><span><?php echo $button_cart; ?></span></a></div>

			</li>
		<?php } ?>
	</ul>

</span>
<?php } ?>