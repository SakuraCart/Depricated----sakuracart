<?php echo $header; ?>

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div id="content">


	<div class="checkout">
		<div id="checkout">
			<div class="checkout-heading"><?php echo $text_checkout_option; ?></div>
			<div class="checkout-content"></div>
		</div>
		<?php if (!$logged) { ?>
		<div id="payment-address">
			<div class="checkout-heading"><span><?php echo $text_checkout_account; ?></span></div>
			<div class="checkout-content"></div>
		</div>
		<?php } else { ?>
		<div id="payment-address">
			<div class="checkout-heading"><span><?php echo $text_checkout_payment_address; ?></span></div>
			<div class="checkout-content"></div>
		</div>
		<?php } ?>
		<?php if ($shipping_required) { ?>
		<div id="shipping-address">
			<div class="checkout-heading"><?php echo $text_checkout_shipping_address; ?></div>
			<div class="checkout-content"></div>
		</div>
		<div id="shipping-method">
			<div class="checkout-heading"><?php echo $text_checkout_shipping_method; ?></div>
			<div class="checkout-content"></div>
		</div>
		<?php } ?>
		<div id="payment-method">
			<div class="checkout-heading"><?php echo $text_checkout_payment_method; ?></div>
			<div class="checkout-content"></div>
		</div>
		<div id="confirm">
			<div class="checkout-heading"><?php echo $text_checkout_confirm; ?></div>
			<div class="checkout-content"></div>
		</div>
	</div>

<script language="javascript" type="text/javascript">
	var template_image = '<?php echo $template_image; ?>';
	var text_modify = '<?php echo $text_modify; ?>';
	var text_checkout_account = '<?php echo $text_checkout_account; ?>';
	var text_checkout_payment_address = '<?php echo $text_checkout_payment_address; ?>';
	var logged = '<?php echo $logged; ?>';
	var shipping_required = '<?php echo $shipping_required; ?>';
</script>

	</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>
