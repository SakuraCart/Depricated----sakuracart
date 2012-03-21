<!-- -------------------------------------------- BEGIN article_headline -------------------------------------------- -->
<?php if ($articles) { ?>
<section class="box_<?php echo $box_position; ?>">
	<h2 class="box_<?php echo $box_position; ?>">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

		<div class="box_plain">
			<?php foreach ($articles as $article) { ?>
			<div>
				<?php if ($article['thumb']) { ?>
				<div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" /></a></div>
				<?php } ?>
				<div class="name"><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></div>
				<div class="cart"><a onclick="addToCart('<?php echo $article['article_id']; ?>');" class="button"><span><?php echo $button_cart; ?></span></a></div>
			</div>
			<?php } ?>
		</div>

</section>
<?php } ?>
<!-- -------------------------------------------- END article_headline -------------------------------------------- -->
