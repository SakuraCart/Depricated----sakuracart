<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div id="content">

<?php if ($transactions) { ?>
	<p><?php echo $text_total; ?><b> <?php echo $total; ?></b>.</p>
	<table class="list">
		<thead>
			<tr>
				<td class="left"><?php echo $column_date_added; ?></td>
				<td class="left"><?php echo $column_description; ?></td>
				<td class="right"><?php echo $column_amount; ?></td>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($transactions	as $transaction) { ?>
			<tr>
				<td class="left"><?php echo $transaction['date_added']; ?></td>
				<td class="left"><?php echo $transaction['description']; ?></td>
				<td class="right"><?php echo $transaction['amount']; ?></td>
			</tr>
			<?php } ?>
		</tbody>
	</table>
	<div class="pagination"><?php echo $pagination; ?></div>

<?php } else { ?>
		<?php echo $text_empty; ?>
<?php } ?>


	<div class="button_container container_grey">
		<a href="<?php echo $continue; ?>" class="button button_blue right"><?php echo $button_continue; ?></a>
	</div>

	</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>