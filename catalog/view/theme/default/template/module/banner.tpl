<!-- -------------------------------------------- BEGIN banner -------------------------------------------- -->
<?php if ($banners) { ?>
<section class="box_<?php echo $box_position; ?>">

	<div id="banner<?php echo $module; ?>" class="banner">
		<?php foreach ($banners as $banner) { ?>
			<?php if ($banner['link']) { ?>
				<div>
					<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a>
				</div>
			<?php } else { ?>
				<div>
					<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" />
				</div>
			<?php } ?>
		<?php } ?>
	</div>

<script language="javascript" type="text/javascript">
	var module = "<?php echo $module; ?>";
</script>

</section>
<?php } ?>
<!-- -------------------------------------------- END banner -------------------------------------------- -->
