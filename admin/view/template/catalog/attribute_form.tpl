<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/attributes.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_name; ?></th>
						<th scope="col" class="center"><?php echo $column_attribute_group; ?></th>
						<th scope="col" class="center"><?php echo $column_sort_order; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="texttop">
								<?php foreach ($languages as $language) { ?>
									<?php if ($error_name) { ?>
										<input type="text" name="attribute_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($attribute_description[$language['language_id']]) ? $attribute_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $error_name[$language['language_id']]; ?>" class="input_error" size="50" />
										<img src="<?php echo URL_IMAGE; ?>flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
									<?php } else { ?>
										<input type="text" name="attribute_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($attribute_description[$language['language_id']]) ? $attribute_description[$language['language_id']]['name'] : ''; ?>" />
										<img src="<?php echo URL_IMAGE; ?>flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
									<?php } ?>
								<br />
								<?php } ?>
							</td>
							<td class="texttop">
								<select name="attribute_group_id">
									<?php foreach ($attribute_groups as $attribute_group) { ?>
										<?php if ($attribute_group['attribute_group_id'] == $attribute_group_id) { ?>
											<option value="<?php echo $attribute_group['attribute_group_id']; ?>" selected="selected"><?php echo $attribute_group['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $attribute_group['attribute_group_id']; ?>"><?php echo $attribute_group['name']; ?></option>
										<?php } ?>
									<?php } ?>
								</select>
							</td>
							<td>
								<input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="3" />
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