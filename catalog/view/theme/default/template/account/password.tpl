<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

<div id="content">

	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="password" name="password" class="uniForm">
	<fieldset>

	<h3><?php echo $text_password; ?></h3>

	<div class="ctrlHolder">
		<label class="" for="email"><em>*</em><?php echo $entry_password; ?></label>
		<input
			type="password"
			class="textInput required validateAlphaNum validateMin val-4"
			size="50"
			maxlength="50"
			required="required"
			tabindex="13"
			id="password"
			title="password"
			name="password"
			value="<?php echo $password; ?>"
			data-default-value="<?php echo $text_password; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_password; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="email"><em>*</em><?php echo $entry_confirm; ?></label>
		<input
			type="password"
			class="textInput required validateSameAs password"
			size="50"
			maxlength="50"
			required="required"
			tabindex="14"
			id="confirm"
			title="confirm"
			name="confirm"
			value="<?php echo $confirm; ?>"
			data-default-value="<?php echo $text_confirm; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_confirm; ?></p>
	</div>

	</fieldset>
	</form>

	<div class="button_container container_grey">
		<a href="<?php echo $continue; ?>" class="button button_blue left"><?php echo $button_back; ?></a>
		<a onclick="$('#password').submit();" class="button button_green right"><?php echo $button_continue; ?></a>
	</div>

</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>