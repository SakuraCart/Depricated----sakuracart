<?php echo $header; ?>
		<div id="container">

<section class="box_content">
	<h2 class="box_content">
<!-- <img src="<?php echo $title_heading_image; ?>/image/latest.png" alt="" />&nbsp; -->
		<?php echo $heading_title; ?>
	</h2>

	<div id="content">

<?php if ($articles) { ?>

	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="readlist">
<table id="datatable" border="0" cellpadding="0" cellspacing="0" class="datatable">
	<caption>
		<?php echo $text_article_information; ?>
	</caption>
	<thead>
		<tr>
			<th scope="col"><?php echo $column_name; ?></th>
			<th scope="col"><?php echo $column_image; ?></th>
			<th scope="col"><?php echo $column_link; ?></th>
<!--
			<th scope="col"><?php echo $column_model; ?></th>
-->
			<th scope="col"><?php echo $column_description; ?></th>
			<th scope="col"><?php echo $column_view; ?></th>
			<th scope="col"><?php echo $column_remove; ?></th>
		</tr>
	</thead>
	<tbody>
<?php foreach ($articles as $article) { ?>
	<tr>
		<th scope="row">
			<?php echo $article['name']; ?>
		</th>
		<td class="image">
			<?php if ($article['thumb']) { ?>
				<a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>" /></a>
			<?php } ?>
		</td>
		<td class="name">
			<a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a>
		</td>
<!--
		<td class="model">
			<?php echo $article['model']; ?>
		</td>
-->
		<td class="stock">
			<?php echo $article['description']; ?>
		</td>
		<td class="view">
			<a href="<?php echo $article['href']; ?>" class="button button_green"><?php echo $button_view; ?></a>
		</td>
		<td class="remove">
			<input type="checkbox" name="remove[]" value="<?php echo $article['article_id']; ?>" />
		</td>
	</tr>
<?php } ?>
	</tbody>
</table>
	</form>

	<div class="button_container container_grey">
		<a href="<?php echo $continue; ?>" class="button button_blue left"><?php echo $button_continue; ?></a>
		<a onclick="$('#readlist').submit();" class="button button_green right"><?php echo $button_update; ?></a>
	</div>

<?php } else { ?>
		<?php echo $text_empty; ?>
		<div class="button_container container_grey">
			<a href="<?php echo $continue; ?>" class="button button_blue right"><?php echo $button_continue; ?></a>
		</div>
<?php } ?>

		</div>
</section>

<?php if ($content_center) { ?>
	<div id="content">
		<?php echo $content_center; ?>
	</div>
<?php } ?>

<?php echo $footer; ?>