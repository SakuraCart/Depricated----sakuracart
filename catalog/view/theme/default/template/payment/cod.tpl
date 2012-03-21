<div class="button_container container_grey">
	<a id="button-confirm" class="button button_green right"><?php echo $button_confirm; ?></a>
</div>

<script type="text/javascript"><!--
$('#button-confirm').bind('click', function() {
	$.ajax({
		type: 'GET',
		url: 'index.php?route=payment/cod/confirm',
		success: function() {
			location = '<?php echo $continue; ?>';
		}
	});
});
//--></script>