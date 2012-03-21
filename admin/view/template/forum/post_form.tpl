<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/posts.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

			<table class="">
				<tr>
					<th class="texttop">
						<?php echo $entry_user; ?>
					</th>
					<td>
						<?php if ($error_username) { ?>
							<input type="text" name="username" value="<?php echo $username; ?>" placeholder="<?php echo $error_username; ?>" class="input_error" />
						<?php } else { ?>
							<input type="text" name="username" value="<?php echo $username; ?>" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_thread; ?>
					</th>
					<td>
						<input type="hidden" name="thread_id" value="<?php echo $thread_id; ?>" />
						<?php if ($error_thread) { ?>
							<input type="text" name="thread" value="<?php echo $thread; ?>" placeholder="<?php echo $error_thread; ?>" class="input_error" />
						<?php } else { ?>
							<input type="text" name="thread" value="<?php echo $thread; ?>" />
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_text; ?>
					</th>
					<td>
						<?php if ($error_text) { ?>
							<textarea name="text" cols="60" rows="8" placeholder="<?php echo $error_text; ?>" class="input_error"><?php echo $text; ?></textarea>
						<?php } else { ?>
							<textarea name="text" cols="60" rows="8"><?php echo $text; ?></textarea>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_rating; ?>
					</th>
					<td>
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
						<img src="<?php echo ICON; ?>16/up.png" alt="down" />
						<?php if ($error_rating) { ?>
							<br />
							<br />
							<span class="error"><?php echo $error_rating; ?></span>
						<?php } ?>
					</td>
				</tr>
				<tr>
					<th class="texttop">
						<?php echo $entry_status; ?>
					</th>
					<td>
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
			</table>


<script type="text/javascript"><!--
$('input[name=\'article\']').autocomplete({
	delay: 0,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=article/article/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.article_id
					}
				}));
			}
		});
	},

	select: function(event, ui) {
		$('input[name=\'article\']').val(ui.item.label);
		$('input[name=\'article_id\']').val(ui.item.value);
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