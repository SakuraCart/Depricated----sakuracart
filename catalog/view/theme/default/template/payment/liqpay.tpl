<form action="<?php echo $action; ?>" method="post" id="payment">
	<input type="hidden" name="operation_xml" value="<?php echo $xml; ?>">
	<input type="hidden" name="signature" value="<?php echo $signature; ?>">

	<div class="button_container">
		<a onclick="$('#payment').submit();" class="button button_green right"><?php echo $button_confirm; ?></a>
	</div>

</form>