<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/user_group.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

			<table id="datatable" class="datatable">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_name; ?></th>
						<th scope="col" class="textleft"><?php echo $column_access; ?></th>
						<th scope="col" class="textleft"><?php echo $column_modify; ?></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td scope="row" class="center">
							<?php if ($error_name) { ?>
								<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $error_name; ?>" class="input_error" />
							<?php } else { ?>
								<input type="text" name="name" value="<?php echo $name; ?>" />
							<?php } ?>
						</td>
						<td scope="row" class="textleft">
							<div class="scrollbox wide">
								<?php $class = 'odd'; ?>
								<?php foreach ($permissions as $permission) { ?>
									<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
									<div class="<?php echo $class; ?>">
										<?php if (in_array($permission, $access)) { ?>
											<input type="checkbox" name="permission[access][]" value="<?php echo $permission; ?>" checked="checked" />
											<?php echo $permission; ?>
										<?php } else { ?>
											<input type="checkbox" name="permission[access][]" value="<?php echo $permission; ?>" />
											<?php echo $permission; ?>
										<?php } ?>
									</div>
								<?php } ?>
							</div>
							<br />
							<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
						</td>
						<td scope="row" class="textleft">
							<div class="scrollbox wide">
								<?php $class = 'odd'; ?>
								<?php foreach ($permissions as $permission) { ?>
									<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
									<div class="<?php echo $class; ?>">
										<?php if (in_array($permission, $modify)) { ?>
											<input type="checkbox" name="permission[modify][]" value="<?php echo $permission; ?>" checked="checked" />
											<?php echo $permission; ?>
										<?php } else { ?>
											<input type="checkbox" name="permission[modify][]" value="<?php echo $permission; ?>" />
											<?php echo $permission; ?>
										<?php } ?>
									</div>
								<?php } ?>
							</div>
							<br />
							<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
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