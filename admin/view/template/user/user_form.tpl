<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/user_admin.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

			<table class="">
				<tbody>
						<tr>
							<th class="texttop">
								<?php echo $entry_username; ?>
							</th>
							<td class="textleft">
								<?php if ($error_username) { ?>
									<input type="text" name="username" value="<?php echo $username; ?>" placeholder="<?php echo $error_username; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="username" value="<?php echo $username; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_firstname; ?>
							</th>
							<td class="textleft">
								<?php if ($error_firstname) { ?>
									<input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $error_firstname; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="firstname" value="<?php echo $firstname; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_lastname; ?>
							</th>
							<td class="textleft">
								<?php if ($error_lastname) { ?>
									<input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $error_lastname; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="lastname" value="<?php echo $lastname; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_email; ?>
							</th>
							<td class="textleft">
								<input type="text" name="email" value="<?php echo $email; ?>" />
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_user_group; ?>
							</th>
							<td class="textleft">
								<select name="user_group_id">
									<?php foreach ($user_groups as $user_group) { ?>
										<?php if ($user_group['user_group_id'] == $user_group_id) { ?>
											<option value="<?php echo $user_group['user_group_id']; ?>" selected="selected"><?php echo $user_group['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $user_group['user_group_id']; ?>"><?php echo $user_group['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_password; ?>
							</th>
							<td class="textleft">
								<?php if ($error_password) { ?>
									<input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $error_password; ?>" class="input_error" />
								<?php } else { ?>
									<input type="password" name="password" value="<?php echo $password; ?>" />
								<?php } ?>
							</td>
						<tr>
						</tr>
							<th class="texttop">
								<?php echo $entry_confirm; ?>
							</th>
							<td class="textleft">
								<?php if ($error_confirm) { ?>
									<input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $error_confirm; ?>" class="input_error" />
								<?php } else { ?>
									<input type="password" name="confirm" value="<?php echo $confirm; ?>" />
								<?php } ?>
							</td>
						</tr>
						<tr>
							<th class="texttop">
								<?php echo $entry_status; ?>
							</th>
							<td class="textleft">
								<select name="status">
									<?php if ($status) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>
							</td>
						</tr>
				</tbody>
			</table>


			<div class="button_container container_grey">
				<a onclick="location = '<?php echo $cancel; ?>';" class="button button_red left"><?php echo $button_cancel; ?></a>
				<a onclick="$('#form').submit();" class="button button_green right"><?php echo $button_save; ?></a>
			</div>

		</form>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>