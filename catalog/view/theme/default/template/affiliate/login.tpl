<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div id="content">

	<?php if ($success) { ?>
		<div class="success"><?php echo $success; ?></div>
	<?php } ?>
	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>

		<div class="content_left">
			<h3><?php echo $text_new_affiliate; ?></h3>
			<div class="content">
				<h4><?php echo $text_register_account; ?></h4>
				<br />
				<?php echo $text_description; ?>
			</div>
			<div class="button_container container_grey">
				<a href="<?php echo $register; ?>" class="button button_green right"><?php echo $button_continue; ?></a>
				<a href="<?php echo $details; ?>" class="button button_blue left"><?php echo $button_detail; ?></a>
			</div>
		</div>

		<div class="content_right">
			<h3><?php echo $text_returning_affiliate; ?></h3>

			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="login" name="login" class="uniForm">
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

			<div class="ctrlHolder">
				<label class="" for="password"><?php echo $entry_password; ?></label>
				<input
					type="password"
					class="textInput required validateAlphaNum validateMin val-4"
					size="50"
					maxlength="50"
					required="required"
					tabindex="2"
					id="password"
					title="password"
					name="password"
					value="<?php echo $text_password; ?>"
					data-default-value="<?php echo $text_password; ?>"
				/>
				<p class="formHint"><?php echo $text_required; ?></p>
			</div>

			</fieldset>
			</form>

			<div class="button_container container_grey">
				<a href="<?php echo $forgotten; ?>" class="button button_blue left"><?php echo $text_forgotten; ?></a>
				<a onclick="$('#login').submit();" class="button button_green right"><?php echo $button_login; ?></a>
			</div>

			<?php if ($redirect) { ?>
				<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
			<?php } ?>

		</div>


	</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>