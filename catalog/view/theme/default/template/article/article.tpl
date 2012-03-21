<?php echo $header; ?>

<section class="box_content">
	<a name="#top"></a>

<?php if ($description) { ?>


	<div id="tabs" class="htabs">
		<?php if ($description) { ?>
			<a href="#tab-description"><?php echo $tab_article; ?></a>
		<?php } ?>
		<?php  if ($comment_status) { ?>
			<a href="#tab-comment"><?php echo $tab_comment; ?></a>
		<?php } ?>
		<?php if ($articles) { ?>
			<a href="#tab-related"><?php echo $tab_related; ?> (<?php echo count($articles); ?>)</a>
		<?php } ?>
	</div>


	<div id="tab-description" class="tab-content">
	<article>
	<div itemscope itemtype="http://schema.org/Article">

	<header>
		<h1 itemprop="name">
			<?php echo $heading_title; ?>
			<?php if ($meta_description) { ?>
				<summary itemprop="description">
					(<?php echo $meta_description; ?>)
				</summary>
			<?php } ?>
		</h1>
	</header>

	<div class="short_container row">
		<div class="col4">
	<!-- -------------------------------------------- BEGIN Images -------------------------------------------- -->
			<figure class="">
			<?php if ($thumb || $images) { ?>
				<div class="slider-wrapper theme-omega">
					<div id="slider" class="nivoSlider">
					<?php if ($slider) { ?>
						<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="" rel="popup">
							<img src="<?php echo $slider; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
						</a>
					<?php } ?>
					<?php if ($images) { ?>
						<?php foreach ($images as $image) { ?>
							<a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="" rel="popup">
								<img src="<?php echo $image['slider']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
							</a>
						<?php } ?>
					<?php } ?>
					</div>
				</div>
				<?php if ($images) { ?>
					<ul id="inline">
						<li id="inline">
							<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="zoom_rounded" rel="inline">
								<img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
							</a>
						</li>
						<?php foreach ($images as $image) { ?>
							<li id="inline">
								<a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="zoom_rounded" rel="inline">
									<img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
								</a>
							</li>
						<?php } ?>
					</ul>
				<?php } ?>
			<?php } ?>
			</figure>
	<!-- -------------------------------------------- END Images -------------------------------------------- -->
			<div class="">

				<div itemscope itemtype="http://schema.org/CreativeWork">
					<?php if ($author) { ?>
						<?php echo $entry_author; ?>
						<span itemprop="author">
							<a href="<?php echo $authors; ?>"><?php echo $author; ?></a>
						</span>
						<br />
					<?php } ?>
					<?php echo $entry_date; ?>
					<span itemprop="datePublished">
						<?php echo $date; ?>
					</span>
				</div>

				<br />
				<?php echo $entry_viewed; ?>
				<?php echo $viewed; ?>

				<div itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
					<span itemprop="ratingValue">
						<img src="<?php echo ICON; ?>stars/stars-<?php echo $rating; ?>.png" alt="<?php echo $rating; ?>" />
					</span>
					<br />
					<?php  if ($comment_status) { ?>
						<span itemprop="reviewCount">
							<a onclick="$('a[href=\'#tab-comment\']').trigger('click');">
								<?php echo $comments; ?>
							</a>
						</span>
					<?php } ?>
				</div>

				<br />
				<!-- AddThis Button BEGIN -->
				<div class="share">
					<div class="addthis_default_style">
						<a class="addthis_button_compact"><?php echo $text_share; ?></a>
						<a class="addthis_button_email"></a><a class="addthis_button_print"></a>
						<a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a>
					</div>
					<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js"></script>
				</div>
				<!-- AddThis Button END -->
				<br />

			</div>

		</div>
		<div class="col8 last">
			<div itemscope itemtype="http://schema.org/Article">
				<span itemprop="articleBody">
					<?php echo $description; ?>
				</span>
			</div>
			<div class="button_container container_grey">
				<a onclick="addToReadList('<?php echo $article_id; ?>');" class="button button_blue left"><?php echo $button_readlist; ?></a>
				<?php  if ($comment_status) { ?>
						<a onclick="$('a[href=\'#tab-comment\']').trigger('click');" class="button button_green right"><?php echo $text_write; ?></a>
				<?php } ?>
			</div>

			<?php if ($tags) { ?>
				<br />
				<div class="tags">
					<div itemscope itemtype="http://schema.org/CreativeWork">
						<span itemprop="keywords">
							<?php echo $text_tags; ?>
							<?php foreach ($tags as $tag) { ?>
								<a href="<?php echo $tag['href']; ?>"><?php echo $tag['tag']; ?></a>,
							<?php } ?>
						</span>
					</div>
				</div>
			<?php } ?>

		</div>

	</div>

	</div>
	</article>
	</div>


	<?php  if ($comment_status) { ?>
		<div id="tab-comment" class="tab-content">

		<?php if ($logged) { ?>
			<h2><?php echo $text_write; ?></h2>

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="comment_form" name="comment_form" class="uniForm">
<input type="hidden" name="secret_token" value="<?php echo $secret_token; ?>">
<input type="hidden" name="timer" value="<?php echo $timer; ?>">

	<fieldset>

	<div class="ctrlHolder">
		<label class="" for="name"><em>*</em><?php echo $entry_name; ?></label>
		<input
			type="text"
			class="textInput required validateAlpha validateMin val-3"
			size="50"
			maxlength="50"
			required="required"
			tabindex="1"
			id="name"
			title="name"
			name="name"
			value="<?php // echo $name; ?>"
			data-default-value="<?php echo $entry_name; ?>"
		/>
		<p class="formHint"><?php echo $text_required_name; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="enquiry"><em>*</em><?php echo $entry_enquiry; ?></label>
		<textarea
			class="textInput required validatePhrase validateMin val-10 validateMaxLength val-3000"
			rows="25"
			cols="50"
			id="enquiry"
			required="required"
			tabindex="3"
			id="enquiry"
			title="enquiry"
			name="enquiry"
			value="<?php echo $enquiry; ?>"
			data-default-value="<?php echo $entry_enquiry; ?>"
		></textarea>
		<p class="formHint">
			<?php echo $text_required_enquiry; ?>
			<br />
			<?php echo $text_note; ?>
		</p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="rating"><?php echo $entry_rating; ?></label>
		<ul class="blockLabels">
			<li>
				<em>-</em>
					<input
						type="radio"
						id="rating"
						tabindex="3"
						id="rating"
						title="rating"
						name="rating"
						value="1"
						data-default-value=""
					>
					<input
						type="radio"
						id="rating"
						tabindex="3"
						id="rating"
						title="rating"
						name="rating"
						value="2"
						data-default-value=""
					>
					<input
						type="radio"
						id="rating"
						tabindex="3"
						id="rating"
						title="rating"
						name="rating"
						value="3"
						data-default-value=""
					>
					<input
						type="radio"
						id="rating"
						tabindex="3"
						id="rating"
						title="rating"
						name="rating"
						value="4"
						data-default-value=""
					>
					<input
						type="radio"
						id="rating"
						tabindex="3"
						id="rating"
						title="rating"
						name="rating"
						value="5"
						data-default-value=""
					>
				<em>+</em>
			</li>
		</ul>
		<p class="formHint"><?php echo $text_whynot_rate; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="human"><em>*</em><?php echo $text_bot_prevention; ?></label>
		<ul class="blockLabels">
			<li>
				<label for="">
					<input
						type="checkbox"
						class="required"
						id="human"
						required="required"
						tabindex="4"
						id="human"
						title="human"
						name="human"
						value="<?php echo $human; ?>"
						data-default-value="<?php echo $entry_human; ?>"
					>
					<?php echo $text_required_human; ?>
				</label>
			</li>
		</ul>
		<p class="formHint"><?php echo $text_required; ?></p>
	</div>

	</fieldset>

	<div class="button_container container_grey">
		<a onclick="$('#contact_form').submit();" class="button button_green right"><?php echo $button_continue; ?></a>
		<a  id="button-comment" class="button button_green right"><?php echo $button_continue; ?></a>
	</div>

</form>
		<?php } else { ?>
			<div class="notice">
				<?php echo $text_review_login; ?>
			</div>
		<?php } ?>

	</div>
	<?php } ?>

	<?php if ($articles) { ?>
		<div id="tab-related" class="tab-content">

		<?php foreach ($articles as $article) { ?>
			<div class="container row">

				<div class="col1">
					<?php if ($article['thumb']) { ?>
						<div class="image">
							<div itemscope itemtype="http://schema.org/Article">
								<span itemprop="image">
									<a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" title="<?php echo $article['name']; ?>" alt="<?php echo $article['name']; ?>" /></a>
								</span>
							</div>
						</div>
					<?php } ?>
				</div>

				<div class="col11 last">
					<div itemscope itemtype="http://schema.org/Article">
						<span itemprop="name">
							<a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a>
						</span>
					</div>

					<div itemscope itemtype="http://schema.org/Article">
						<span itemprop="articleBody">
							<?php echo $article['description']; ?>
						</span>
					</div>

					<?php if ($article['rating']) { ?>
						<div itemscope itemtype="http://schema.org/Article">
							<span itemprop="contentRating">
								<img src="<?php echo ICON; ?>stars/stars-<?php echo $article['rating']; ?>.png" alt="<?php echo $article['reviews']; ?>" />
							</span>
						</div>
					<?php } ?>

					<div class="read">
						<a href="<?php echo $article['href']; ?>" class="button button_green"><?php echo $button_read; ?></a>
					</div>

					<div class="readlist">
						<a onclick="addToReadList('<?php echo $article['article_id']; ?>');" class="button button_blue"><?php echo $button_readlist; ?></a>
					</div>
				</div>

			</div>
		<?php } ?>

		</div>

	<?php } ?>

<?php } else { ?>
	<div class="content"><?php echo $text_empty; ?></div>
<?php } ?>

	<div class="button_container container_grey">
		<a href="#top" class="button button_blue left" rel="nofollow"><?php echo $button_top; ?></a>
		<a href="<?php echo $continue; ?>" class="button button_blue right"><?php echo $button_home; ?></a>
	</div>

<script language="javascript" type="text/javascript">
	var article_id = '<?php echo $article_id; ?>';
	var text_wait = '<?php echo $text_wait; ?>';
</script>


</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>