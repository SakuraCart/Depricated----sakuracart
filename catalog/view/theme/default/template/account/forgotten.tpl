<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div id="content">

	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>

		<h3><?php echo $text_email; ?></h3>

			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="forgotten" name="forgotten" class="uniForm">
			<fieldset>

			<div class="ctrlHolder">
				<label class="" for="email"><?php echo $entry_email; ?></label>
				<input
					type="text"
					class="textInput required validateEmail"
					size="50"
					maxlength="50"
					required="required"
					tabindex="1"
					id="email"
					title="email"
					name="email"
					value="<?php echo $text_email; ?>"
					data-default-value="<?php echo $text_email; ?>"
				/>
				<p class="formHint"><?php echo $text_required; ?></p>
			</div>

			</fieldset>
	</form>

			<div class="button_container container_grey">
				<a href="<?php echo $continue; ?>" class="button button_blue left"><?php echo $button_back; ?></a>
				<a onclick="$('#forgotten').submit();" class="button button_green right"><?php echo $button_continue; ?></a>
			</div>


	</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>