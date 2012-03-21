<?php echo $header; ?>

<div class="container row">
	<div class="col12 last">

<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>


<section class="box_content">
	<h2 class="box_content">
		<?php echo $text_heading_step_3; ?>
	</h2>

<div class="row">
	<div class="col9">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="uniForm">

		<h3 class="box_content">
			<?php echo $text_check_5; ?>
		</h3>

		<div class="ctrlHolder">
			<label class="" for="db_host"><em>*</em><?php echo $entry_db_host; ?></label>
			<input
				type="text"
				class="textInput required validateAlphaNum validateMin val-2"
				size="50"
				maxlength="50"
				required="required"
				tabindex="1"
				id="db_host"
				title="db_host"
				name="db_host"
				value="<?php echo $db_host; ?>"
				data-default-value="<?php echo $text_db_host; ?>"
			/>
			<p class="formHint"><?php echo $text_hint_db_host; ?></p>
		</div>

		<div class="ctrlHolder">
			<label class="" for="db_host"><em>*</em><?php echo $entry_db_user; ?></label>
			<input
				type="text"
				class="textInput required validateAlphaNum validateMin val-2"
				size="50"
				maxlength="50"
				required="required"
				tabindex="2"
				id="db_user"
				title="db_user"
				name="db_user"
				value="<?php echo $db_user; ?>"
				data-default-value="<?php echo $text_db_user; ?>"
			/>
			<p class="formHint"><?php echo $text_hint_db_user; ?></p>
		</div>

		<div class="ctrlHolder">
			<label class="" for="password"><em>*</em><?php echo $entry_db_password; ?></label>
			<input
				type="password"
				class="textInput required validateMin val-4"
				size="50"
				maxlength="50"
				required="required"
				tabindex="3"
				id="db_password"
				title="db_password"
				name="db_password"
				value="<?php echo $db_password; ?>"
				data-default-value="<?php echo $db_password; ?>"
			/>
			<p class="formHint"><?php echo $text_hint_db_password; ?></p>
		</div>

		<div class="ctrlHolder">
			<label class="" for="db_host"><em>*</em><?php echo $entry_db_name; ?></label>
			<input
				type="text"
				class="textInput required validateAlphaNum validateMin val-2"
				size="50"
				maxlength="50"
				required="required"
				tabindex="4"
				id="db_name"
				title="db_name"
				name="db_name"
				value="<?php echo $db_name; ?>"
				data-default-value="<?php echo $text_db_name; ?>"
			/>
			<p class="formHint"><?php echo $text_hint_db_name; ?></p>
		</div>

		<div class="ctrlHolder">
			<label class="" for="db_host"><?php echo $entry_db_prefix; ?></label>
			<input
				type="text"
				class="textInput required validateAlphaNum validateMin val-2"
				size="50"
				maxlength="50"
				tabindex="5"
				id="db_prefix"
				title="db_prefix"
				name="db_prefix"
				value="<?php echo $db_prefix; ?>"
				data-default-value="<?php echo $db_prefix; ?>"
			/>
			<p class="formHint"><?php echo $text_hint_db_prefix; ?></p>
		</div>

		<h3 class="box_content">
			<?php echo $text_check_6; ?>
		</h3>

		<div class="ctrlHolder">
			<label class="" for="firstname"><em>*</em><?php echo $entry_site_username; ?></label>
			<input
				type="text"
				class="textInput required validateAlphaNum validateMin val-2"
				size="50"
				maxlength="50"
				required="required"
				tabindex="6"
				id="username"
				title="username"
				name="username"
				value="<?php echo $username; ?>"
				data-default-value="<?php echo $text_username; ?>"
			/>
			<p class="formHint"><?php echo $text_hint_site_username; ?></p>
		</div>

		<div class="ctrlHolder">
			<label class="" for="password"><em>*</em><?php echo $entry_site_password; ?></label>
			<input
				type="password"
				class="textInput required validateMin val-4"
				size="50"
				maxlength="50"
				required="required"
				tabindex="7"
				id="password"
				title="password"
				name="password"
				value="<?php echo $password; ?>"
				data-default-value=""
			/>
			<p class="formHint"><?php echo $text_hint_site_password; ?></p>
		</div>

		<div class="ctrlHolder">
			<label class="" for="email"><em>*</em><?php echo $entry_site_email; ?></label>
			<input
				type="text"
				class="textInput required validateEmail"
				size="50"
				maxlength="50"
				required="required"
				tabindex="8"
				id="email"
				title="email"
				name="email"
				value="<?php echo $email; ?>"
				data-default-value="<?php echo $text_site_email; ?>"
			/>
			<p class="formHint"><?php echo $text_hint_site_email; ?></p>
		</div>


			<div class="button_container container_grey">
				<a onclick="document.getElementById('form').submit()" class="button button_green right"><?php echo $button_continue; ?></a>
			</div>
		</form>
	</div>

	<div class="col3 last">
		<aside>
			<ul>
				<li>
					<img src="view/image/16/true.png" alt="right" />&nbsp;
					<?php echo $text_license; ?>
				</li>
				<li>
					<img src="view/image/16/true.png" alt="wait" />&nbsp;
					<?php echo $text_pre_install; ?>
				</li>
				<li>
					<img src="view/image/16/right.png" alt="wait" />&nbsp;
					<?php echo $text_configuration; ?>
				</li>
				<li>
					<img src="view/image/16/wait.png" alt="wait" />&nbsp;
					<?php echo $text_finished; ?>
				</li>
			</ul>
		</aside>
	</div>
</div>

</section>

	</div>
</div>

<?php echo $footer; ?>