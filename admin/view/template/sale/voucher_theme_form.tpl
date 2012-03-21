<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/voucher_theme.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

				<table id="" class="">
					<thead>
						<tr>
							<th scope="col" class="center"><?php echo $column_name; ?></th>
							<th scope="col" class="center"><?php echo $column_image; ?></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td scope="row" class="texttop">
								<?php foreach ($languages as $language) { ?>
									<?php if (isset($error_name[$language['language_id']])) { ?>
										<input type="text" name="voucher_theme_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($voucher_theme_description[$language['language_id']]) ? $voucher_theme_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $error_name[$language['language_id']]; ?>" class="input_error" />
									<?php } else { ?>
										<input type="text" name="voucher_theme_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($voucher_theme_description[$language['language_id']]) ? $voucher_theme_description[$language['language_id']]['name'] : ''; ?>" />
									<?php } ?>
									<img src="<?php echo URL_IMAGE; ?>flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
								<?php } ?>
							</td>
							<td scope="row" class="texttop">
								<div class="image">
									<img src="<?php echo $thumb; ?>" alt="" id="thumb" />
									<input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
									<br />
									<a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>
									&nbsp;&nbsp;|&nbsp;&nbsp;
									<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a>
								</div>
						</tr>
					</tbody>
				</table>

<script type="text/javascript"><!--
// image manager
var text_image_manager = "<?php echo $text_image_manager; ?>";
var token = "<?php echo $token; ?>";
//--></script>


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