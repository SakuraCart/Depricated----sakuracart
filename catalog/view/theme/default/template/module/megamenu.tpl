<div class="clearfix"></div>
<!-- -------------------------------------------- BEGIN megamenu_product -------------------------------------------- -->
<?php if ($categories) { ?>

<nav id="megamenu">
	<ul>
		<?php foreach ($categories as $category) { ?>
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
</nav>

<?php } ?>
<!-- -------------------------------------------- END megamenu_product -------------------------------------------- -->
<div class="clearfix"></div>
