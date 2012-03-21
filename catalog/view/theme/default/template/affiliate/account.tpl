<?php echo $header; ?>

	<?php if ($success) { ?>
		<div class="success"><?php echo $success; ?></div>
	<?php } ?>


<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div id="content">

	<h3><?php echo $text_account; ?></h3>
	<div class="content">
		<ul>
			<li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
			<li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
			<li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
		</ul>
	</div>
	<h3><?php echo $text_tracking; ?></h3>
	<div class="content">
		<ul>
			<li><a href="<?php echo $tracking; ?>"><?php echo $text_tracking; ?></a></li>
		</ul>
	</div>
	<h3><?php echo $text_transactions; ?></h3>
	<div class="content">
		<ul>
			<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
		</ul>
	</div>


	</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>