<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>

<div id="content">

	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="edit" name="edit" class="uniForm">
	<fieldset>

	<h3><?php echo $text_account_information; ?></h3>

	<div class="ctrlHolder">
		<label class="" for="firstname"><em>*</em><?php echo $entry_firstname; ?></label>
		<input
			type="text"
			class="textInput required validateAlpha validateMin val-2"
			size="50"
			maxlength="50"
			required="required"
			tabindex="1"
			id="firstname"
			title="firstname"
			name="firstname"
			value="<?php echo $firstname; ?>"
			data-default-value="<?php echo $text_firstname; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_firstname; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="lastname"><em>*</em><?php echo $entry_lastname; ?></label>
		<input
			type="text"
			class="textInput required validateAlpha validateMin val-2"
			size="50"
			maxlength="50"
			required="required"
			tabindex="2"
			id="lastname"
			title="lastname"
			name="lastname"
			value="<?php echo $lastname; ?>"
			data-default-value="<?php echo $text_lastname; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_lastname; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="email"><em>*</em><?php echo $entry_email; ?></label>
		<input
			type="text"
			class="textInput required validateEmail"
			size="50"
			maxlength="50"
			required="required"
			tabindex="3"
			id="email"
			title="email"
			name="email"
			value="<?php echo $email; ?>"
			data-default-value="<?php echo $text_email; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_email; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="telephone"><?php echo $entry_telephone; ?></label>
		<input
			type="text"
			class="textInput validatePhone"
			size="50"
			maxlength="50"
			tabindex="4"
			id="telephone"
			title="telephone"
			name="telephone"
			value="<?php echo $telephone; ?>"
			data-default-value="<?php echo $text_telephone; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_telephone; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="fax"><?php echo $entry_fax; ?></label>
		<input
			type="text"
			class="textInput validatePhone"
			size="50"
			maxlength="50"
			required=""
			tabindex="5"
			id="fax"
			title="fax"
			name="fax"
			value="<?php echo $fax; ?>"
			data-default-value="<?php echo $text_fax; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_fax; ?></p>
	</div>

	</fieldset>
	</form>

	<div class="button_container container_grey">
		<a href="<?php echo $continue; ?>" class="button button_red left"><?php echo $button_cancel; ?></a>
		<a onclick="$('#edit').submit();" class="button button_green right"><?php echo $button_continue; ?></a>
	</div>

</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>