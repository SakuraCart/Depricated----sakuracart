<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/tax.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

			<table class="">
				<thead>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_title; ?></th>
						<th scope="col" class="textleft"><?php echo $column_description; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="textleft">
								<?php if ($error_title) { ?>
									<input type="text" name="title" value="<?php echo $title; ?>" placeholder="<?php echo $error_title; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="title" value="<?php echo $title; ?>" />
								<?php } ?>
							</td>
							<td class="textleft">
								<?php if ($error_description) { ?>
									<input type="text" name="description" value="<?php echo $description; ?>" placeholder="<?php echo $error_description; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="description" value="<?php echo $description; ?>" />
								<?php } ?>
							</td>
						</tr>
				</tbody>
			</table>

<br />

			<table id="tax-rule" class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_rate; ?></th>
						<th scope="col" class="center"><?php echo $column_based; ?></th>
						<th scope="col" class="center"><?php echo $column_priority; ?></th>
						<th scope="col" class="center"></th>
					</tr>
				</thead>
				<?php $tax_rule_row = 0; ?>
				<?php foreach ($tax_rules as $tax_rule) { ?>
				<tbody id="tax-rule-row<?php echo $tax_rule_row; ?>">
					<tr>
						<td class="center">
							<select name="tax_rule[<?php echo $tax_rule_row; ?>][tax_rate_id]">
								<?php foreach ($tax_rates as $tax_rate) { ?>
									<?php  if ($tax_rate['tax_rate_id'] == $tax_rule['tax_rate_id']) { ?>
										<option value="<?php echo $tax_rate['tax_rate_id']; ?>" selected="selected"><?php echo $tax_rate['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $tax_rate['tax_rate_id']; ?>"><?php echo $tax_rate['name']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</td>
						<td class="center">
							<select name="tax_rule[<?php echo $tax_rule_row; ?>][based]">
								<?php  if ($tax_rule['based'] == 'shipping') { ?>
									<option value="shipping" selected="selected"><?php echo $text_shipping; ?></option>
								<?php } else { ?>
									<option value="shipping"><?php echo $text_shipping; ?></option>
								<?php } ?>
								<?php  if ($tax_rule['based'] == 'payment') { ?>
									<option value="payment" selected="selected"><?php echo $text_payment; ?></option>
								<?php } else { ?>
									<option value="payment"><?php echo $text_payment; ?></option>
								<?php } ?>
								<?php  if ($tax_rule['based'] == 'store') { ?>
									<option value="store" selected="selected"><?php echo $text_store; ?></option>
								<?php } else { ?>
									<option value="store"><?php echo $text_store; ?></option>
								<?php } ?>
							</select>
						</td>
						<td class="center">
							<input type="text" name="tax_rule[<?php echo $tax_rule_row; ?>][priority]" value="<?php echo $tax_rule['priority']; ?>" size="1" />
						</td>
						<td class="">
							<a onclick="$('#tax-rule-row<?php echo $tax_rule_row; ?>').remove();" class="button button_red"><?php echo $button_subtract; ?></a>
						</td>
					</tr>
				</tbody>
				<?php $tax_rule_row++; ?>
				<?php } ?>
				<tfoot>
					<tr>
						<td colspan="3"></td>
						<td class="center"><a onclick="addRule();" class="button button_green"><?php echo $button_add; ?></a></td>
					</tr>
				</tfoot>
			</table>


<script type="text/javascript"><!--
var tax_rule_row = <?php echo $tax_rule_row; ?>;

function addRule() {
	html  = '<tbody id="tax-rule-row' + tax_rule_row + '">';
	html += '  <tr>';
	html += '    <td class="center"><select name="tax_rule[' + tax_rule_row + '][tax_rate_id]">';
    <?php foreach ($tax_rates as $tax_rate) { ?>
    html += '      <option value="<?php echo $tax_rate['tax_rate_id']; ?>"><?php echo addslashes($tax_rate['name']); ?></option>';
    <?php } ?>
    html += '    </select></td>';
	html += '    <td class="center"><select name="tax_rule[' + tax_rule_row + '][based]">';
    html += '      <option value="shipping"><?php echo $text_shipping; ?></option>';
    html += '      <option value="payment"><?php echo $text_payment; ?></option>';
    html += '      <option value="store"><?php echo $text_store; ?></option>';
    html += '    </select></td>';
	html += '    <td class="center"><input type="text" name="tax_rule[' + tax_rule_row + '][priority]" value="" size="1" /></td>';
	html += '    <td class="center"><a onclick="$(\'#tax-rule-row' + tax_rule_row + '\').remove();" class="button button_red"><?php echo $button_subtract; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	$('#tax-rule > tfoot').before(html);
	tax_rule_row++;
}
//--></script>


			<div class="button_container container_grey">
				<a onclick="location = '<?php echo $cancel; ?>';" class="button button_red left"><?php echo $button_cancel; ?></a>
				<a onclick="$('#form').submit();" class="button button_green right"><?php echo $button_save; ?></a>
			</div>

		</form>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>