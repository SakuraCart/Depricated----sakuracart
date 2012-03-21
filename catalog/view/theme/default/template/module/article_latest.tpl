<!-- -------------------------------------------- BEGIN article_latest -------------------------------------------- -->
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
				<?php if ($article['rating']) { ?>
				<div class="rating"><img src="<?php echo ICON; ?>stars/stars-<?php echo $article['rating']; ?>.png" alt="<?php echo $article['comments']; ?>" /></div>
				<?php } ?>
			</div>
			<?php } ?>
		</div>

</section>
<?php } ?>
<!-- -------------------------------------------- END article_latest -------------------------------------------- -->
