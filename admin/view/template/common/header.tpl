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

<?php if ($icon) { ?>
	<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<meta name="robots" content="index,follow" >

<!-- Mobile viewport optimized: j.mp/bplateviewport -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Place favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
<link rel="shortcut icon" href="/favicon.ico">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">
<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>

<!-- -------------------------------------------- CSS -------------------------------------------- -->
<link rel="stylesheet" type="text/css" href="view/stylesheet/boiler.css" />
<!-- CSS: implied media="all" -->
<!-- <link rel="stylesheet" href="css/style.css?v=2"> -->
<!-- 1140px Grid styles for IE -->
<!--[if lte IE 9]><link rel="stylesheet" href="css/ie.css" type="text/css" media="screen" /><![endif]-->
<!-- The 1140px Grid - http://cssgrid.net/ -->
<link rel="stylesheet" type="text/css" href="view/stylesheet/1140.css" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/admin.css" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/buttons.css" />
<link rel="stylesheet" type="text/css" href="view/stylesheet/menu.css" />
<link rel="stylesheet" href="<?php echo URL_JS; ?>jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />

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
<link rel="stylesheet" media="handheld" href="css/handheld.css?v=2">
-->

<!-- -------------------------------------------- JAVASCRIPT! -------------------------------------------- -->
<!-- Modernizr which enables HTML5 elements & feature detects -->
<script src="<?php echo URL_JS; ?>libs/modernizr-1.7.min.js"></script>

<!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if necessary -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.js"></script>
<script>window.jQuery || document.write("<script src='<?php echo URL_JS; ?>jquery/jquery-1.7.min.js'>\x3C/script>")</script>

<!--[if lt IE 7 ]>
<script src="<?php echo URL_JS; ?>/libs/dd_belatedpng.js"></script>
<script>DD_belatedPNG.fix("img, #logo img, .png_bg"); // Fix any <img> or .png_bg bg-images. Also, please read goo.gl/mZiyb </script>
<![endif]-->

<script type="text/javascript" src="<?php echo URL_JS; ?>jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript" src="<?php echo URL_JS; ?>jquery/ui/external/jquery.bgiframe-2.1.2.js"></script>
<script type="text/javascript" src="<?php echo URL_JS; ?>mylibs/tabs.js"></script>
<script type="text/javascript" src="<?php echo URL_JS; ?>libs/superfish/js/superfish.js"></script>
<script type="text/javascript" src="<?php echo URL_JS; ?>admin/common.js"></script>

<!-- scripts concatenated and minified via ant build script-->
<script type="text/javascript" src="<?php echo URL_JS; ?>plugins.js"></script>

<?php foreach ($scripts as $script) { ?>
	<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>

<script language="javascript" type="text/javascript">
	var text_confirm = '<?php echo $text_confirm; ?>';
</script>

</head>

<body>
<!-- -------------------------------------------- BEGIN header -------------------------------------------- -->
<?php if ($logged) { ?>

<header>
	<div id="menu">
		<ul class="left" style="display: none;">
			<li id="dashboard"><a href="<?php echo $home; ?>" class="top"><?php echo $text_dashboard; ?></a></li>

			<li id="extension"><a class="top"><?php echo $text_extension; ?></a>
				<ul>
					<li><a href="<?php echo $module; ?>"><?php echo $text_module; ?></a></li>
					<li><a href="<?php echo $shipping; ?>"><?php echo $text_shipping; ?></a></li>
					<li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
					<li><a href="<?php echo $total; ?>"><?php echo $text_total; ?></a></li>
					<li><a href="<?php echo $feed; ?>"><?php echo $text_feed; ?></a></li>
				</ul>
			</li>

			<li id="catalog"><a class="top"><?php echo $text_catalog; ?></a>
				<ul>
					<li><a href="<?php echo $category; ?>"><?php echo $text_category; ?></a></li>
					<li><a href="<?php echo $product; ?>"><?php echo $text_product; ?></a></li>
					<li><a class="parent"><?php echo $text_attribute; ?></a>
						<ul>
		      <li><a href="<?php echo $attribute; ?>"><?php echo $text_attribute; ?></a></li>
		      <li><a href="<?php echo $attribute_group; ?>"><?php echo $text_attribute_group; ?></a></li>
						</ul>
					</li>
					<li><a href="<?php echo $option; ?>"><?php echo $text_option; ?></a></li>
					<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
					<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
					<li><a href="<?php echo $review; ?>"><?php echo $text_review; ?></a></li>
				</ul>
			</li>

			<li id="catalog"><a class="top"><?php echo $text_site; ?></a>
				<ul>
					<li><a href="<?php echo $article_category; ?>"><?php echo $text_article_category; ?></a></li>
					<li><a href="<?php echo $article; ?>"><?php echo $text_article; ?></a></li>
					<li><a href="<?php echo $author; ?>"><?php echo $text_author; ?></a></li>
					<li><a href="<?php echo $comment; ?>"><?php echo $text_comment; ?></a></li>
					<li><a href="<?php echo $information; ?>"><?php echo $text_information; ?></a></li>
				</ul>
			</li>


			<li id="catalog"><a class="top"><?php echo $text_forum; ?></a>
				<ul>
					<li><a href="<?php echo $forum_category; ?>"><?php echo $text_forum_category; ?></a></li>
					<li><a href="<?php echo $thread; ?>"><?php echo $text_threads; ?></a></li>
					<li><a href="<?php echo $forum_user; ?>"><?php echo $text_user; ?></a></li>
					<li><a href="<?php echo $post; ?>"><?php echo $text_post; ?></a></li>
				</ul>
			</li>


			<li id="sale"><a class="top"><?php echo $text_sale; ?></a>
				<ul>
					<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
					<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
					<li><a class="parent"><?php echo $text_customer; ?></a>
						<ul>
							<li><a href="<?php echo $customer; ?>"><?php echo $text_customer; ?></a></li>
							<li><a href="<?php echo $customer_group; ?>"><?php echo $text_customer_group; ?></a></li>
						</ul>
					</li>
					<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
					<li><a href="<?php echo $coupon; ?>"><?php echo $text_coupon; ?></a></li>
					<li><a class="parent"><?php echo $text_voucher; ?></a>
						<ul>
							<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
							<li><a href="<?php echo $voucher_theme; ?>"><?php echo $text_voucher_theme; ?></a></li>
						</ul>
					</li>
					<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
				</ul>
			</li>
			<li id="system"><a class="top"><?php echo $text_system; ?></a>
				<ul>
					<li><a href="<?php echo $setting; ?>"><?php echo $text_setting; ?></a></li>
					<li><a class="parent"><?php echo $text_design; ?></a>
						<ul>
							<li><a href="<?php echo $layout; ?>"><?php echo $text_layout; ?></a></li>
							<li><a href="<?php echo $banner; ?>"><?php echo $text_banner; ?></a></li>
						</ul>
					</li>
					<li><a class="parent"><?php echo $text_users; ?></a>
						<ul>
							<li><a href="<?php echo $user; ?>"><?php echo $text_user; ?></a></li>
							<li><a href="<?php echo $user_group; ?>"><?php echo $text_user_group; ?></a></li>
						</ul>
					</li>
					<li><a class="parent"><?php echo $text_localisation; ?></a>
						<ul>
							<li><a href="<?php echo $language; ?>"><?php echo $text_language; ?></a></li>
							<li><a href="<?php echo $currency; ?>"><?php echo $text_currency; ?></a></li>
							<li><a href="<?php echo $stock_status; ?>"><?php echo $text_stock_status; ?></a></li>
							<li><a href="<?php echo $order_status; ?>"><?php echo $text_order_status; ?></a></li>
							<li><a class="parent"><?php echo $text_return; ?></a>
								<ul>
									<li><a href="<?php echo $return_status; ?>"><?php echo $text_return_status; ?></a></li>
									<li><a href="<?php echo $return_action; ?>"><?php echo $text_return_action; ?></a></li>
									<li><a href="<?php echo $return_reason; ?>"><?php echo $text_return_reason; ?></a></li>
								</ul>
							</li>
							<li><a href="<?php echo $country; ?>"><?php echo $text_country; ?></a></li>
							<li><a href="<?php echo $zone; ?>"><?php echo $text_zone; ?></a></li>
							<li><a href="<?php echo $geo_zone; ?>"><?php echo $text_geo_zone; ?></a></li>
							<li><a href="<?php echo $tax_class; ?>"><?php echo $text_tax_class; ?></a></li>
							<li><a href="<?php echo $length_class; ?>"><?php echo $text_length_class; ?></a></li>
							<li><a href="<?php echo $weight_class; ?>"><?php echo $text_weight_class; ?></a></li>
						</ul>
					</li>
					<li><a href="<?php echo $error_log; ?>"><?php echo $text_error_log; ?></a></li>
					<li><a href="<?php echo $backup; ?>"><?php echo $text_backup; ?></a></li>
				</ul>
			</li>
			<li id="reports"><a class="top"><?php echo $text_reports; ?></a>
				<ul>
		  <li><a class="parent"><?php echo $text_sale; ?></a>
		    <ul>
		      <li><a href="<?php echo $report_sale_order; ?>"><?php echo $text_report_sale_order; ?></a></li>
		      <li><a href="<?php echo $report_sale_tax; ?>"><?php echo $text_report_sale_tax; ?></a></li>
		      <li><a href="<?php echo $report_sale_shipping; ?>"><?php echo $text_report_sale_shipping; ?></a></li>
		      <li><a href="<?php echo $report_sale_return; ?>"><?php echo $text_report_sale_return; ?></a></li>
		      <li><a href="<?php echo $report_sale_coupon; ?>"><?php echo $text_report_sale_coupon; ?></a></li>
		    </ul>
		  </li>
		  <li><a class="parent"><?php echo $text_product; ?></a>
		    <ul>
		      <li><a href="<?php echo $report_product_viewed; ?>"><?php echo $text_report_product_viewed; ?></a></li>
		      <li><a href="<?php echo $report_product_purchased; ?>"><?php echo $text_report_product_purchased; ?></a></li>
		    </ul>
		  </li>
		  <li><a class="parent"><?php echo $text_customer; ?></a>
		    <ul>
		      <li><a href="<?php echo $report_customer_order; ?>"><?php echo $text_report_customer_order; ?></a></li>
		      <li><a href="<?php echo $report_customer_reward; ?>"><?php echo $text_report_customer_reward; ?></a></li>
		      <li><a href="<?php echo $report_customer_credit; ?>"><?php echo $text_report_customer_credit; ?></a></li>
		    </ul>
		  </li>
		  <li><a class="parent"><?php echo $text_affiliate; ?></a>
		    <ul>
		      <li><a href="<?php echo $report_affiliate_commission; ?>"><?php echo $text_report_affiliate_commission; ?></a></li>
<!--
		      <li><a href="<?php echo $report_affiliate_product; ?>"><?php echo $text_report_affiliate_product; ?></a></li>
-->
		    </ul>
		  </li>
				</ul>
			</li>
			<li id="help"><a class="top"><?php echo $text_help; ?></a>
				<ul>
					<li><a onClick="window.open('http://www.sakuracart.com');"><?php echo $text_sakuracart; ?></a></li>
					<li><a onClick="window.open('http://www.sakuracart.com/index.php?route=documentation/introduction');"><?php echo $text_documentation; ?></a></li>
					<li><a onClick="window.open('http://www.sakuracart.com/forums/');"><?php echo $text_support; ?></a></li>
				</ul>
			</li>
		</ul>
		<ul class="right">
			<li id="store"><a onClick="window.open('<?php echo $store; ?>');" class="top"><?php echo $text_front; ?></a>
				<ul>
					<?php foreach ($stores as $stores) { ?>
					<li><a onClick="window.open('<?php echo $stores['href']; ?>');"><?php echo $stores['name']; ?></a></li>
					<?php } ?>
				</ul>
			</li>
			<li id="store" class="no_border"><a class="top" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
		</ul>
	</div>

<nav>
	<div class="container row">
		<div class="breadcrumb col12 last">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
			<?php } ?>
		</div>
	</div>
</nav>
</header>

<?php } ?>
<!-- -------------------------------------------- END header -------------------------------------------- -->