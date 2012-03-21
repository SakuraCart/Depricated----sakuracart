<!doctype html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7 ]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="no-js ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
 Remove this if you use the .htaccess -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css; charset=UTF-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript; charset=UTF-8" />

<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />

<?php if ($description) { ?>
	<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
	<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
	<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>

<!-- (mixi,GREE,Facebook, etc: attachment, communal) -->
<meta property="og:image" content="<?php echo $logo; ?>" />
<!-- (Facebook: sitename, optional) -->
<meta property="og:site_name" content="<?php echo $name; ?>" />
<!-- (Facebook: classification, required) -->
<meta property="og:type" content="article" />
<!-- title -->
<meta property="og:title" content="<?php echo $title; ?>" />
<!-- (Facebook: URL, required) -->
<meta property="og:url" content="<?php echo $home; ?>" />
<!-- (mixi: summary) -->
<meta property="og:description" content="<?php echo $description; ?>" />

<meta name="author" content="<?php echo $name; ?>">
<meta name="robots" content="index,follow" >

<!-- Mobile viewport optimized: j.mp/bplateviewport -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Place favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
<link rel="shortcut icon" href="/favicon.ico">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">
<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>

<link rel="stylesheet" href="<?php echo $theme; ?>/stylesheet/boiler.css" />
<!-- CSS: implied media="all" -->
<!-- <link rel="stylesheet" href="css/style.css?v=2"> -->
<!-- 1140px Grid styles for IE -->
<!--[if lte IE 9]><link rel="stylesheet" href="css/ie.css" type="text/css" media="screen" /><![endif]-->
<!-- The 1140px Grid - http://cssgrid.net/ -->
<link rel="stylesheet" href="<?php echo $theme; ?>/stylesheet/1140.css" type="text/css" media="screen" />

<link rel="stylesheet" href="<?php echo $theme; ?>/stylesheet/layout.css" />
<link rel="stylesheet" href="<?php echo $theme; ?>/stylesheet/stylesheet.css" />
<link rel="stylesheet" href="<?php echo $theme; ?>/stylesheet/buttons.css" />
<link rel="stylesheet" href="<?php echo $theme; ?>/stylesheet/images.css" />
<link rel="stylesheet" href="<?php echo URL_JS; ?>jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<link rel="stylesheet" href="<?php echo URL_JS; ?>libs/colorbox/colorbox.css" media="screen" />
<link rel="stylesheet" href="<?php echo URL_JS; ?>libs/nivo-slider/themes/nivo-slider.css" media="screen" />
<link rel="stylesheet" href="<?php echo URL_JS; ?>libs/nivo-slider/themes/omega/omega.css" media="screen" />
<?php foreach ($styles as $style) { ?>
	<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<![endif]-->
<!-- Uncomment if you are specifically targeting less enabled mobile browsers
<link rel="stylesheet" media="handheld" href="css/handheld.css?v=2">-->

<!-- All JavaScript at the bottom, except for Modernizr which enables HTML5 elements & feature detects -->
<script src="<?php echo URL_JS; ?>libs/modernizr-1.7.min.js"></script>

</head>
<body>
<!-- -------------------------------------------- BEGIN header -------------------------------------------- -->
<header id="header">

	<div class="container row">

		<div class="col4">
			<?php if ($logo) { ?>
				<div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
			<?php } ?>
		</div>

		<div class="col8 last">

			<div class="right">
				<div id="search">
					<img src="<?php echo ICON; ?>16/search.png" alt="search" />
					<?php if ($filter_name) { ?>
						<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" />
					<?php } else { ?>
						<input type="text" name="filter_name" value="<?php echo $text_search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '#ff0000';" />
					<?php } ?>
				</div>
			</div>

			<div class="right">
				<?php if (count($currencies) > 1) { ?>
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
					<div id="currency">
							<?php echo $entry_currency; ?>
						<?php foreach ($currencies as $currency) { ?>
							<?php if ($currency['code'] == $currency_code) { ?>
								<?php if ($currency['symbol_left']) { ?>
									<a title="<?php echo $currency['title']; ?>"><b><?php echo $currency['symbol_left']; ?></b></a>
								<?php } else { ?>
									<a title="<?php echo $currency['title']; ?>"><b><?php echo $currency['symbol_right']; ?></b></a>
								<?php } ?>
							<?php } else { ?>
								<?php if ($currency['symbol_left']) { ?>
									<a title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>').submit(); $(this).parent().parent().submit();"><?php echo $currency['symbol_left']; ?></a>
								<?php } else { ?>
									<a title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>').submit(); $(this).parent().parent().submit();"><?php echo $currency['symbol_right']; ?></a>
								<?php } ?>
							<?php } ?>
						<?php } ?>
						<input type="hidden" name="currency_code" value="" />
						<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
					</div>
				</form>
				<?php } ?>
			</div>

			<div class="right">
				<?php if (count($languages) >= 1) { ?>
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
					<div id="language">
						<?php echo $entry_language; ?>
						<?php foreach ($languages as $language) { ?>
							&nbsp;<img src="<?php echo URL_IMAGE ?>flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" onclick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>').submit(); $(this).parent().parent().submit();" />
						<?php } ?>
						<input type="hidden" name="language_code" value="" />
						<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
					</div>
				</form>
				<?php } ?>
			</div>

			<div class="align_bottom" id="welcome">
				<?php if ($logged) { ?>
<!--
					<a href="<?php echo $home; ?>"><?php echo $text_home; ?></a>
-->
					<a href="<?php echo $wishlist; ?>" id="wishlist_total"><?php echo $text_wishlist; ?></a>
					<a href="<?php echo $readlist; ?>" id="readlist_total"><?php echo $text_readlist; ?></a>
					<a href="<?php echo $compare; ?>" id="compare_total"><?php echo $text_compare; ?></a>
					<a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
					<a href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a>
					<a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
				<?php } elseif ($affiliate_logged) { ?>
					<?php echo $text_welcome_affiliate; ?>
					<a href="<?php echo $affiliate_logout; ?>"><?php echo $text_logout; ?></a>
				<?php } else { ?>
					<?php echo $text_welcome; ?>
				<?php } ?>
			</div>

		</div>
	</div>

	<div class="container row">
		<div class="col12 last">
			<?php echo $content_header; ?>
		</div>
	</div>

</header>

<nav>
	<div class="container row">
		<div class="breadcrumb col12 last">
			<div itemprop="reviews" itemscope itemtype="http://schema.org/WebPage">
				<div itemprop="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
				<?php } ?>
				</div>
			</div>
		</div>
	</div>
</nav>

<div class="container row">
	<div class="col12 last">
		<div id="notification"></div>
	</div>
</div>

<div class="container row">
	<?php echo $content_left; ?>

	<?php
		if ($column == 'None') {
			echo '<div class="col12 last">';
		} elseif ($column == 'L') {
			echo '<div class="col9 last">';
		} elseif ($column == 'R') {
			echo '<div class="col9">';
		} elseif ($column == 'LR') {
			echo '<div class="col6">';
		} else {
			echo '<div class="col6">';
		}
	?>

	<?php //echo $column; ?>