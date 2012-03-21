<?php echo $header; ?>

<div class="container row">
	<div class="col12 last">

<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>


<section class="box_content">
	<h2 class="box_content">
		<?php echo $text_heading_step_1; ?>
	</h2>

<div class="row">
	<div class="col9">
		<div class="box_scroll">
			<?php echo $text_gpl; ?>
		</div>
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
			<div class="box textright">
				<?php echo $text_agree_license; ?>
				<input type="checkbox" name="agree" />
			</div>
			<div class="button_container container_grey">
				<a onclick="document.getElementById('form').submit()" class="button button_green right"><?php echo $button_continue; ?></a>
			</div>
		</form>
	</div>

	<div class="col3 last">
		<aside>
			<ul>
				<li>
					<img src="view/image/16/right.png" alt="right" />&nbsp;
					<?php echo $text_license; ?>
				</li>
				<li>
					<img src="view/image/16/wait.png" alt="wait" />&nbsp;
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