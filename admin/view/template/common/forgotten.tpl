<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/send_user_email.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

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
					value="<?php echo $email; ?>"
					data-default-value="<?php echo $text_your_email; ?>"
				/>
				<p class="formHint"><?php echo $text_email; ?></p>
			</div>
		</fieldset>


			<div class="button_container container_grey">
				<a onclick="location = '<?php echo $cancel; ?>';" class="button button_red left"><?php echo $button_cancel; ?></a>
				<a onclick="$('#forgotten').submit();" class="button button_green right"><?php echo $button_reset; ?></a>
			</div>

		</form>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>