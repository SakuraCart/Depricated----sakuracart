<!-- -------------------------------------------- BEGIN forum_latest -------------------------------------------- -->
<?php if ($threads) { ?>
<section class="box_<?php echo $box_position; ?>">
	<h2 class="box_<?php echo $box_position; ?>">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div class="box-category">
		<ul>
			<?php foreach ($threads as $thread) { ?>
				<li><a href="<?php echo $thread['href']; ?>"><?php echo $thread['title']; ?></a></li>
			<?php } ?>
		</ul>
	</div>

</section>
<?php } ?>
<!-- -------------------------------------------- END forum_latest -------------------------------------------- -->
