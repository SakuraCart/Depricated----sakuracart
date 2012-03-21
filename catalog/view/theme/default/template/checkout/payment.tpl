<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>

<div class="uniForm">

<?php if ($payment_methods) { ?>
	<h3><?php echo $text_payment_method; ?></h3>
	<div class="ctrlHolder">
		<ul class="blockLabels">
			<?php foreach ($payment_methods as $payment_method) { ?>
				<li>
					<?php if ($payment_method['code'] == $code || !$code) { ?>
						<label for="<?php echo $payment_method['code']; ?>">
							<?php $code = $payment_method['code']; ?>
							<input
								type="radio"
								id="<?php echo $payment_method['code']; ?>"
								tabindex=""
								title="payment_method"
								name="payment_method"
								checked="checked"
								value="<?php echo $payment_method['code']; ?>"
							>
							<?php echo $payment_method['title']; ?>
						</label>
					<?php } else { ?>
						<label for="<?php echo $payment_method['code']; ?>">
							<input
								type="radio"
								id="<?php echo $payment_method['code']; ?>"
								tabindex=""
								title="payment_method"
								name="payment_method"
								checked=""
								value="<?php echo $payment_method['code']; ?>"
							>
							<?php echo $payment_method['title']; ?>
						</label>
					<?php } ?>
				</li>
			<?php } ?>
		</ul>
		<p class="formHint"><?php echo $text_required; ?></p>
	</div>
<?php } ?>

	<div class="ctrlHolder">
		<label class="" for="comment"><?php echo $entry_comment; ?></label>
		<textarea
			class="textInput validatePhrase validateMin val-10 validateMaxLength val-3000"
			rows="25"
			cols="50"
			id="comment"
			required=""
			tabindex=""
			id="comment"
			title="comment"
			name="comment"
			value="<?php echo $comment; ?>"
			data-default-value="<?php echo $comment; ?>"
		><?php echo $comment; ?></textarea>
		<p class="formHint"><?php echo $text_hint_comment; ?></p>
	</div>

<?php if ($text_agree) { ?>
	<div class="ctrlHolder">
		<label class="" for="agree"><em>*</em><?php echo $text_legal; ?></label>
		<ul class="blockLabels">
			<li>
				<label for="">
					<input
						type="checkbox"
						class="required"
						id="agree"
						required="required"
						tabindex=""
						id="agree"
						title="agree"
						name="agree"
						value="<?php echo $agree; ?>"
						data-default-value="<?php echo $entry_human; ?>"
					>
					<?php echo $text_agree; ?>
				</label>
			</li>
		</ul>
		<p class="formHint"><?php echo $text_required; ?></p>
	</div>

	<div class="button_container container_grey">
		<a id="button-payment" class="button button_green right"><?php echo $button_continue; ?></a>
	</div>

<?php } else { ?>
	<div class="button_container container_grey">
		<a id="button-payment" class="button button_green right"><?php echo $button_continue; ?></a>
	</div>
<?php } ?>

<script type="text/javascript"><!--
$('.fancybox').fancybox({
	width: 560,
	height: 560,
	autoDimensions: false
});
//--></script>

</div>
