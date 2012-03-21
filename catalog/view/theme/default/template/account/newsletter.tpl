<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

<div id="content">

	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="newsletter" name="newsletter" class="uniForm">
	<fieldset>

	<h3><?php echo $text_newsletter; ?></h3>

	<div class="ctrlHolder">
		<label class="" for="newsletter"><?php echo $entry_subscription; ?></label>
		<ul class="blockLabels">
			<li>
				<label for="newsletter">
				<?php if ($newsletter == 1) { ?>
					<input
						type="checkbox"
						id="newsletter"
						tabindex="1"
						title="newsletter"
						name="newsletter"
						checked="checked"
					>
				<?php } else { ?>
					<input
						type="checkbox"
						id="newsletter"
						tabindex="1"
						title="newsletter"
						name="newsletter"
						checked=""
					>
				<?php } ?>
					<?php echo $text_newsletter; ?>
				</label>
			</li>
		</ul>
		<p class="formHint"><?php echo $text_hint_newsletter; ?></p>
	</div>
	</div>

	</fieldset>
	</form>

	<div class="button_container container_grey">
		<a href="<?php echo $continue; ?>" class="button button_blue left"><?php echo $button_back; ?></a>
		<a onclick="$('#newsletter').submit();" class="button button_green right"><?php echo $button_continue; ?></a>
	</div>

</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>