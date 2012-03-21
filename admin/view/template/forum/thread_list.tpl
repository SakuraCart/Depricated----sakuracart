<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/threads.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>
		<?php if ($success) { ?>
			<div class="success"><?php echo $success; ?></div>
		<?php } ?>

		<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">

			<?php if ($threads) { ?>
				<table id="datatable" class="datatable">
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" onclick="$('input[title*=\'selected\']').attr('checked', this.checked);" /></th>
							<th scope="col" class="textleft"><?php echo $column_image; ?></th>
							<th scope="col" class="textleft"><?php echo $column_title; ?></th>
							<th scope="col" class="center"><?php echo $column_model; ?></th>
<!--
							<th scope="col" class="center"><?php echo $column_headline; ?></th>
-->
							<th scope="col" class="center"><?php echo $column_status; ?></th>
							<th scope="col" class="center"><?php echo $column_action; ?></th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($threads as $thread) { ?>
							<tr>
								<td scope="row">
									<?php if ($thread['selected']) { ?>
										<input type="checkbox" title="selected[]" value="<?php echo $thread['thread_id']; ?>" checked="checked" />
									<?php } else { ?>
										<input type="checkbox" title="selected[]" value="<?php echo $thread['thread_id']; ?>" />
									<?php } ?>
								</td>
								<td scope="row" class="textleft">
									<img src="<?php echo $thread['image']; ?>" alt="<?php echo $thread['title']; ?>" style="padding: 1px; border: 1px solid #DDDDDD;" />
								</td>
								<td scope="row" class="">
									<?php echo $thread['title']; ?>
								</td>
								<td scope="row" class="">
									<?php echo $thread['model']; ?>
								</td>
<!--
								<td scope="row" class="">
									<?php echo $thread['headline']; ?>
								</td>
-->
								<td scope="row" class="">
									<?php echo $thread['status']; ?>
								</td>
								<td scope="row" class="">
									<?php foreach ($thread['action'] as $action) { ?>
										[ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
									<?php } ?>
								</td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
			<?php } else { ?>
					<?php echo $text_no_results; ?>
			<?php } ?>


			<div class="button_container container_grey">
				<a onclick="$('#form').submit();" class="button button_red left"><?php echo $button_delete; ?></a>
				<a onclick="location = '<?php echo $insert; ?>';" class="button button_green right"><?php echo $button_insert; ?></a>
				<a onclick="$('#form').attr('action', '<?php echo $copy; ?>'); $('#form').submit();" class="button button_blue right"><?php echo $button_copy; ?></a>
			</div>

		</form>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>