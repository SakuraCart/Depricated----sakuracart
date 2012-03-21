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
			<li><a href="<?php echo $account_information; ?>"><?php echo $text_account_information; ?></a></li>
			<li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
			<li><a href="<?php echo $address; ?>"><?php echo $text_address_book; ?></a></li>
			<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
			<li><a href="<?php echo $readlist; ?>"><?php echo $text_readlist; ?></a></li>
		</ul>
	</div>
	<h3><?php echo $text_orders; ?></h3>
	<div class="content">
		<ul>
			<li><a href="<?php echo $order; ?>"><?php echo $text_orders; ?></a></li>
			<li><a href="<?php echo $download; ?>"><?php echo $text_downloads; ?></a></li>
			<li><a href="<?php echo $reward; ?>"><?php echo $text_rewards; ?></a></li>
			<li><a href="<?php echo $return; ?>"><?php echo $text_returns; ?></a></li>
			<li><a href="<?php echo $transaction; ?>"><?php echo $text_transactions; ?></a></li>
		</ul>
	</div>
	<h3><?php echo $text_subscriptions; ?></h3>
	<div class="content">
		<ul>
			<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
		</ul>
	</div>


	<div class="button_container container_grey">
		<a href="<?php echo $continue; ?>" class="button button_blue right"><?php echo $button_home; ?></a>
	</div>

	</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>