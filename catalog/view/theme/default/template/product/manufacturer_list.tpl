<?php echo $header; ?>

<section class="box_content">

	<a name="#top"></a>

	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

<?php if ($categories) { ?>
<div id="content">

	<h3><?php echo $text_index; ?></h3>

	<div class="box_content">
		<?php foreach ($categories as $category) { ?>
			<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a>
		<?php } ?>
	</div>

	<div class="box_plain">
		<?php foreach ($categories as $category) { ?>
			<?php $i = 0; ?>
			<h4 class="underline"><?php echo $category['name']; ?><a id="<?php echo $category['name']; ?>"></a></h4>
			<ul>
				<?php for ($j = 0; $j < count($category['manufacturer']);) { ?>
					<li>
						<a href="<?php echo $category['manufacturer'][$j]['href']; ?>"><?php echo $category['manufacturer'][$j]['name']; ?></a>
					</li>
					<?php $j++; ?>
				<?php } ?>
			</ul>
			<?php $i++; ?>
		<?php } ?>
	</div>

</div>
<?php } else { ?>
	<div class="content"><?php echo $text_empty; ?></div>
<?php } ?>

	<div class="button_container container_grey">
		<a href="#top" class="button button_blue left" rel="nofollow"><?php echo $button_top; ?></a>
		<a href="<?php echo $continue; ?>" class="button button_blue right"><?php echo $button_home; ?></a>
	</div>

</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>