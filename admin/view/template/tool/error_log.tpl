<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/error.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($success) { ?>
			<div class="success"><?php echo $success; ?></div>
		<?php } ?>

			<table class="">
				<thead>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_log; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="texttop">
								<textarea wrap="off" style="width: 98%; height: 300px; padding: 5px; border: 1px solid #CCCCCC; background: #FFFFFF; overflow: scroll;"><?php echo $log; ?></textarea>
							</td>
						</tr>
				</tbody>
			</table>


			<div class="button_container container_grey">
				<a href="<?php echo $clear; ?>" class="button button_blue right"><?php echo $button_clear; ?></a>
			</div>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>