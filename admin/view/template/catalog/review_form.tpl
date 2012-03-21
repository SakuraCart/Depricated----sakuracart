<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/write.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

			<table class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_author; ?></th>
						<th scope="col" class="center"><?php echo $column_product; ?></th>
						<th scope="col" class="center"><?php echo $column_text; ?></th>
						<th scope="col" class="center"><?php echo $column_rating; ?></th>
						<th scope="col" class="center"><?php echo $column_status; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="texttop">
								<?php if ($error_author) { ?>
									<input type="text" name="author" value="<?php echo $author; ?>" placeholder="<?php echo $error_author; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="author" value="<?php echo $author; ?>" />
								<?php } ?>
							</td>
							<td class="texttop">
								<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
								<?php if ($error_product) { ?>
									<input type="text" name="product" value="<?php echo $product; ?>" placeholder="<?php echo $error_product; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="product" value="<?php echo $product; ?>" />
								<?php } ?>
							</td>
							<td class="texttop">
								<?php if ($error_text) { ?>
									<textarea name="text" cols="60" rows="8" placeholder="<?php echo $error_text; ?>" class="input_error"><?php echo $text; ?></textarea>
								<?php } else { ?>
									<textarea name="text" cols="60" rows="8"><?php echo $text; ?></textarea>
								<?php } ?>
							</td>
							<td class="texttop">
								<img src="<?php echo ICON; ?>16/down-grey.png" alt="down" />
								<?php if ($rating == 1) { ?>
									<input type="radio" name="rating" value="1" checked />
								<?php } else { ?>
									<input type="radio" name="rating" value="1" />
								<?php } ?>
								&nbsp;
								<?php if ($rating == 2) { ?>
									<input type="radio" name="rating" value="2" checked />
								<?php } else { ?>
									<input type="radio" name="rating" value="2" />
								<?php } ?>
								&nbsp;
								<?php if ($rating == 3) { ?>
									<input type="radio" name="rating" value="3" checked />
								<?php } else { ?>
									<input type="radio" name="rating" value="3" />
								<?php } ?>
								&nbsp;
								<?php if ($rating == 4) { ?>
									<input type="radio" name="rating" value="4" checked />
								<?php } else { ?>
									<input type="radio" name="rating" value="4" />
								<?php } ?>
								&nbsp;
								<?php if ($rating == 5) { ?>
									<input type="radio" name="rating" value="5" checked />
								<?php } else { ?>
									<input type="radio" name="rating" value="5" />
								<?php } ?>
								<img src="<?php echo ICON; ?>16/up.png" alt="up" />
								<?php if ($error_rating) { ?>
									<br />
									<br />
									<span class="error"><?php echo $error_rating; ?></span>
								<?php } ?>
							</td>
							<td class="texttop">
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


<script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	},

	select: function(event, ui) {
		$('input[name=\'product\']').val(ui.item.label);
		$('input[name=\'product_id\']').val(ui.item.value);
		return false;
	}

});
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