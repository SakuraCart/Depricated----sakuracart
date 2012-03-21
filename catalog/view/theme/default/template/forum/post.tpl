<?php if ($posts) { ?>
<?php foreach ($posts as $post) { ?>
<div class="content"><b><?php echo $post['user']; ?></b> | <img src="<?php echo ICON; ?>stars/stars-<?php echo $post['rating'] . '.png'; ?>" alt="<?php echo $post['posts']; ?>" /><br />
  <?php echo $post['date_added']; ?><br />
  <br />
  <?php echo $post['text']; ?></div>
<?php } ?>
<div class="pagination"><?php echo $pagination; ?></div>
<?php } else { ?>
<div class="content"><?php echo $text_no_posts; ?></div>
<?php } ?>
