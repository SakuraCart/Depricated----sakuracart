<?php echo $header; ?>

	<div class="row">
		<div class="col12 last">

<section class="box_content rounded_corners_all border_green">
	<h2 class="box_content rounded_corners_all border_blue gradient_blue">
		<img src="<?php echo ICON; ?>32/news.png" alt="lock" /> <?php echo $heading_title; ?>
	</h2>

	<div id="content">

		<?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
		<?php } ?>
		<?php if ($success) { ?>
			<div class="success"><?php echo $success; ?></div>
		<?php } ?>

		<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">

			<?php if ($articles) { ?>
				<table id="datatable" class="datatable">
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></th>
							<th scope="col" class="textleft"><?php echo $column_image; ?></th>
							<th scope="col" class="textleft"><?php echo $column_name; ?></th>
							<th scope="col" class="center"><?php echo $column_summary; ?></th>
							<th scope="col" class="center"><?php echo $column_headline; ?></th>
							<th scope="col" class="center"><?php echo $column_status; ?></th>
							<th scope="col" class="center"><?php echo $column_action; ?></th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($articles as $article) { ?>
							<tr>
								<td scope="row">
									<?php if ($article['selected']) { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $article['article_id']; ?>" checked="checked" />
									<?php } else { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $article['article_id']; ?>" />
									<?php } ?>
								</td>
								<td scope="row" class="textleft">
									<img src="<?php echo $article['image']; ?>" alt="<?php echo $article['name']; ?>" style="padding: 1px; border: 1px solid #DDDDDD;" />
								</td>
								<td scope="row" class="">
									<?php echo $article['name']; ?>
								</td>
								<td scope="row" class="">
									<?php echo $article['summary']; ?>
								</td>
								<td scope="row" class="">
									<?php echo $article['headline']; ?>
								</td>
								<td scope="row" class="">
									<?php echo $article['status']; ?>
								</td>
								<td scope="row" class="">
									<?php foreach ($article['action'] as $action) { ?>
										[ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
									<?php } ?>
								</td>
							</tr>
						<?php } ?>
					</tbody>
				</table>
			<?php } else { ?>
					<?php echo $text_no_results; ?>
			<?php } ?>


			<div class="button_container container_grey">
				<a onclick="$('#form').submit();" class="button button_red left"><?php echo $button_delete; ?></a>
				<a onclick="location = '<?php echo $insert; ?>';" class="button button_green right"><?php echo $button_insert; ?></a>
				<a onclick="$('#form').attr('action', '<?php echo $copy; ?>'); $('#form').submit();" class="button button_blue right"><?php echo $button_copy; ?></a>
			</div>

		</form>

	</div>
</section>

	</div>
</div>

<?php echo $footer; ?>