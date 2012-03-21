<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/products.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($success) { ?>
			<div class="success"><?php echo $success; ?></div>
		<?php } ?>

		<?php if ($products) { ?>
			<table id="datatable" class="datatable">
				<thead>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_name; ?></th>
						<th scope="col" class="textleft"><?php echo $column_model; ?></th>
						<th scope="col" class="textleft"><?php echo $column_viewed; ?></th>
						<th scope="col" class="textright"><?php echo $column_percent; ?></th>
					</tr>
				</thead>
				<tbody>
					<?php foreach ($products as $product) { ?>
						<tr>
							<td scope="row" class="textleft">
								<?php echo $product['name']; ?>
							</td>
							<td scope="row" class="textleft">
								<?php echo $product['model']; ?>
							</td>
							<td scope="row" class="textleft">
								<?php echo $product['viewed']; ?>
							</td>
							<td scope="row" class="textright">
								<?php echo $product['percent']; ?>
							</td>
						</tr>
					<?php } ?>
				</tbody>
			</table>
		<?php } else { ?>
				<?php echo $text_no_results; ?>
		<?php } ?>

		<div class="button_container container_grey">
			<a onclick="location = '<?php echo $reset; ?>';" class="button button_blue right"><?php echo $button_reset; ?></a>
		</div>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>