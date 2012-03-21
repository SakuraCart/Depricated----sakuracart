<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div class="sitemap-info">
		<div class="left">
			<ul>
				<?php foreach ($categories as $category_1) { ?>
				<li><a href="<?php echo $category_1['href']; ?>"><?php echo $category_1['name']; ?></a>
					<?php if ($category_1['children']) { ?>
					<ul>
						<?php foreach ($category_1['children'] as $category_2) { ?>
						<li><a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a>
							<?php if ($category_2['children']) { ?>
							<ul>
								<?php foreach ($category_2['children'] as $category_3) { ?>
								<li><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
								<?php } ?>
							</ul>
							<?php } ?>
						</li>
						<?php } ?>
					</ul>
					<?php } ?>
				</li>
				<?php } ?>
			</ul>
		</div>
		<div class="right">
			<ul>
				<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
				<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
					<ul>
						<li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
						<li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
						<li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
						<li><a href="<?php echo $history; ?>"><?php echo $text_history; ?></a></li>
						<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
					</ul>
				</li>
				<li><a href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a></li>
				<li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
				<li><a href="<?php echo $search; ?>"><?php echo $text_search; ?></a></li>
				<li><?php echo $text_information; ?>
					<ul>
						<?php foreach ($informations as $information) { ?>
						<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
						<?php } ?>
						<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>

	<div class="button_container container_grey">
		<a href="<?php echo $continue; ?>" class="button button_blue right"><?php echo $button_home; ?></a>
	</div>

</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>
