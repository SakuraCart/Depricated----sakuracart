<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>

<div class="uniForm">

<?php if ($shipping_methods) { ?>

<h3><?php echo $text_shipping_method; ?></h3>

	<div class="ctrlHolder">
<table class="">
	<?php foreach ($shipping_methods as $shipping_method) { ?>
	<tr>
		<th scope="col" colspan="3" class="textleft">
			<?php echo $shipping_method['title']; ?>
		</th>
	</tr>
	<?php if (!$shipping_method['error']) { ?>
		<?php foreach ($shipping_method['quote'] as $quote) { ?>
			<tr>
				<td style="width: 1px;">
					<?php if ($quote['code'] == $code || !$code) { ?>
						<?php $code = $quote['code']; ?>
						<input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" checked="checked" />
					<?php } else { ?>
						<input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" />
					<?php } ?>
				</td>
				<td class="textright">
					<label for="<?php echo $quote['code']; ?>"><?php echo $quote['title']; ?></label>
				</td>
				<td class="textright">
					<label for="<?php echo $quote['code']; ?>"><?php echo $quote['text']; ?></label>
				</td>
			</tr>
		<?php } ?>
	<?php } else { ?>
		<tr>
			<td colspan="3">
				<div class="error"><?php echo $shipping_method['error']; ?></div>
			</td>
		</tr>
	<?php } ?>
	<?php } ?>
</table>
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
			tabindex="3"
			id="comment"
			title="comment"
			name="comment"
			value="<?php echo $comment; ?>"
			data-default-value="<?php echo $entry_comment; ?>"
		><?php echo $comment; ?></textarea>
		<p class="formHint"><?php echo $text_hint_comment; ?></p>
	</div>

<div class="button_container container_grey">
	<a id="button-shipping" class="button button_green right"><?php echo $button_continue; ?></a>
</div>

</div>