<!-- -------------------------------------------- BEGIN account -------------------------------------------- -->
<section class="box_<?php echo $box_position; ?>">
	<h2 class="box_<?php echo $box_position; ?>">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div class="box-category">
		<ul>
			<?php if (!$logged) { ?>
				<li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a> / <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
				<li><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></li>
			<?php } ?>
				<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
			<?php if ($logged) { ?>
				<li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
				<li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
			<?php } ?>
			<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
			<li><a href="<?php echo $readlist; ?>"><?php echo $text_readlist; ?></a></li>
			<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
			<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
			<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
			<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
			<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
			<?php if ($logged) { ?>
				<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
			<?php } ?>
		</ul>
	</div>

</section>
<!-- -------------------------------------------- END account -------------------------------------------- -->
