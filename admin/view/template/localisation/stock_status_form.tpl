<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/stock_status.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

			<table id="datatable" class="datatable">
				<thead>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_name; ?></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td scope="row" class="textleft">
								<?php foreach ($languages as $language) { ?>
									<?php if (isset($error_name[$language['language_id']])) { ?>
										<input type="text" size="100" name="stock_status[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($stock_status[$language['language_id']]) ? $stock_status[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $error_name[$language['language_id']]; ?>" class="input_error" />
									<?php } else { ?>
										<input type="text" size="100" name="stock_status[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($stock_status[$language['language_id']]) ? $stock_status[$language['language_id']]['name'] : ''; ?>" />
									<?php } ?>
									<img src="<?php echo URL_IMAGE; ?>flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
								<?php } ?>
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