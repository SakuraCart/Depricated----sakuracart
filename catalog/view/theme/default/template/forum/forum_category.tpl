<?php echo $header; ?>

<section class="box_content">
	<a name="#top"></a>


	<div id="tabs" class="htabs">
		<?php // if ($threads) { ?>
			<a href="#tab-threads"><?php echo $tab_threads; ?></a>
		<?php // } ?>
		<?php // if ($categories) { ?>
			<a href="#tab-subcategories"><?php echo $tab_subcategories; ?></a>
		<?php // } ?>
		<?php // if ($post_status) { ?>
			<a href="#tab-new-thread"><?php echo $tab_new_thread; ?></a>
		<?php // } ?>
	</div>



	<?php if ($thread_status) { ?>
		<div id="tab-new-thread" class="tab-content">
<div id="post"></div>
			<h1 id="post-title"><?php echo $heading_new_thread; ?></h1>
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
				<input type="hidden" name="category_id" size="2" value="<?php echo $category_id; ?>" />
				<input type="hidden" name="language_id" value="<?php echo $language_id; ?>" />

				<b><?php echo $entry_thread_title; ?></b>
				<br />
				<input type="text" name="title" value="" style="width: 98%;"/>
				<br />
				<br />
				<b><?php echo $entry_thread_post; ?></b>
				<textarea name="description" cols="40" rows="8" style="width: 98%;"></textarea>
				<span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
				<br />
				<br />

				<div class="button_container">
<a id="button-post"  class="button button_blue left"><?php echo $button_continue; ?></a>
<a onclick="newThread('<?php echo $this_thread_id; ?>');" class="button button_blue left"><?php echo $button_new_thread; ?></a>
<a onclick="$('#form').submit();" class="button button_green right"><?php echo $button_continue; ?></a>
				</div>

			</form>

		</div>
	<?php } ?>



	<?php if ($categories) { ?>
		<div id="tab-subcategories" class="tab-content">
			<?php if ($categories) { ?>
				<div class="box_content">
					<h3><?php echo $text_subcategories; ?></h3>
					<?php foreach ($categories as $category) { ?>
						<div class="container row">
								<div class="col1">
								<?php if ($thumb) { ?>
									<div class="forum-image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
								<?php } ?>
							</div>
							<div class="col11 last">
								<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
								<?php if ($description) { ?>
									<?php echo $description; ?>
								<?php } ?>
							</div>
						</div>
					<?php } ?>
				</div>
			<?php } ?>
		</div>
	<?php } ?>

	<div id="tab-threads" class="tab-content">
		<div class="box_content">
			<div class="container row">
				<div class="col12 last">
					<h1 class="underline"><?php echo $heading_title; ?></h1>
				</div>
				<div class="col1">
					<?php if ($thumb) { ?>
						<div class="forum-image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
					<?php } ?>
				</div>
				<div class="col11 last">
					<?php if ($description) { ?>
						<?php echo $description; ?>
					<?php } ?>
				</div>
			</div>
		</div>

		<?php if ($threads) { ?>
			<div class="container row">
				<div class="col12 last">
					<h3 class="underline"><?php echo $text_threads; ?></h3>
				</div>
			</div>

			<?php foreach ($threads as $thread) { ?>
				<div class="container row">
					<div class="col1">
						<?php if ($thread['thumb']) { ?>
							<div class="image">
								<a href="<?php echo $thread['href']; ?>"><img src="<?php echo $thread['thumb']; ?>" title="<?php echo $thread['name']; ?>" alt="<?php echo $thread['name']; ?>" /></a>
							</div>
						<?php } ?>
						<?php if ($thread['rating']) { ?>
							<div class="rating">
								<img src="<?php echo ICON; ?>stars/stars-<?php echo $thread['rating']; ?>.png" alt="<?php echo $thread['posts']; ?>" />
							</div>
						<?php } ?>
					</div>
					<div class="col11 last">
						<a href="<?php echo $thread['href']; ?>"><?php echo $thread['title']; ?></a>
						<br />
						<?php if ($description) { ?>
							<?php echo $thread['description']; ?>
						<?php } ?>
							<br />
							<?php echo $entry_last_post; ?>
							<?php echo $thread['date']; ?>
							<br />
							<?php echo $entry_views; ?>
							<?php echo $thread['viewed']; ?>
							<br />
					</div>
				</div>
			<?php } ?>

			<div class="container row">
				<div class="col12 last">
			<div class="pagination">
				<b><?php echo $text_limit; ?></b>
				<select onchange="location = this.value;">
					<?php foreach ($limits as $limits) { ?>
						<?php if ($limits['value'] == $limit) { ?>
							<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
						<?php } ?>
					<?php } ?>
				</select>
				<?php echo $pagination; ?>
			</div>
				</div>
			</div>

	</div>

<?php } else { ?>
	<div class="content"><?php echo $text_empty; ?></div>
<?php }?>

<script language="javascript" type="text/javascript">
	var text_display = '<?php echo $text_display; ?>';
	var text_list = '<?php echo $text_list; ?>';
	var text_grid = '<?php echo $text_grid; ?>';
</script>

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