<?php if ($reviews) { ?>
<div itemprop="reviews" itemscope itemtype="http://schema.org/Review">

	<?php foreach ($reviews as $review) { ?>
		<span itemprop="author">
			<?php echo $review['author']; ?>
		</span>

		<meta itemprop="publishDate" content="<?php echo $review['date_added']; ?>">
		<?php echo $review['date_added']; ?>

		<div itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">
			<meta itemprop="worstRating" content = "1"/>
			<span itemprop="ratingValue">
				<img src="<?php echo ICON; ?>stars/stars-<?php echo $review['rating'] . '.png'; ?>" alt="<?php echo $review['reviews']; ?>" />
			</span>
			<meta itemprop="bestRating" content = "5"/>
		</div>

		<span itemprop="description">
			<?php echo $review['text']; ?>
		</span>
	<?php } ?>

	<div class="pagination"><?php echo $pagination; ?></div>
</div>

<?php } else { ?>
	<div class="content">
		<?php echo $text_no_reviews; ?>
	</div>
<?php } ?>