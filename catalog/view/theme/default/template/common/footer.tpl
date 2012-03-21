	</div>
	<?php echo $content_right; ?>
</div>

<nav>
	<div class="container row">
		<div class="breadcrumb col12 last">
			<?php foreach ($breadcrumbs1 as $breadcrumb) { ?>
				<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
			<?php } ?>
		</div>
	</div>
</nav>

<footer id="footer">

	<?php echo $content_footer; ?>

	<div class="container row">
		<div class="col12 last">
	<!--
SakuraCart is open source software and you are free to remove the powered by SakuraCart if you want, but its generally accepted practise to make a small donatation.
Please donate via PayPal to donate@sakuracart.com
//-->
			<div id="powered"><?php echo $powered; ?></div>

<a href="http://www.w3.org/html/logo/">
<img src="http://www.w3.org/html/logo/badge/html5-badge-h-css3-semantics.png" width="165" height="64" alt="HTML5 Powered with CSS3 / Styling, and Semantics" title="HTML5 Powered with CSS3 / Styling, and Semantics">
</a>
<!-- -------------------------------------------- END footer -------------------------------------------- -->
		</div>
	</div>
</footer>
<!-- CLOSE all html-elements (+wrapper) before this line -->

<!-- -------------------------------------------- JAVASCRIPT! -------------------------------------------- -->

<!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if necessary -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script>window.jQuery || document.write("<script src='<?php echo URL_JS; ?>jquery/jquery-1.7.min.js'>\x3C/script>")</script>

<!--[if lt IE 7 ]>
<script src="<?php echo URL_JS; ?>/libs/dd_belatedpng.js"></script>
<script>DD_belatedPNG.fix("img, #logo img, .png_bg"); // Fix any <img> or .png_bg bg-images. Also, please read goo.gl/mZiyb </script>
<![endif]-->
<script type="text/javascript" src="<?php echo URL_JS; ?>jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript" src="<?php echo URL_JS; ?>jquery/ui/external/jquery.cookie.js"></script>
<script type="text/javascript" src="<?php echo URL_JS; ?>libs/nivo-slider/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript" src="<?php echo URL_JS; ?>libs/colorbox/jquery.colorbox-min.js"></script>
<script type="text/javascript" src="<?php echo URL_JS; ?>mylibs/tabs.js"></script>
<script type="text/javascript" src="<?php echo URL_JS; ?>mylibs/common.js"></script>
<!-- scripts concatenated and minified via ant build script-->
<script src="<?php echo URL_JS; ?>plugins.js"></script>
<script src="<?php echo URL_JS; ?>script.js"></script>
<?php foreach ($scripts as $script) { ?>
	<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>

<?php echo $google_analytics; ?>
<!-- mathiasbynens.be/notes/async-analytics-snippet Change UA-XXXXX-X to be your site's ID -->
<script>
var _gaq=[["_setAccount","UA-XXXXX-X"],["_trackPageview"]];
(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];g.async=1;
g.src=("https:"==location.protocol?"//ssl":"//www")+".google-analytics.com/ga.js";
s.parentNode.insertBefore(g,s)}(document,"script"));
</script>
</body></html>