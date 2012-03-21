<div class="button_container">
	<a id="button-confirm" class="button button_green right"><?php echo $confirm; ?></a>
</div>

<script type="text/javascript"><!--
$('#button-confirm').bind('click', function() {
	$.ajax({
		type: 'GET',
		url: 'index.php?route=payment/free_checkout/confirm',
		success: function() {
			location = '<?php echo $continue; ?>';
		}
	});
});
//--></script>