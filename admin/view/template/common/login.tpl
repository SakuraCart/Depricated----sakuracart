<?php echo $header; ?>

<div class="container row">
<div class="col3"></div>
<div class="col6">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/lock.png" alt="lock" /> <?php echo $text_login; ?>
	</h2>

	<div id="content">

		<?php if ($success) { ?>
			<div class="success"><?php echo $success; ?></div>
		<?php } ?>
		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" name="form" class="uniForm">
		<fieldset>
		<div class="ctrlHolder">
			<label class="" for="firstname"><?php echo $entry_username; ?></label>
				<input
				type="text"
				class="textInput required validateAlpha validateMin val-2"
				size="50"
				maxlength="50"
				required="required"
				tabindex="1"
				id="username"
				title="username"
				name="username"
				value="<?php echo $username; ?>"
				data-default-value="<?php echo $username; ?>"
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
			<a onclick="$('#form').submit();" class="button button_green right"><?php echo $button_login; ?></a>
			<a href="<?php echo $forgotten; ?>" class="button button_blue left"><?php echo $text_forgotten; ?></a>
		</div>


		<?php if ($redirect) { ?>
			<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
		<?php } ?>

	</div>

</section>

</div>
<div class="col3 last"></div>
</div>

<?php echo $footer; ?>