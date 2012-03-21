<?php
class ModelForumPost extends Model {
/*
	public function addPost($thread_id, $data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "post SET user = '" . $this->db->escape($data['name']) . "', customer_id = '" . (int)$this->customer->getId() . "', thread_id = '" . (int)$thread_id . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', rating = '" . (int)$data['rating'] . "', date_added = NOW()");
	}
*/
	public function addPost($data) {
//	public function addPost() {

//print_r($data);
//exit;
/*
		$this->db->query("
INSERT INTO " . DB_PREFIX . "thread
SET
model = '" . $this->db->escape($data['model']) . "',
date_available = '" . $this->db->escape($data['date_available']) . "',
user_id = '" . (int)$data['user_id'] . "',
points = '" . (int)$data['points'] . "',
status = '" . (int)$data['status'] . "',
headline = '" . (int)$data['headline'] . "',
sort_order = '" . (int)$data['sort_order'] . "',
date_added = NOW()");
*/
		$this->db->query("
INSERT INTO " . DB_PREFIX . "post
SET
thread_id = '" . (int)$data['thread_id'] . "',
date_added = NOW()
");

//		$thread_id = $this->db->getLastId();
		$post_id = $this->db->getLastId();
/*
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "thread SET image = '" . $this->db->escape($data['image']) . "' WHERE thread_id = '" . (int)$thread_id . "'");
		}
*/
//		foreach ($data['description'] as $language_id => $value) {
/*
			$this->db->query("
INSERT INTO " . DB_PREFIX . "thread_description
SET
thread_id = '" . (int)$thread_id . "',
language_id = '" . (int)$language_id . "',
name = '" . $this->db->escape($value['name']) . "',
meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "',
meta_description = '" . $this->db->escape($value['meta_description']) . "',
description = '" . $this->db->escape($value['description']) . "'
");
*/
			$this->db->query("
INSERT INTO " . DB_PREFIX . "post_description
SET
post_id = '" . (int)$post_id . "',
language_id = '" . (int)$data['language_id'] . "',
description = '" . $this->db->escape(strip_tags($data['description'])) . "'
");

//		}
/*
		if (isset($data['thread_store'])) {
			foreach ($data['thread_store'] as $user_group_id) {
				$this->db->query("
INSERT INTO " . DB_PREFIX . "thread_to_store
SET
thread_id = '" . (int)$thread_id . "',
user_group_id = '" . (int)$user_group_id . "'
");
			}
		}
*/
/*
		if (isset($data['forum_category'])) {
			foreach ($data['forum_category'] as $category_id) {
				$this->db->query("
INSERT INTO " . DB_PREFIX . "thread_to_category
SET
thread_id = '" . (int)$thread_id . "',
category_id = '" . (int)$category_id . "'
");
			}
		}
*/
		$this->cache->delete('post');
	}

	public function getPostsByThreadId($thread_id, $start = 0, $limit = 20) {
/*
		$query = $this->db->query("SELECT r.post_id, r.user, r.rating, r.text, p.thread_id, pd.name,
p.image, r.date_added FROM " . DB_PREFIX . "post r LEFT JOIN " . DB_PREFIX . "thread p ON (r.thread_id = p.thread_id) LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id) WHERE p.thread_id = '" . (int)$thread_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY r.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);
*/
/*
		$query = $this->db->query("
SELECT
r.post_id, r.user, r.rating, r.text, p.thread_id, pd.title, p.image, r.date_added
FROM " . DB_PREFIX . "post r
LEFT JOIN " . DB_PREFIX . "thread p ON (r.thread_id = p.thread_id)
LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id)
WHERE
p.thread_id = '" . (int)$thread_id . "'
AND p.date_available <= NOW()
AND p.status = '1'
AND r.status = '1'
AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
ORDER BY r.date_added DESC LIMIT " . (int)$start . "," . (int)$limit
);
*/
		$query = $this->db->query("
SELECT *,
p.post_id, p.thread_id, pd.description, p.date_added
FROM " . DB_PREFIX . "post p
LEFT JOIN " . DB_PREFIX . "post_description pd ON (p.post_id = pd.post_id)
WHERE
p.thread_id = '" . (int)$thread_id . "'
ORDER BY p.date_added DESC LIMIT " . (int)$start . "," . (int)$limit
);

		return $query->rows;
	}

	public function getAverageRating($thread_id) {
		$query = $this->db->query("SELECT AVG(rating) AS total FROM " . DB_PREFIX . "post WHERE status = '1' AND thread_id = '" . (int)$thread_id . "' GROUP BY thread_id");

		if (isset($query->row['total'])) {
			return (int)$query->row['total'];
		} else {
			return 0;
		}
	}
/*
	public function getTotalPosts() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "post r LEFT JOIN " . DB_PREFIX . "thread p ON (r.thread_id = p.thread_id) WHERE p.date_available <= NOW() AND p.status = '1' AND r.status = '1'");
		return $query->row['total'];
	}
*/
	public function getPosts($data = array()) {
//		$sql = "SELECT r.post_id, pd.name, r.user, r.rating, r.status, r.date_added FROM " . DB_PREFIX . "post r LEFT JOIN " . DB_PREFIX . "thread_description pd ON (r.thread_id = pd.thread_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
/*
		$sql = "
SELECT r.post_id, pd.name, r.user, r.rating, r.status, r.date_added
FROM " . DB_PREFIX . "post r
LEFT JOIN " . DB_PREFIX . "post_description pd ON (r.post_id = pd.post_id)
WHERE
pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
";
*/
		$sql = "
SELECT p.post_id, pd.name, p.user, p.rating, p.status, p.date_added
FROM " . DB_PREFIX . "post p
LEFT JOIN " . DB_PREFIX . "post_description pd ON (p.post_id = pd.post_id)
WHERE
pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
";

		$sort_data = array(
			'pd.name',
			'p.user',
			'p.rating',
			'p.status',
			'p.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY p.date_added";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalPosts() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "post");
		return $query->row['total'];
	}

	public function getTotalPostsByThreadId($thread_id) {
//		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "post r LEFT JOIN " . DB_PREFIX . "thread p ON (r.thread_id = p.thread_id) LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id) WHERE p.thread_id = '" . (int)$thread_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
/*
		$query = $this->db->query("
SELECT COUNT(*) AS total
FROM " . DB_PREFIX . "post r
LEFT JOIN " . DB_PREFIX . "thread p ON (r.thread_id = p.thread_id)
LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id)
WHERE
p.thread_id = '" . (int)$thread_id . "'
AND p.date_available <= NOW()
AND p.status = '1'
AND r.status = '1'
AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
");
*/
		$query = $this->db->query("
SELECT COUNT(*) AS total
FROM " . DB_PREFIX . "post r
LEFT JOIN " . DB_PREFIX . "thread p ON (r.thread_id = p.thread_id)
LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id)
WHERE
p.thread_id = '" . (int)$thread_id . "'
");

		return $query->row['total'];
	}
}
