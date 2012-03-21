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

<link rel="stylesheet" type="text/css" href="view/stylesheet/boiler.css" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/1140.css" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/table.css" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/buttons.css" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/uniform/uni-form.css" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/uniform/uniform_style.css" />

<!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if necessary -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script>window.jQuery || document.write("<script src='../js/jquery/jquery-1.7.min.js'>\x3C/script>")</script>
<script type="text/javascript" src="../js/libs/uniform/uni-form-validation.jquery.js"></script>
<script type="text/javascript" src="../js/mylibs/uniform.js"></script>
<script type="text/javascript" src="../js/libs/uniform/localization/<?php echo $this->language->get('code'); ?>.js"></script>

</head>
<body>

<header id="">
	<div class="container row">
		<div class="col12 last">
			<img src="view/image/logo.png" alt="SakuraCart" title="SakuraCart" />
		</div>
	</div>
</header>
