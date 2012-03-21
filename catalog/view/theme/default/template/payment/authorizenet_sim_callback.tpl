<h1><?php echo $x_response_reason_text; ?></h1>
<?php if($x_response_code == '1') { ?>
<p>Your payment was processed successfully. Here is your receipt:</p>
<pre>
<?php echo $exact_ctr; ?></pre>
<?php if(!empty($exact_issname)) { ?>
<p>Issuer: <?php echo $exact_issname; ?><br/>
	Confirmation Number: <?php echo $exact_issconf; ?> </p>
<?php } ?>

	<div class="button_container">
		<a onclick="location = '<?php echo $confirm; ?>'" class="button button_green right"><?php echo $button_confirm; ?></a>
	</div>


<?php } elseif($_REQUEST['x_response_code'] == '2') { ?>
<p>Your payment failed. Here is your receipt.</p>
<pre>
<?php echo $exact_ctr; ?></pre>

	<div class="button_container">
		<a onclick="location = '<?php echo $back; ?>'" class="button button_green right"><?php echo $button_back; ?></a>
	</div>

<?php } else { ?>
<p>An error occurred while processing your payment. Please try again later.</p>
	<div class="button_container">
		<a onclick="location = '<?php echo $back; ?>'" class="button button_green right"><?php echo $button_back; ?></a>
	</div>
<?php } ?>