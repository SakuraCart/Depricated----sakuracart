<?php echo $header; ?>

<section class="box_content">

	<?php if ($compare_count > '0') { ?>
		<div class="compare_total">
			<a href="<?php echo $compare; ?>" id="compare_total" class="button button_blue"><?php echo $text_compare; ?></a>
		</div>
	<?php } ?>

	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<div itemscope itemtype="http://schema.org/Article">
			<span itemprop="author">
				<?php echo $heading_title; ?>
			</span>
		</div>
	</h2>

<a name="#top"></a>


<!--
NEED TO BUILD UP
a section for each other
<img src="<?php echo $image_author; ?>" alt="" />
-->


<?php if ($articles) { ?>

	<div class="filter">

		<div class="display">
			<?php echo $text_display; ?>
			<?php echo $text_list; ?>
			/
			<a onclick="display('grid');"><?php echo $text_grid; ?></a>
		</div>

		<div class="limit"><?php echo $text_limit; ?>
			<select onchange="location = this.value;">
				<?php foreach ($limits as $limits) { ?>
					<?php if ($limits['value'] == $limit) { ?>
						<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
					<?php } else { ?>
						<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
					<?php } ?>
				<?php } ?>
			</select>
		</div>

		<div class="sort"><?php echo $text_sort; ?>
			<select onchange="location = this.value;">
				<?php foreach ($sorts as $sorts) { ?>
					<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
						<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
					<?php } else { ?>
						<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
					<?php } ?>
				<?php } ?>
			</select>
		</div>

	</div>

	<div class="list">
		<?php foreach ($articles as $article) { ?>

			<div>
				<?php if ($article['thumb']) { ?>
					<div class="image">
						<div itemscope itemtype="http://schema.org/Article">
							<span itemprop="image">
								<a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" title="<?php echo $article['name']; ?>" alt="<?php echo $article['name']; ?>" /></a>
							</span>
						</div>
					</div>
				<?php } ?>

				<div class="name">
					<div itemscope itemtype="http://schema.org/Article">
						<span itemprop="name">
							<a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a>
						</span>
					</div>
				</div>

				<div class="description">
					<div itemscope itemtype="http://schema.org/Article">
						<span itemprop="articleBody">
							<?php echo $article['description']; ?>
						</span>
					</div>
				</div>

				<?php if ($article['rating']) { ?>
					<div class="rating">
						<div itemscope itemtype="http://schema.org/Article">
							<span itemprop="contentRating">
								<img src="<?php echo ICON; ?>stars/stars-<?php echo $article['rating']; ?>.png" alt="<?php echo $article['reviews']; ?>" />
							</span>
						</div>
					</div>
				<?php } ?>

				<div class="read">
					<a href="<?php echo $article['href']; ?>" class="button button_green"><?php echo $button_read; ?></a>
				</div>

				<div class="readlist">
					<a onclick="addToReadList('<?php echo $article['article_id']; ?>');" class="button button_blue"><?php echo $button_readlist; ?></a>
				</div>
			</div>

		<?php } ?>
	</div>

	<div class="pagination"><?php echo $pagination; ?></div>

<?php } else { ?>
	<div class="content"><?php echo $text_empty; ?></div>
<?php }?>

	<div class="button_container container_grey">
		<a href="#top" class="button button_blue left" rel="nofollow"><?php echo $button_top; ?></a>
		<a href="<?php echo $continue; ?>" class="button button_blue right"><?php echo $button_home; ?></a>
	</div>

<script language="javascript" type="text/javascript">
	var text_display = '<?php echo $text_display; ?>';
	var text_list = '<?php echo $text_list; ?>';
	var text_grid = '<?php echo $text_grid; ?>';
	var article_id = '<?php echo $article_id; ?>';
</script>

</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>