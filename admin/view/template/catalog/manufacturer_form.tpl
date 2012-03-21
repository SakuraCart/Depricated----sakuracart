<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/manufacturer.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_manufacturer; ?></th>
						<th scope="col" class="center"><?php echo $column_store; ?></th>
						<th scope="col" class="center"><?php echo $column_keyword; ?></th>
						<th scope="col" class="center"><?php echo $column_sort_order; ?></th>
						<th scope="col" class="center"><?php echo $column_image; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="texttop">
								<?php if ($error_name) { ?>
									<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $error_name; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="name" value="<?php echo $name; ?>" />
								<?php } ?>
							</td>
							<td class="texttop">
								<div class="scrollbox">
									<?php $class = 'even'; ?>
									<div class="<?php echo $class; ?>">
										<?php if (in_array(0, $manufacturer_store)) { ?>
											<input type="checkbox" name="manufacturer_store[]" value="0" checked="checked" />
											<?php echo $text_default; ?>
										<?php } else { ?>
											<input type="checkbox" name="manufacturer_store[]" value="0" />
											<?php echo $text_default; ?>
										<?php } ?>
									</div>
									<?php foreach ($stores as $store) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<div class="<?php echo $class; ?>">
											<?php if (in_array($store['store_id'], $manufacturer_store)) { ?>
												<input type="checkbox" name="manufacturer_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
												<?php echo $store['name']; ?>
											<?php } else { ?>
												<input type="checkbox" name="manufacturer_store[]" value="<?php echo $store['store_id']; ?>" />
												<?php echo $store['name']; ?>
												<?php } ?>
										</div>
									<?php } ?>
								</div>
							</td>
							<td class="texttop">
								<input type="text" name="keyword" value="<?php echo $keyword; ?>" />
								<?php echo $text_keyword_hint; ?>
							</td>
							<td>
								<input type="text" name="sort_order" value="<?php echo $sort_order; ?>" />
							</td>
							<td class="texttop">
								<div class="image"><img src="<?php echo $thumb; ?>" alt="" id="thumb" />
									<input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
									<br />
									<a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>
									&nbsp;&nbsp;|&nbsp;&nbsp;
									<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a>
								</div>
							</td>
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