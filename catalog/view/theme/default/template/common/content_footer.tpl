<!-- -------------------------------------------- BEGIN content_footer -------------------------------------------- -->
<div class="container row">

<?php
$i = 0;
foreach ($modules as $module) {
	if ($i != $module_count - 1) {
?>
		<div class="col3">
			<?php echo $module; ?>
		</div>
	<?php } else if ($i == $module_count - 1) { ?>
		<div class="col3 last">
			<?php echo $module; ?>
		</div>
<?php
	}
	$i++;
}
?>

</div>
<!-- -------------------------------------------- END content_footer -------------------------------------------- -->
