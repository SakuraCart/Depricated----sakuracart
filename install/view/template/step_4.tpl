<?php echo $header; ?>

<div class="container row">
	<div class="col12 last">

	<div class="warning">
		<?php echo $text_delete_install; ?>
	</div>


<section class="box_content">
	<h2 class="box_content">
		<?php echo $text_heading_step_4; ?>
	</h2>

	<div class="row">
		<div class="col9">
			<div class="content_left center">
				<a href="../index.php?route=common/home"><img src="view/image/shop.png" alt="" /></a>
				<br />
				<div class="button_container container_grey">
					<a href="../index.php?route=common/home" class="button button_green right"><?php echo $button_shop; ?></a>
				</div>
			</div>

			<div class="content_right center">
				<a href="../admin/index.php"><img src="view/image/admin.png" alt="" /></a>
				<br />
				<div class="button_container container_grey">
					<a href="../admin/index.php" class="button button_green right"><?php echo $button_admin; ?></a>
				</div>
			</div>

		</div>

		<div class="col3 last">
			<aside>
				<ul>
					<li>
						<img src="view/image/16/true.png" alt="right" />&nbsp;
						<?php echo $text_license; ?>
					</li>
					<li>
						<img src="view/image/16/true.png" alt="wait" />&nbsp;
						<?php echo $text_pre_install; ?>
					</li>
					<li>
						<img src="view/image/16/true.png" alt="wait" />&nbsp;
						<?php echo $text_configuration; ?>
					</li>
					<li>
						<img src="view/image/16/true.png" alt="wait" />&nbsp;
						<?php echo $text_finished; ?>
					</li>
				</ul>
			</aside>
		</div>

	</div>

</section>

	</div>
</div>

<?php echo $footer; ?>