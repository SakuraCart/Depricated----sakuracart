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
		<?php if ($success) { ?>
			<div class="success"><?php echo $success; ?></div>
		<?php } ?>

		<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">

			<?php if ($vouchers) { ?>
				<table id="datatable" class="datatable">
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></th>
							<th scope="col" class="textleft"><?php echo $column_code; ?></th>
							<th scope="col" class="center"><?php echo $column_from; ?></th>
							<th scope="col" class="center"><?php echo $column_to; ?></th>
							<th scope="col" class="textleft"><?php echo $column_amount; ?></th>
							<th scope="col" class="center"><?php echo $column_theme; ?></th>
							<th scope="col" class="center"><?php echo $column_status; ?></th>
							<th scope="col" class="center"><?php echo $column_action; ?></th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($vouchers as $voucher) { ?>
							<tr>
								<td scope="row">
									<?php if ($voucher['selected']) { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $voucher['voucher_id']; ?>" checked="checked" />
									<?php } else { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $voucher['voucher_id']; ?>" />
									<?php } ?>
								</td>
								<td scope="row" class="textleft">
									<?php echo $voucher['code']; ?>
								</td>
								<td scope="row" class="">
									<?php echo $voucher['from']; ?>
								</td>
								<td scope="row" class="">
									<?php echo $voucher['to']; ?>
								</td>
								<td scope="row" class="textleft">
									<?php echo $voucher['amount']; ?>
								</td>
								<td scope="row" class="">
									<?php echo $voucher['theme']; ?>
								</td>
								<td scope="row" class="">
									<?php echo $voucher['status']; ?>
								</td>
								<td scope="row" class="">
									[ <a onclick="sendVoucher('<?php echo $voucher['voucher_id']; ?>');"><?php echo $text_send; ?></a> ]
									<?php foreach ($voucher['action'] as $action) { ?>
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


<script type="text/javascript"><!--
function sendVoucher(voucher_id) {
	$.ajax({
		url: 'index.php?route=sale/voucher/send&token=<?php echo $token; ?>&voucher_id=' + voucher_id,
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('.success, .warning').remove();
			$('.box').before('<div class="attention"><img src="view/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('.attention').remove();
		},
		success: function(json) {
			if (json['error']) {
				$('.box').before('<div class="warning">' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('.box').before('<div class="success">' + json['success'] + '</div>');
			}
		}
	});
}
//--></script>


			<div class="button_container container_grey">
				<a onclick="$('#form').submit();" class="button button_red left"><?php echo $button_delete; ?></a>
				<a onclick="location = '<?php echo $insert; ?>';" class="button button_green right"><?php echo $button_insert; ?></a>
			</div>

		</form>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>