<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/backup.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>
		<?php if ($success) { ?>
			<div class="success"><?php echo $success; ?></div>
		<?php } ?>

		<form action="<?php echo $restore; ?>" method="post" enctype="multipart/form-data" id="form">

			<table class="">
				<thead>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_restore; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="textleft">
								<input type="file" name="import" />
							</td>
						</tr>
				</tbody>
			</table>

			<div class="button_container container_grey">
				<a onclick="$('#restore').submit();" class="button button_green right"><?php echo $button_restore; ?></a>
			</div>

		</form>


		<form action="<?php echo $backup; ?>" method="post" enctype="multipart/form-data" id="form">

			<table class="">
				<thead>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_backup; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="textleft">
								<div class="scrollbox wide" style="margin-bottom: 5px;">
									<?php $class = 'odd'; ?>
									<?php foreach ($tables as $table) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<div class="<?php echo $class; ?>">
											<input type="checkbox" name="backup[]" value="<?php echo $table; ?>" checked="checked" />
											<?php echo $table; ?>
										</div>
									<?php } ?>
								</div>
								<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
							</td>
						</tr>
				</tbody>
			</table>

			<div class="button_container container_grey">
				<a onclick="$('#backup').submit();" class="button button_green right"><?php echo $button_backup; ?></a>
			</div>

		</form>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>