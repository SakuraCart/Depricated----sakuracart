<?php echo $header; ?><?php echo $content_left; ?><?php echo $content_right; ?>
<div id="content"><?php echo $content_center; ?>
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	<h1><?php echo $heading_title; ?></h1>
	<?php if ($members) { ?>
	<p><b><?php echo $text_index; ?></b>
		<?php foreach ($members as $member) { ?>
		&nbsp;&nbsp;&nbsp;<a href="index.php?route=forum/user#<?php echo $member['username']; ?>"><b><?php echo $member['username']; ?></b></a>
		<?php } ?>
	</p>
	<?php foreach ($members as $member) { ?>
	<div class="user-list">
		<div class="user-heading"><?php echo $member['username']; ?><a id="<?php echo $member['username']; ?>"></a></div>
		<div class="user-content">
			<?php if ($member['user']) { ?>
			<?php for ($i = 0; $i < count($member['user']);) { ?>
			<ul>
				<?php $j = $i + ceil(count($member['user']) / 4); ?>
				<?php for (; $i < $j; $i++) { ?>
				<?php if (isset($member['user'][$i])) { ?>
				<li><a href="<?php echo $member['user'][$i]['href']; ?>"><?php echo $member['user'][$i]['username']; ?></a><?php echo $member['user'][$i]['name']; ?></li>
				<?php } ?>
				<?php } ?>
			</ul>
			<?php } ?>
			<?php } ?>
		</div>
	</div>
	<?php } ?>
	<?php } else { ?>
	<div class="content"><?php echo $text_empty; ?></div>
	<div class="buttons">
		<div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
	</div>
	<?php } ?>
	<?php echo $content_footer; ?></div>
<?php echo $footer; ?>