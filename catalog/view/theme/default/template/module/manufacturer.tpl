<!-- -------------------------------------------- BEGIN manufacturer -------------------------------------------- -->
<?php if ($manufacturers) { ?>
<section class="box_<?php echo $box_position; ?>">
	<h2 class="box_<?php echo $box_position; ?>">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div class="box_plain"">
		<?php foreach ($manufacturers as $manufacturer) { ?>
			<div>
				<?php if ($manufacturer['thumb']) { ?>
					<div class="image"><a href="<?php echo $manufacturer['href']; ?>"><img src="<?php echo $manufacturer['thumb']; ?>" alt="<?php echo $manufacturer['name']; ?>" /></a></div>
				<?php } ?>
					<div class="name"><a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
				<?php if ($manufacturer['rating']) { ?>
					<div class="rating"><img src="<?php echo ICON; ?>stars/stars-<?php echo $manufacturer['rating']; ?>.png" alt="<?php echo $manufacturer['reviews']; ?>" /></div>
				<?php } ?>
					<?php if ($manufacturer['reviews']) { ?>
				<div class="rating"><img src="<?php echo ICON; ?>stars/stars-<?php echo $manufacturer['rating']; ?>.png" alt="<?php echo $manufacturer['reviews']; ?>" /></div>
				<?php } ?>
			</div>
		<?php } ?>
	</div>

</section>
<?php } ?>
<!-- -------------------------------------------- END manufacturer -------------------------------------------- -->
