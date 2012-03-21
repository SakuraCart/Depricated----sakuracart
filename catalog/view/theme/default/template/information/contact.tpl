<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

<?php if ($error_name) { ?>
	<div class="error"><?php echo $error_name; ?></div>
<?php } ?>
<?php if ($error_email) { ?>
	<div class="error"><?php echo $error_email; ?></div>
<?php } ?>
<?php if ($error_enquiry) { ?>
	<div class="error"><?php echo $error_enquiry; ?></div>
<?php } ?>

<!--[if lte ie 7]>
	<style type="text/css" media="screen">
	/* Move these to your IE6/7 specific stylesheet if possible */
		.uniForm, .uniForm fieldset, .uniForm .ctrlHolder, .uniForm .formHint, .uniForm .buttonHolder, .uniForm .ctrlHolder ul{ zoom:1; }
	</style>
<![endif]-->

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="contact_form" name="contact_form" class="uniForm">
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
			value="<?php echo $name; ?>"
			data-default-value="<?php echo $entry_name; ?>"
		/>
		<p class="formHint"><?php echo $text_required_name; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="email"><em>*</em><?php echo $entry_email; ?></label>
		<input
			type="text"
			class="textInput required validateEmail"
			size="50"
			maxlength="50"
			required="required"
			tabindex="2"
			id="email"
			title="email"
			name="email"
			value="<?php echo $email; ?>"
			data-default-value="<?php echo $entry_email; ?>"
		/>
		<p class="formHint"><?php echo $text_required_email; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="enquiry"><em>*</em><?php echo $entry_enquiry; ?></label>
		<textarea
			class="textInput required validateMin val-5 validateMaxLength val-3000"
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
		<p class="formHint"><?php echo $text_required_enquiry; ?></p>
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
						value="human"
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
		<a href="<?php echo $home; ?>" class="button button_blue left"><?php echo $button_home; ?></a>
		<a onclick="$('#contact_form').submit();" class="button button_green right"><?php echo $button_continue; ?></a>
	</div>

</form>

</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>
