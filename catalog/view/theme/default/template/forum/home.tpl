<?php echo $header; ?><?php echo $content_left; ?><?php echo $content_right; ?>
<div id="content"><?php echo $content_center; ?>

<h1 style="display: none;"><?php echo $heading_title; ?></h1>

<?php if ($forumCategories) { ?>
<div id="forum_menu1">
	<ul>
		<?php foreach ($forumCategories as $category) { ?>
		<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
			<?php if ($category['children']) { ?>
			<div>
				<?php for ($i = 0; $i < count($category['children']);) { ?>
				<ul>
					<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
					<?php for (; $i < $j; $i++) { ?>
					<?php if (isset($category['children'][$i])) { ?>
					<li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
					<?php } ?>
					<?php } ?>
				</ul>
				<?php } ?>
			</div>
			<?php } ?>
		</li>
		<?php } ?>
	</ul>
</div>
<?php } ?>


<?php echo $content_footer; ?></div>
<?php echo $footer; ?>