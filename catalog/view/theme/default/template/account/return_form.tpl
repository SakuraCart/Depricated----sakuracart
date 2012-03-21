<?php echo $header; ?>

	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>


<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div id="content">

	<?php echo $text_rma_explanation; ?>

	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="return" name="return" class="uniForm">
	<fieldset>

<h3><?php echo $text_contact_information; ?></h3>

	<div class="ctrlHolder">
		<label class="" for="firstname"><em>*</em><?php echo $entry_firstname; ?></label>
		<input
			type="text"
			class="textInput required validateAlpha validateMin val-2"
			size="50"
			maxlength="50"
			required="required"
			tabindex="1"
			id="firstname"
			title="firstname"
			name="firstname"
			value="<?php echo $firstname; ?>"
			data-default-value="<?php echo $text_firstname; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_firstname; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="lastname"><em>*</em><?php echo $entry_lastname; ?></label>
		<input
			type="text"
			class="textInput required validateAlpha validateMin val-2"
			size="50"
			maxlength="50"
			required="required"
			tabindex="2"
			id="lastname"
			title="lastname"
			name="lastname"
			value="<?php echo $lastname; ?>"
			data-default-value="<?php echo $text_lastname; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_lastname; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="email"><em>*</em><?php echo $entry_email; ?></label>
		<input
			type="text"
			class="textInput required validateEmail"
			size="50"
			maxlength="50"
			required="required"
			tabindex="3"
			id="email"
			title="email"
			name="email"
			value="<?php echo $email; ?>"
			data-default-value="<?php echo $text_email; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_email; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="telephone"><?php echo $entry_telephone; ?></label>
		<input
			type="text"
			class="textInput validatePhone"
			size="50"
			maxlength="50"
			tabindex="4"
			id="telephone"
			title="telephone"
			name="telephone"
			value="<?php echo $telephone; ?>"
			data-default-value="<?php echo $text_telephone; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_telephone; ?></p>
	</div>

<h3><?php echo $text_order_information; ?></h3>

	<div class="ctrlHolder">
		<label class="" for="order_id"><em>*</em><?php echo $entry_order_id; ?></label>
		<input
			type="text"
			class="textInput required validatePhrase validateMin val-1"
			size="50"
			maxlength="50"
			required="required"
			tabindex="5"
			id="order_id"
			title="order_id"
			name="order_id"
			value="<?php echo $order_id; ?>"
			data-default-value="<?php echo $text_order_id; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_order_id; ?></p>
	</div>

	<div class="ctrlHolder">
		<label class="" for="date_ordered"><em>*</em><?php echo $entry_date_ordered; ?></label>
		<input
			type="text"
			class="textInput required date"
			size="50"
			maxlength="50"
			required="required"
			tabindex="6"
			id="date_ordered"
			title="date_ordered"
			name="date_ordered"
			value="<?php echo $date_ordered; ?>"
			data-default-value="<?php echo $text_date_ordered; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_order_date; ?></p>
	</div>


	<div id="content" class="box container_grey">
