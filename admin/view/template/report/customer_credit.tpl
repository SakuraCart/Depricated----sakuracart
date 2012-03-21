<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/user_customer.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($customers) { ?>
			<table id="datatable" class="datatable">
				<thead>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_customer; ?></th>
						<th scope="col" class="textleft"><?php echo $column_email; ?></th>
						<th scope="col" class="textleft"><?php echo $column_customer_group; ?></th>
						<th scope="col" class="textright"><?php echo $column_status; ?></th>
						<th scope="col" class="textright"><?php echo $column_total; ?></th>
						<th scope="col" class="textright"><?php echo $column_action; ?></th>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($customers as $customer) { ?>
						<tr>
							<td scope="row" class="textleft">
								<?php echo $customer['customer']; ?>
							</td>
							<td scope="row" class="textleft">
								<?php echo $customer['email']; ?>
							</td>
							<td scope="row" class="textleft">
								<?php echo $customer['customer_group']; ?>
							</td>
							<td scope="row" class="center">
								<?php echo $customer['status']; ?>
							</td>
							<td scope="row" class="textright">
								<?php echo $customer['total']; ?>
							</td>
							<td scope="row" class="textright">
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

		<br />

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>