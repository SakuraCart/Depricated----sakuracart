<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/user_customer.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>
		<?php if ($success) { ?>
			<div class="success"><?php echo $success; ?></div>
		<?php } ?>

		<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">

			<?php if ($customers) { ?>
				<table id="datatable" class="datatable">
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></th>
							<th scope="col" class="textleft"><?php echo $column_name; ?></th>
							<th scope="col" class="center"><?php echo $column_email; ?></th>
							<th scope="col" class="center"><?php echo $column_customer_group; ?></th>
							<th scope="col" class="center"><?php echo $column_approved; ?></th>
							<th scope="col" class="center"><?php echo $column_ip; ?></th>
							<th scope="col" class="center"><?php echo $column_date_added; ?></th>
							<th scope="col" class="center"><?php echo $column_status; ?></th>
							<th scope="col" class="center"><?php echo $column_login; ?></th>
							<th scope="col" class="center"><?php echo $column_action; ?></th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($customers as $customer) { ?>
							<tr>
								<td scope="row">
									<?php if ($customer['selected']) { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $customer['customer_id']; ?>" checked="checked" />
									<?php } else { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $customer['customer_id']; ?>" />
									<?php } ?>
								</td>
								<td scope="row" class="textleft">
									<?php echo $customer['name']; ?>
								</td>
								<td scope="row" class="textleft">
									<?php echo $customer['email']; ?>
								</td>
								<td scope="row" class="textleft">
									<?php echo $customer['customer_group']; ?>
								</td>
								<td scope="row" class="textleft">
									<?php echo $customer['approved']; ?>
								</td>
								<td scope="row" class="textleft">
									<?php echo $customer['ip']; ?>
								</td>
								<td scope="row" class="">
									<?php echo $customer['date_added']; ?>
								</td>
								<td scope="row" class="">
									<?php echo $customer['status']; ?>
								</td>
								<td scope="row" class="">
									<select onchange="((this.value !== '') ? window.open('index.php?route=sale/customer/login&token=<?php echo $token; ?>&customer_id=<?php echo $customer['customer_id']; ?>&store_id=' + this.value) : null); this.value = '';">
										<option value=""><?php echo $text_select; ?></option>
										<option value="0"><?php echo $text_default; ?></option>
										<?php foreach ($stores as $store) { ?>
											<option value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
										<?php } ?>
									</select>
								</td>
								<td scope="row" class="">
									<?php foreach ($customer['action'] as $action) { ?>
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
			</div>

		</form>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>