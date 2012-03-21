<?php echo $header; ?>


<div class="container row">
	<div class="col12 last">

<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>


<section class="box_content">
	<h2 class="box_content">
		<?php echo $text_heading_step_2; ?>
	</h2>

<div class="row">
	<div class="col9">

		<h3 class="box_content">
			<?php echo $text_check_1; ?>
		</h3>
		<table class="">
			<thead>
				<tr>
					<th scope="col" class="center"><?php echo $column_setting_php; ?></th>
					<th scope="col" class="center"><?php echo $column_setting_current ?></th>
					<th scope="col" class="center"><?php echo $column_setting_required; ?></th>
					<th scope="col" class="center"><?php echo $column_status; ?></th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td class="texttop">
							<?php echo $entry_php_version; ?>
						</td>
						<td class="texttop">
							<?php echo phpversion(); ?>
						</td>
						<td class="texttop">
							5.0+
						</td>
						<td class="texttop">
							<?php echo (phpversion() >= '5.0') ? '<img src="view/image/16/true.png" alt="Good" />' : '<img src="view/image/16/warning.png" alt="Bad" />'; ?>
						</td>
					</tr>
					<tr>
						<td class="texttop">
							<?php echo $entry_register_globals; ?>
						</td>
						<td class="texttop">
							<?php echo (ini_get('register_globals')) ? $text_on : $text_off; ?>
						</td>
						<td class="texttop">
							<?php echo $text_off; ?>
						</td>
						<td class="texttop">
							<?php echo (!ini_get('register_globals')) ? '<img src="view/image/16/true.png" alt="Good" />' : '<img src="view/image/16/warning.png" alt="Bad" />'; ?>
						</td>
					</tr>
					<tr>
						<td class="texttop">
							<?php echo $entry_magic_quotes; ?>
						</td>
						<td class="texttop">
							<?php echo (ini_get('magic_quotes_gpc')) ? $text_on : $text_off; ?>
						</td>
						<td class="texttop">
							<?php echo $text_off; ?>
						</td>
						<td class="texttop">
							<?php echo (!ini_get('magic_quotes_gpc')) ? '<img src="view/image/16/true.png" alt="Good" />' : '<img src="view/image/16/warning.png" alt="Bad" />'; ?>
						</td>
					</tr>
					<tr>
						<td class="texttop">
							<?php echo $entry_file_uploads; ?>
						</td>
						<td class="texttop">
							<?php echo (ini_get('file_uploads')) ? $text_on : $text_off; ?>
						</td>
						<td class="texttop">
							<?php echo $text_on; ?>
						</td>
						<td class="texttop">
							<?php echo (ini_get('file_uploads')) ? '<img src="view/image/16/true.png" alt="Good" />' : '<img src="view/image/16/warning.png" alt="Bad" />'; ?>
						</td>
					</tr>
					<tr>
						<td class="texttop">
							<?php echo $entry_session_auto; ?>
						</td>
						<td class="texttop">
							<?php echo (ini_get('session_auto_start')) ? $text_on : $text_off; ?>
						</td>
						<td class="texttop">
							<?php echo $text_on; ?>
						</td>
						<td class="texttop">
							<?php echo (!ini_get('session_auto_start')) ? '<img src="view/image/16/true.png" alt="Good" />' : '<img src="view/image/16/warning.png" alt="Bad" />'; ?>
						</td>
					</tr>
			</tbody>
		</table>


		<h3 class="box_content">
			<?php echo $text_check_2; ?>
		</h3>
		<table class="">
			<thead>
				<tr>
					<th scope="col" class="center"><?php echo $column_extensions; ?></th>
					<th scope="col" class="center"><?php echo $column_setting_current ?></th>
					<th scope="col" class="center"><?php echo $column_setting_required; ?></th>
					<th scope="col" class="center"><?php echo $column_status; ?></th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td class="texttop">
							<?php echo $entry_mysql; ?>
						</td>
						<td class="texttop">
							<?php echo extension_loaded('mysql') ? $text_on : $text_off; ?>
						</td>
						<td class="texttop">
							<?php echo $text_on; ?>
						</td>
						<td class="texttop">
							<?php echo extension_loaded('mysql') ? '<img src="view/image/16/true.png" alt="Good" />' : '<img src="view/image/16/warning.png" alt="Bad" />'; ?>
						</td>
					</tr>
					<tr>
						<td class="texttop">
							<?php echo $entry_gd; ?>
						</td>
						<td class="texttop">
							<?php echo extension_loaded('gd') ? $text_on : $text_off; ?>
						</td>
						<td class="texttop">
							<?php echo $text_on; ?>
						</td>
						<td class="texttop">
							<?php echo extension_loaded('gd') ? '<img src="view/image/16/true.png" alt="Good" />' : '<img src="view/image/16/warning.png" alt="Bad" />'; ?>
						</td>
					</tr>
					<tr>
						<td class="texttop">
							<?php echo $entry_curl; ?>
						</td>
						<td class="texttop">
							<?php echo extension_loaded('curl') ? $text_on : $text_off; ?>
						</td>
						<td class="texttop">
							<?php echo $text_on; ?>
						</td>
						<td class="texttop">
							<?php echo extension_loaded('curl') ? '<img src="view/image/16/true.png" alt="Good" />' : '<img src="view/image/16/warning.png" alt="Bad" />'; ?>
						</td>
					</tr>
					<tr>
						<td class="texttop">
							<?php echo $entry_zip; ?>
						</td>
						<td class="texttop">
							<?php echo extension_loaded('zlib') ? $text_on : $text_off; ?>
						</td>
						<td class="texttop">
							<?php echo $text_on; ?>
						</td>
						<td class="texttop">
							<?php echo extension_loaded('zlib') ? '<img src="view/image/16/true.png" alt="Good" />' : '<img src="view/image/16/warning.png" alt="Bad" />'; ?>
						</td>
					</tr>
			</tbody>
		</table>


		<h3 class="box_content">
			<?php echo $text_check_3; ?>
		</h3>
		<table class="">
			<thead>
				<tr>
					<th scope="col" class="center"><?php echo $column_files; ?></th>
					<th scope="col" class="center"><?php echo $column_status; ?></th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td class="textleft">
							<?php echo $config_catalog; ?>
						</td>
						<td class="texttop">
							<?php echo is_writable($config_catalog) ? $text_writable : $text_unwritable; ?>
						</td>
					</tr>
					<tr>
						<td class="textleft">
							<?php echo $config_admin; ?>
						</td>
						<td class="texttop">
							<?php echo is_writable($config_admin) ? $text_writable : $text_unwritable; ?>
						</td>
					</tr>
			</tbody>
		</table>


		<h3 class="box_content">
			<?php echo $text_check_4; ?>
		</h3>
		<table class="">
			<thead>
				<tr>
					<th scope="col" class="center"><?php echo $column_directories; ?></th>
					<th scope="col" class="center"><?php echo $column_status; ?></th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td class="textleft">
							<?php echo $cache . '/'; ?>
						</td>
						<td class="texttop">
							<?php echo is_writable($cache) ? $text_writable : $text_unwritable; ?>
						</td>
					</tr>
					<tr>
						<td class="textleft">
							<?php echo $logs . '/'; ?>
						</td>
						<td class="texttop">
							<?php echo is_writable($logs) ? $text_writable : $text_unwritable; ?>
						</td>
					</tr>
					<tr>
						<td class="textleft">
							<?php echo $image . '/'; ?>
						</td>
						<td class="texttop">
							<?php echo is_writable($image) ? $text_writable : $text_unwritable; ?>
						</td>
					</tr>
					<tr>
						<td class="textleft">
							<?php echo $image_cache . '/'; ?>
						</td>
						<td class="texttop">
							<?php echo is_writable($image_cache) ? $text_writable : $text_unwritable; ?>
						</td>
					</tr>
					<tr>
						<td class="textleft">
							<?php echo $image_data . '/'; ?>
						</td>
						<td class="texttop">
							<?php echo is_writable($image_data) ? $text_writable : $text_unwritable; ?>
						</td>
					</tr>
					<tr>
						<td class="textleft">
							<?php echo $download . '/'; ?>
						</td>
						<td class="texttop">
							<?php echo is_writable($download) ? $text_writable : $text_unwritable; ?>
						</td>
					</tr>
			</tbody>
		</table>

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
			<div class="button_container container_grey">
				<a onclick="document.getElementById('form').submit()" class="button button_green right"><?php echo $button_continue; ?></a>
			</div>
		</form>
	</div>


	<div class="col3 last">
		<aside>
			<ul>
				<li>
					<img src="view/image/16/true.png" alt="right" />&nbsp;
					<?php echo $text_license; ?>
				</li>
				<li>
					<img src="view/image/16/right.png" alt="wait" />&nbsp;
					<?php echo $text_pre_install; ?>
				</li>
				<li>
					<img src="view/image/16/wait.png" alt="wait" />&nbsp;
					<?php echo $text_configuration; ?>
				</li>
				<li>
					<img src="view/image/16/wait.png" alt="wait" />&nbsp;
					<?php echo $text_finished; ?>
				</li>
			</ul>
		</aside>
	</div>
</div>


</section>

	</div>
</div>

<?php echo $footer; ?>