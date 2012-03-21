<div>
	<div class="cart-heading"><?php echo $heading_title; ?></div>
	<div class="cart-content" id="reward"><?php echo $entry_reward; ?>&nbsp;
	<input type="text" name="reward" value="<?php echo $reward; ?>" />
	&nbsp;<a id="button-reward" class="button"><span><?php echo $button_reward; ?></a></div>
</div>
	<div class="button_container">
		<a id="button-coupon" class="button button_green right"><?php echo $button_coupon; ?></a>
	</div>

<script language="javascript" type="text/javascript">
	var template_image = '<?php echo $template_image; ?>';
	var button_shipping = '<?php echo $button_shipping; ?>';
	var country_id = '<?php echo $country_id; ?>';
	var zone_id = '&zone_id=<?php echo $zone_id; ?>';
	var url = 'index.php?route=total/shipping/zone&country_id=';
</script>