<!-- -------------------------------------------- BEGIN supermenu -------------------------------------------- -->
<nav class="myMenu">

	<?php if (!$logged) { ?>
		<div class="rootVoice {menu:'home_menu'}">Welcome</div>
	<?php } ?>

	<div class="rootVoice {menu:'empty'}">
		<a href="<?php echo $home; ?>">
			<?php echo $text_home; ?>
		</a>
	</div>

	<?php if ($productCategories) { ?>
		<div class="rootVoice {menu:'menu_products'}">
			<?php echo $text_products; ?>
		</div>
	<?php } ?>

	<?php if ($articleCategories) { ?>
		<div class="rootVoice {menu:'menu_articles'}">
			<?php echo $text_articles; ?>
		</div>
	<?php } ?>

	<?php if ($forumCategories) { ?>
		<div class="rootVoice {menu:'menu_forums'}">
			<?php echo $text_forums; ?>
		</div>
	<?php } ?>

	<?php if ($logged) { ?>
		<div class="rootVoice {menu:'menu_cart'}">
			<?php echo $text_cart; ?>&nbsp;(<?php echo $text_total_items; ?>)
		</div>
	<?php } ?>

</nav>

<!-- menues -->
<div id="home_menu" class="mbmenu boxMenu">
	<?php echo $text_t_1; ?>
	<hr></hr>
	<?php echo $text_t_2; ?>
	<br />
	<br />
	<h2><?php echo $heading_title; ?></h2>
	<p>
		<?php echo $text_welcome; ?>
	</p>
</div>

<div id="menu_cart" class="mbmenu" id="cart">
<?php echo $text_cart; ?>
<br />
<?php echo $text_items; ?>
		<div class="heading">
		<h4><?php echo $text_cart; ?></h4>
		<a><span id="cart_total"></span></a>
	</div>
	<div class="content"></div>
</div>


<div id="menu_products" class="mbmenu boxMenu">
	<table>
		<tr>
			<?php foreach ($productCategories as $category) { ?>
				<td>
					<?php if ($category['thumb']) { ?>
						<a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" title="<?php echo $category['name']; ?>" alt="<?php echo $category['name']; ?>" /></a>
						<br />
					<?php } ?>
					<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
					<hr></hr>
					<?php if ($category['children']) { ?>
						<?php for ($i = 0; $i < count($category['children']);) { ?>
							<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
							<?php for (; $i < $j; $i++) { ?>
								<?php if (isset($category['children'][$i])) { ?>
									<a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
								<?php } ?>
							<?php } ?>
						<?php } ?>
					<?php } ?>
				</td>
			<?php } ?>
		</tr>
	</table>
</div>

<div id="menu_articles" class="mbmenu boxMenu">
	<table>
		<tr>
			<?php foreach ($articleCategories as $category) { ?>
				<td>
					<?php if ($category['thumb']) { ?>
						<a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" title="<?php echo $category['name']; ?>" alt="<?php echo $category['name']; ?>" /></a>
						<br />
					<?php } ?>
					<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
					<hr></hr>
					<?php if ($category['children']) { ?>
						<?php for ($i = 0; $i < count($category['children']);) { ?>
							<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
							<?php for (; $i < $j; $i++) { ?>
								<?php if (isset($category['children'][$i])) { ?>
									<a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
								<?php } ?>
							<?php } ?>
						<?php } ?>
					<?php } ?>
				</td>
			<?php } ?>
		</tr>
	</table>
</div>


<div id="menu_forums" class="mbmenu boxMenu">
	<table>
		<tr>
			<?php foreach ($forumCategories as $category) { ?>
				<td>
					<?php if ($category['thumb']) { ?>
						<a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" title="<?php echo $category['name']; ?>" alt="<?php echo $category['name']; ?>" /></a>
						<br />
					<?php } ?>
					<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
					<hr></hr>
					<?php if ($category['children']) { ?>
						<?php for ($i = 0; $i < count($category['children']);) { ?>
							<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
							<?php for (; $i < $j; $i++) { ?>
								<?php if (isset($category['children'][$i])) { ?>
									<a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
								<?php } ?>
							<?php } ?>
						<?php } ?>
					<?php } ?>
			</td>
		<?php } ?>
	</tr>
</table>
</div>
<!-- -------------------------------------------- END supermenu -------------------------------------------- -->