<h3><?php echo $text_product_information; ?></h3>

		<div id="return-product">
			<?php $return_product_row = 0; ?>
			<?php foreach ($return_products as $return_product) { ?>
				<div id="return-product-row<?php echo $return_product_row; ?>">


					<div class="return-product">

	<div class="ctrlHolder">
		<label class="" for="return_product[<?php echo $return_product_row; ?>][name]"><em>*</em><?php echo $entry_product; ?></label>
		<input
			type="text"
			class="textInput required validatePhrase validateMin val-2"
			size="50"
			maxlength="50"
			required="required"
			tabindex="7"
			id="return_product[<?php echo $return_product_row; ?>][name]"
			title="return_product[<?php echo $return_product_row; ?>][name]"
			name="return_product[<?php echo $return_product_row; ?>][name]"
			value="<?php echo $return_product['name']; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_firstname; ?></p>
	</div>

					</div>
					<div class="return-model">

	<div class="ctrlHolder">
		<label class="" for="return_product[<?php echo $return_product_row; ?>][model]"><em>*</em><?php echo $entry_model; ?></label>
		<input
			type="text"
			class="textInput required validatePhrase validateMin val-2"
			size="50"
			maxlength="50"
			required="required"
			tabindex="8"
			id="return_product[<?php echo $return_product_row; ?>][model]"
			title="return_product[<?php echo $return_product_row; ?>][model]"
			name="return_product[<?php echo $return_product_row; ?>][model]"
			value="<?php echo $return_product['model']; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_firstname; ?></p>
	</div>

					</div>
					<div class="return-quantity">

	<div class="ctrlHolder">
		<label class="" for="return_product[<?php echo $return_product_row; ?>][quantity]"><em>*</em><?php echo $entry_quantity; ?></label>
		<input
			type="text"
			class="textInput required validatePhrase validateMin val-1"
			size="50"
			maxlength="50"
			required="required"
			tabindex="9"
			id="return_product[<?php echo $return_product_row; ?>][quantity]"
			title="return_product[<?php echo $return_product_row; ?>][quantity]"
			name="return_product[<?php echo $return_product_row; ?>][quantity]"
			value="<?php echo $return_product['quantity']; ?>"
		/>
		<p class="formHint"><?php echo $text_hint_firstname; ?></p>
	</div>


					</div>
					<div class="return-opened">

	<div class="ctrlHolder">
		<label class=""><em>*</em><?php echo $entry_opened; ?></label>
		<label for="opened<?php echo $return_product_row; ?>">
			<?php if ($return_product['opened']) { ?>
				<input
					type="radio"
					id="opened<?php echo $return_product_row; ?>"
					title="return_product[<?php echo $return_product_row; ?>][opened]"
					name="return_product[<?php echo $return_product_row; ?>][opened]"
					value="1"
					checked="checked"
				/>
			<?php } else { ?>
				<input
					type="radio"
					id="opened<?php echo $return_product_row; ?>"
					title="return_product[<?php echo $return_product_row; ?>][opened]"
					name="return_product[<?php echo $return_product_row; ?>][opened]"
					value="1"
				/>
			<?php } ?>
			<?php echo $text_yes; ?>
		</label>
		<label for="unopened<?php echo $return_product_row; ?>">
			<?php if (!$return_product['opened']) { ?>
				<input
					type="radio"
					id="unopened<?php echo $return_product_row; ?>"
					title="return_product[<?php echo $return_product_row; ?>][opened]"
					name="return_product[<?php echo $return_product_row; ?>][opened]"
					value="0"
					checked="checked"
				/>
			<?php } else { ?>
				<input
					type="radio"
					id="unopened<?php echo $return_product_row; ?>"
					title="return_product[<?php echo $return_product_row; ?>][opened]"
					name="return_product[<?php echo $return_product_row; ?>][opened]"
					value="0"
				/>
			<?php } ?>
			<?php echo $text_no; ?>
		</label>
		<p class="formHint"><?php echo $text_hint_firstname; ?></p>
	</div>

					</div>
					<div class="return-reason">
<h3><?php echo $text_return_reason; ?></h3>

	<div class="ctrlHolder">
		<label class=""><em>*</em><?php echo $entry_reason; ?></label>
		<ul>
		<?php foreach ($return_reasons as $return_reason) { ?>
		<?php if (isset($return_product['return_reason_id']) && $return_reason['return_reason_id'] == $return_product['return_reason_id']) { ?>
			<li>
				<label for="return-reason-id<?php echo $return_product_row; ?><?php echo $return_reason['return_reason_id']; ?>">
				<input
					type="radio"
					id="return-reason-id<?php echo $return_product_row; ?><?php echo $return_reason['return_reason_id']; ?>"
					title="return_product[<?php echo $return_product_row; ?>][return_reason_id]"
					name="return_product[<?php echo $return_product_row; ?>][return_reason_id]"
					value="<?php echo $return_reason['return_reason_id']; ?>"
					checked="checked"
				/>
				<?php echo $return_reason['name']; ?>
				</label>
			</li>
		<?php } else { ?>
			<li>
				<label for="return-reason_id<?php echo $return_product_row; ?><?php echo $return_reason['return_reason_id']; ?>">
				<input
					type="radio"
					id="return-reason-id<?php echo $return_product_row; ?><?php echo $return_reason['return_reason_id']; ?>"
					title="return_product[<?php echo $return_product_row; ?>][return_reason_id]"
					name="return_product[<?php echo $return_product_row; ?>][return_reason_id]"
					value="<?php echo $return_reason['return_reason_id']; ?>"
				/>
				<?php echo $return_reason['name']; ?>
				</label>
			</li>
		<?php } ?>
		<?php } ?>
		</ul>
		<p class="formHint"><?php echo $text_hint_firstname; ?></p>
	</div>

					</div>
					<div class="return-details">

	<div class="ctrlHolder">
		<label class="" for="comment"><em>*</em><?php echo $entry_fault_detail; ?></label>
		<textarea
			class="textInput required validateMin val-10 validateMaxLength val-3000"
			rows="25"
			cols="50"
			id="comment"
			required="required"
			tabindex="9"
			id="return_product[<?php echo $return_product_row; ?>][comment]"
			title="return_product[<?php echo $return_product_row; ?>][comment]"
			name="return_product[<?php echo $return_product_row; ?>][comment]"
			value="<?php echo $return_product['comment']; ?>"
		></textarea>
		<p class="formHint"><?php echo $text_hint_comment; ?></p>
	</div>

					</div>

	<div class="button_container border_white">
		<a onclick="$('#return-product-row<?php echo $return_product_row; ?>').remove();" class="button button_red right"><?php echo $button_remove; ?></a>
	</div>


				</div>
				<?php $return_product_row++; ?>
			<?php } ?>
		</div>
		<div class="clearfix"></div>
	</div>

