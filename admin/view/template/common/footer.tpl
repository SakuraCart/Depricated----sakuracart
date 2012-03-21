<nav>
	<div class="container row">
		<div class="breadcrumb col12 last">
			<?php foreach ($breadcrumbs1 as $breadcrumb) { ?>
				<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
			<?php } ?>
		</div>
	</div>
</nav>
<!-- -------------------------------------------- BEGIN footer -------------------------------------------- -->
<footer id="footer">

	<div class="container row">
		<div class="col12 last">
<!--
SakuraCart is open source software and you are free to remove the powered by SakuraCart if you want, but its generally accepted practise to make a small donatation.
Please donate via PayPal to donate@sakuracart.com
//-->
			<div class="center"><?php echo $text_footer; ?></div>

<!-- -------------------------------------------- END footer -------------------------------------------- -->
		</div>
	</div>
</footer>
<!-- CLOSE all html-elements (+wrapper) before this line -->


</body></html>