<!-- -------------------------------------------- BEGIN carousel -------------------------------------------- -->
<?php if ($carousels) { ?>
<section class="box_<?php echo $box_position; ?>">
<!--
	<h2 class="box_<?php echo $box_position; ?>">
-->
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
<!--
		<?php echo $heading_title; ?>
	</h2>
-->

	<div id="carousel<?php echo $module; ?>">
		<ul class="jcarousel-skin-cart">
			<?php foreach ($carousels as $carousel) { ?>
				<li><a href="<?php echo $carousel['link']; ?>"><img src="<?php echo $carousel['image']; ?>" alt="<?php echo $carousel['title']; ?>" title="<?php echo $carousel['title']; ?>" /></a></li>
			<?php } ?>
		</ul>
	</div>

<script language="javascript" type="text/javascript">
	var module = '<?php echo $module; ?>';
	var vertical = 'false';
	var visible = '<?php echo $limit; ?>';
	var scroll = '<?php echo $scroll; ?>';
</script>

</section>
<?php } ?>
<!-- -------------------------------------------- END carousel -------------------------------------------- -->