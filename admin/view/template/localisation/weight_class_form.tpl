<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/weight.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

				<table id="" class="">
					<thead>
						<tr>
							<th scope="col" class="center"><?php echo $column_title; ?></th>
							<th scope="col" class="center"><?php echo $column_unit; ?></th>
							<th scope="col" class="center"><?php echo $column_value; ?></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td scope="row" class="">
								<?php foreach ($languages as $language) { ?>
									<?php if (isset($error_title[$language['language_id']])) { ?>
										<input type="text" name="weight_class_description[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($weight_class_description[$language['language_id']]) ? $weight_class_description[$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $error_title[$language['language_id']]; ?>" class="input_error" />
									<?php } else { ?>
										<input type="text" name="weight_class_description[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($weight_class_description[$language['language_id']]) ? $weight_class_description[$language['language_id']]['title'] : ''; ?>" />
									<?php } ?>
									<img src="<?php echo URL_IMAGE; ?>flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
								<?php } ?>
							</td>
							<td scope="row" class="">
								<?php foreach ($languages as $language) { ?>
									<?php if (isset($error_unit[$language['language_id']])) { ?>
										<input type="text" name="weight_class_description[<?php echo $language['language_id']; ?>][unit]" value="<?php echo isset($weight_class_description[$language['language_id']]) ? $weight_class_description[$language['language_id']]['unit'] : ''; ?>" placeholder="<?php echo $error_unit[$language['language_id']]; ?>" class="input_error" />
									<?php } else { ?>
										<input type="text" name="weight_class_description[<?php echo $language['language_id']; ?>][unit]" value="<?php echo isset($weight_class_description[$language['language_id']]) ? $weight_class_description[$language['language_id']]['unit'] : ''; ?>" />
									<?php } ?>
									<img src="<?php echo URL_IMAGE; ?>flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
								<?php } ?>
							</td>
							<td scope="row" class="">
								<input type="text" name="value" value="<?php echo $value; ?>" />
								<?php echo $text_value_hint; ?>
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