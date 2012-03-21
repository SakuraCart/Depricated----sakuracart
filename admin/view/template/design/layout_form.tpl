<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/layout.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

			<table class="">
				<thead>
					<tr>
						<th scope="col" class="textleft"><?php echo $column_name; ?></th>
					</tr>
				</thead>
				<tbody>
						<tr>
							<td class="textleft">
								<?php if ($error_name) { ?>
									<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $error_name; ?>" class="input_error" />
								<?php } else { ?>
									<input type="text" name="name" value="<?php echo $name; ?>" />
								<?php } ?>
							</td>
						</tr>
				</tbody>
			</table>

			<table id="route-row" class="">
				<thead>
					<tr>
						<th scope="col" class="center"><?php echo $column_store; ?></th>
						<th scope="col" class="center"><?php echo $column_route; ?></th>
						<th scope="col" class="center"></th>
					</tr>
				</thead>
				<?php $route_row = 0; ?>
				<?php foreach ($layout_routes as $layout_route) { ?>
				<tbody id="route-row<?php echo $route_row; ?>">
					<tr>
						<td class="center">
							<select name="layout_route[<?php echo $route_row; ?>][store_id]">
								<option value="0"><?php echo $text_default; ?></option>
								<?php foreach ($stores as $store) { ?>
									<?php if ($store['store_id'] == $layout_route['store_id']) { ?>
										<option value="<?php echo $store['store_id']; ?>" selected="selected"><?php echo $store['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
						</td>
						<td class="center">
							<input type="text" name="layout_route[<?php echo $route_row; ?>][route]" value="<?php echo $layout_route['route']; ?>" />
						</td>
						<td class="center">
							<a onclick="$('#route-row<?php echo $route_row; ?>').remove();" class="button button_red"><?php echo $button_subtract; ?></a>
						</td>
					</tr>
				</tbody>
				<?php $route_row++; ?>
				<?php } ?>
				<tfoot>
					<tr>
						<td colspan="2"></td>
						<td class="center"><a onclick="addRoute();" class="button button_green"><?php echo $button_add; ?></a></td>
					</tr>
				</tfoot>
			</table>


<script type="text/javascript"><!--
var route_row = <?php echo $route_row; ?>;

function addRoute() {
	html  = '<tbody id="route-row' + route_row + '">';
	html += '  <tr>';
	html += '    <td class="center"><select name="layout_route[' + route_row + '][store_id]">';
	html += '    <option value="0"><?php echo $text_default; ?></option>';
	<?php foreach ($stores as $store) { ?>
	html += '<option value="<?php echo $store['store_id']; ?>"><?php echo addslashes($store['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="center"><input type="text" name="layout_route[' + route_row + '][route]" value="" /></td>';
	html += '    <td class="center"><a onclick="$(\'#route-row' + route_row + '\').remove();" class="button button_red"><?php echo $button_subtract; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#route-row > tfoot').before(html);
	route_row++;
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