<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div id="content">
<?php if ($rewards) { ?>

	<p><?php echo $text_total; ?><b> <?php echo $total; ?></b>.</p>
	<table class="list">
		<thead>
			<tr>
				<td class="left"><?php echo $column_date_added; ?></td>
				<td class="left"><?php echo $column_description; ?></td>
				<td class="right"><?php echo $column_points; ?></td>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($rewards as $reward) { ?>
			<tr>
				<td class="left"><?php echo $reward['date_added']; ?></td>
				<td class="left"><?php if ($reward['order_id']) { ?>
					<a href="<?php echo $reward['href']; ?>"><?php echo $reward['description']; ?></a>
					<?php } else { ?>
					<?php echo $reward['description']; ?>
					<?php } ?></td>
				<td class="right"><?php echo $reward['points']; ?></td>
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