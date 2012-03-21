<form action="<?php echo $action; ?>" method="post" id="payment">
	<input type="hidden" name="VPSProtocol" value="2.23" />
	<input type="hidden" name="TxType" value="<?php echo $transaction; ?>" />
	<input type="hidden" name="Vendor" value="<?php echo $vendor; ?>" />
	<input type="hidden" name="Crypt" value="<?php echo $crypt; ?>" />

	<div class="button_container">
		<a onclick="$('#payment').submit();" class="button button_green right"><?php echo $button_confirm; ?></a>
	</div>

</form>