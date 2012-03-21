<?php echo $header; ?>

<section class="box_content">
	<a name="#top"></a>


	<div id="tabs" class="htabs">
		<?php // if ($threads) { ?>
			<a href="#tab-posts"><?php echo $tab_posts; ?></a>
		<?php // } ?>
		<?php // if ($post_status) { ?>
			<a href="#tab-new-post"><?php echo $tab_new_post; ?></a>
		<?php // } ?>
	</div>

	<?php if ($post_status) { ?>
	<div id="tab-new-post" class="tab-content">
		<?php if ($logged) { ?>

		<div id="post"></div>
		<h2 id="post-title"><?php echo $text_write; ?></h2>

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
		<input type="hidden" name="thread_id" size="2" value="<?php echo $thread_id; ?>" />
		<input type="hidden" name="language_id" value="<?php echo $language_id; ?>" />

		<b><?php echo $entry_post; ?></b>
		<textarea name="description" cols="40" rows="8" style="width: 98%;"></textarea>
		<span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
		<br />
		<br />
</form>

		<div class="button_container container_grey">
			<a id="button-post" onclick="$('#form').submit();" class="button button_green right"><?php echo $button_continue; ?></a>
		</div>


		<?php } else { ?>
	<div class="notice">
		<?php echo $text_post_login; ?>
	</div>
		<?php } ?>

	</div>
	<?php } ?>



<?php if ($thread_info) { ?>
	<div id="tab-posts" class="tab-content">
		<div class="container row">
			<div class="col12 last">
				<h1 class="underline"><?php echo $heading_title; ?></h1>
			</div>
		</div>

		<div class="container row">

			<div class="col1">
				<?php if ($user) { ?>
					<?php echo $text_user; ?>
					<a href="<?php echo $users; ?>"><?php echo $user; ?></a>
					<br />
					<?php if ($thumb) { ?>
						<div class="forum-image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
					<?php } ?>
				<?php } ?>
			</div>

			<div class="col11 last">

				<?php if ($description) { ?>
					<?php echo $description; ?>
				<?php } ?>

				<?php if ($tags) { ?>
					<div class="tags">
						<?php echo $text_tags; ?>
						<?php foreach ($tags as $tag) { ?>
							<a href="<?php echo $tag['href']; ?>"><?php echo $tag['tag']; ?></a>,
						<?php } ?>
					</div>
				<?php } ?>

				<div class="col12 last">
					<br />
						<img src="<?php echo ICON; ?>stars/stars-<?php echo $rating; ?>.png" alt="<?php echo $posts; ?>" />
				</div>

			</div>

		</div>

		<div class="button_container container_grey">
			<a onclick="$('a[href=\'#tab-new-post\']').trigger('click');" class="button button_green right"><?php echo $text_write; ?></a>
		</div>

	</div>

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