<!-- -------------------------------------------- BEGIN slideshow -------------------------------------------- -->
<?php if ($banners) { ?>
<section class="box_<?php echo $box_position; ?>">

	<div class="slideshow">
		<div id="slideshow<?php echo $module; ?>" class="nivoSlider" style="width: <?php echo $width; ?>px; height: <?php echo $height; ?>px;">
			<?php foreach ($banners as $banner) { ?>
				<?php if ($banner['link']) { ?>
					<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
				<?php } else { ?>
					<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
				<?php } ?>
			<?php } ?>
		</div>
	</div>

<script language="javascript" type="text/javascript">
	var module = "<?php echo $module; ?>";
</script>

</section>
<?php } ?>
<!-- -------------------------------------------- END slideshow -------------------------------------------- -->
