<!-- -------------------------------------------- BEGIN author -------------------------------------------- -->
<?php if ($authors) { ?>
<section class="box_<?php echo $box_position; ?>">
	<h2 class="box_<?php echo $box_position; ?>">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div class="box_plain"">
		<?php foreach ($authors as $author) { ?>

			<div>
				<?php if ($author['thumb']) { ?>
					<div class="image"><a href="<?php echo $author['href']; ?>"><img src="<?php echo $author['thumb']; ?>" alt="<?php echo $author['name']; ?>" /></a></div>
				<?php } ?>

				<div itemscope itemtype="http://schema.org/Article">
					<span itemprop="author">
						<a href="<?php echo $author['href']; ?>"><?php echo $author['name']; ?></a>
					</span>
				</div>

				<?php if ($author['rating']) { ?>
					<div class="rating">
						<div itemscope itemtype="http://schema.org/Article">
							<span itemprop="aggregateRating">
								<img src="<?php echo ICON; ?>stars/stars-<?php echo $author['rating']; ?>.png" alt="<?php echo $author['reviews']; ?>" />
							</span>
						</div>
					</div>
				<?php } ?>
			</div>

		<?php } ?>
	</div>

</section>
<?php } ?>
<!-- -------------------------------------------- END author -------------------------------------------- -->