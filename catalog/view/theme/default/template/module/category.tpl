<!-- -------------------------------------------- BEGIN category_product -------------------------------------------- -->
<?php if ($categories) { ?>
<section class="box_<?php echo $box_position; ?>">
	<h2 class="box_<?php echo $box_position; ?>">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

		<div class="box-category">
			<ul>
				<?php foreach ($categories as $category) { ?>
				<li>
					<?php if ($category['category_id'] == $category_id) { ?>
					<a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
					<?php } else { ?>
					<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
					<?php } ?>
					<?php if ($category['children']) { ?>
					<ul>
						<?php foreach ($category['children'] as $child) { ?>
						<li>
							<?php if ($child['category_id'] == $child_id) { ?>
							<a href="<?php echo $child['href']; ?>" class="active"> - <?php echo $child['name']; ?></a>
							<?php } else { ?>
							<a href="<?php echo $child['href']; ?>"> - <?php echo $child['name']; ?></a>
							<?php } ?>
						</li>
						<?php } ?>
					</ul>
					<?php } ?>
				</li>
				<?php } ?>
			</ul>
		</div>

</section>
<?php } ?>
<!-- -------------------------------------------- END category_product -------------------------------------------- -->
