<?php if ($comments) { ?>
<?php foreach ($comments as $comment) { ?>
<div class="content"><b><?php echo $comment['author']; ?></b> | <img src="<?php echo ICON; ?>stars/stars-<?php echo $comment['rating'] . '.png'; ?>" alt="<?php echo $comment['comments']; ?>" /><br />
	<?php echo $comment['date_added']; ?><br />
	<br />
	<?php echo $comment['text']; ?></div>
<?php } ?>
<div class="pagination"><?php echo $pagination; ?></div>
<?php } else { ?>
<div class="content"><?php echo $text_no_comments; ?></div>
<?php } ?>
