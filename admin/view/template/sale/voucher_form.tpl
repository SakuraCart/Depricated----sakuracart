<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/voucher.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

			<div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a>
				<?php if ($voucher_id) { ?>
					<a href="#tab-history"><?php echo $tab_voucher_history; ?></a>
				<?php } ?>
			</div>


			<div id="tab-general">

				<table class="">
					<tbody>
					<tr>
						<th scope="col" class="">
							<?php echo $entry_code; ?>
						</th>
						<td class="textleft">
							<?php if ($error_code) { ?>
								<input type="text" name="code" value="<?php echo $code; ?>" placeholder="<?php echo $error_code; ?>" class="input_error" />
<!--
								<?php echo $error_code; ?>
-->
							<?php } else { ?>
								<input type="text" name="code" value="<?php echo $code; ?>" />
							<?php } ?>
						</td>
					</tr>
					<tr>
						<th scope="col" class="">
							<?php echo $entry_from_name; ?>
						</th>
						<td class="textleft">
							<?php if ($error_from_name) { ?>
								<input type="text" name="from_name" value="<?php echo $from_name; ?>" placeholder="<?php echo $error_from_name; ?>" class="input_error" />
							<?php } else { ?>
								<input type="text" name="from_name" value="<?php echo $from_name; ?>" />
							<?php } ?>
						</td>
					</tr>
					<tr>
						<th scope="col" class="">
							<?php echo $entry_from_email; ?>
						</th>
						<td class="textleft">
							<?php if ($error_from_email) { ?>
								<input type="text" name="from_email" value="<?php echo $from_email; ?>" placeholder="<?php echo $error_from_email; ?>" class="input_error" />
							<?php } else { ?>
								<input type="text" name="from_email" value="<?php echo $from_email; ?>" />
							<?php } ?>
						</td>
					</tr>
					<tr>
						<th scope="col" class="">
							<?php echo $entry_to_name; ?>
						</th>
						<td class="textleft">
							<?php if ($error_to_name) { ?>
								<input type="text" name="to_name" value="<?php echo $to_name; ?>" placeholder="<?php echo $error_to_name; ?>" class="input_error" />
							<?php } else { ?>
								<input type="text" name="to_name" value="<?php echo $to_name; ?>" />
							<?php } ?>
						</td>
					</tr>
					<tr>
						<th scope="col" class="">
							<?php echo $entry_to_email; ?>
						</th>
						<td class="textleft">
							<?php if ($error_to_email) { ?>
								<input type="text" name="to_email" value="<?php echo $to_email; ?>" placeholder="<?php echo $error_to_email; ?>" class="input_error" />
							<?php } else { ?>
								<input type="text" name="to_email" value="<?php echo $to_email; ?>" />
							<?php } ?>
						</td>
					</tr>
					<tr>
						<th scope="col" class="texttop">
							<?php echo $entry_message; ?>
						</th>
						<td class="textleft">
							<textarea name="message" cols="40" rows="5"><?php echo $message; ?></textarea>
						</td>
					</tr>
					<tr>
						<th scope="col" class="">
							<?php echo $entry_amount; ?>
						</th>
						<td class="textleft">
							<?php if ($error_amount) { ?>
								<input type="text" name="amount" value="<?php echo $amount; ?>" placeholder="<?php echo $error_amount; ?>" class="input_error" />
							<?php } else { ?>
								<input type="text" name="amount" value="<?php echo $amount; ?>" />
							<?php } ?>
						</td>
					</tr>
					<tr>
						<th scope="col" class="">
							<?php echo $entry_theme; ?>
						</th>
						<td class="textleft">
							<select name="voucher_theme_id">
								<?php foreach ($voucher_themes as $voucher_theme) { ?>
									<?php if ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) { ?>
										<option value="<?php echo $voucher_theme['voucher_theme_id']; ?>" selected="selected"><?php echo $voucher_theme['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo $voucher_theme['name']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="col" class="">
							<?php echo $entry_status; ?>
						</th>
						<td class="textleft">
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

			</div>

			<?php if ($voucher_id) { ?>
				<div id="tab-history">
					<div id="history"></div>
				</div>
			<?php } ?>


<?php if ($voucher_id) { ?>
<script type="text/javascript"><!--
$('#history .pagination a').live('click', function() {
	$('#history').load(this.href);
	return false;
});

$('#history').load('index.php?route=sale/voucher/history&token=<?php echo $token; ?>&voucher_id=<?php echo $voucher_id; ?>');
//--></script>
<?php } ?>
<script type="text/javascript"><!--
$('#tabs a').tabs();
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