<!--
	<div class="button_container container_grey">
		<a onclick="addReturnProduct();" class="button button_green right"><?php echo $button_add_product; ?></a>
	</div>
//-->

<h3><?php echo $text_additional; ?></h3>

	<div class="ctrlHolder">
		<label class="" for="comment"><em>*</em><?php echo $entry_comment; ?></label>
		<textarea
			class="textInput required validateMin val-10 validateMaxLength val-3000"
			rows="25"
			cols="50"
			id="comment"
			required="required"
			tabindex="10"
			id="comment"
			title="comment"
			name="comment"
			value="<?php echo $comment; ?>"
		></textarea>
		<p class="formHint"><?php echo $text_hint_comment; ?></p>
	</div>

	</fieldset>

	<div class="button_container container_grey">
		<a href="<?php echo $continue; ?>" class="button button_blue left"><?php echo $button_back; ?></a>
		<a onclick="$('#return').submit();" class="button button_green right"><?php echo $button_continue; ?></a>
	</div>

</form>

<script language="javascript" type="text/javascript">
	var return_product_row = '<?php echo $return_product_row; ?>';
	var entry_product = '<?php echo $entry_product; ?>';
	var entry_model = '<?php echo $entry_model; ?>';
	var entry_quantity = '<?php echo $entry_quantity; ?>';
	var entry_reason = '<?php echo $entry_reason; ?>';
	var entry_opened = '<?php echo $entry_opened; ?>';
	var text_yes = '<?php echo $text_yes; ?>';
	var text_no = '<?php echo $text_no; ?>';
	var entry_fault_detail = '<?php echo $entry_fault_detail; ?>';
	var button_remove = '<?php echo $button_remove; ?>';

	var return_reasons = '<?php echo $return_reasons; ?>';
</script>

</section>


<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>
