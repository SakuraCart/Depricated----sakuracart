<?php
class ModelForumthread extends Model {

	public function updateViewed($thread_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "thread SET viewed = (viewed + 1) WHERE thread_id = '" . (int)$thread_id . "'");
	}

/*
	public function addThread($thread_id, $data) {
		$this->db->query("
INSERT INTO " . DB_PREFIX . "thread
SET
user = '" . $this->db->escape($data['name']) . "',
customer_id = '" . (int)$this->customer->getId() . "',
thread_id = '" . (int)$thread_id . "',
text = '" . $this->db->escape(strip_tags($data['text'])) . "',
rating = '" . (int)$data['rating'] . "',
date_added = NOW()
");
		$this->db->query("
INSERT INTO " . DB_PREFIX . "thread
SET
title = '" . $this->db->escape($data['title']) . "',
thread_id = '" . (int)$thread_id . "',
text = '" . $this->db->escape(strip_tags($data['text'])) . "',
date_added = NOW()
");
	}
*/

//	public function addThread($thread_id, $data) }
	public function addThread($data) {
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
thread_id = '" . (int)$thread_id . "',
*/
		$this->db->query("
INSERT INTO " . DB_PREFIX . "thread
SET
date_added = NOW()
");

		$thread_id = $this->db->getLastId();
/*
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "thread SET image = '" . $this->db->escape($data['image']) . "' WHERE thread_id = '" . (int)$thread_id . "'");
		}
*/
//		foreach ($data['thread_description'] as $language_id => $value) {
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
INSERT INTO " . DB_PREFIX . "thread_description
SET
thread_id = '" . (int)$thread_id . "',
language_id = '" . (int)$data['language_id'] . "',
title = '" . $this->db->escape($data['title']) . "',
description = '" . $this->db->escape(strip_tags($data['description'])) . "'
");

//		}

//		if (isset($data['thread_store'])) {
//			foreach ($data['thread_store'] as $user_group_id) {
				$this->db->query("
INSERT INTO " . DB_PREFIX . "thread_to_store
SET
thread_id = '" . (int)$thread_id . "',
user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'
");
//			}
//		}
/*
		if (isset($data['forum_category'])) {
			foreach ($data['forum_category'] as $category_id) {
*/
				$this->db->query("
INSERT INTO " . DB_PREFIX . "thread_to_category
SET
thread_id = '" . (int)$thread_id . "',
category_id = '" . (int)$data['category_id'] . "'
");
/*
			}
		}
*/
/*
		if (isset($data['thread_image'])) {
			foreach ($data['thread_image'] as $image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_image SET thread_id = '" . (int)$thread_id . "', image = '" . $this->db->escape($image) . "'");
			}
		}

		if (isset($data['thread_download'])) {
			foreach ($data['thread_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "post_to_download SET thread_id = '" . (int)$thread_id . "', download_id = '" . (int)$download_id . "'");
			}
		}
		if (isset($data['thread_related'])) {
			foreach ($data['thread_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "thread_related WHERE thread_id = '" . (int)$thread_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_related SET thread_id = '" . (int)$thread_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "thread_related WHERE thread_id = '" . (int)$related_id . "' AND related_id = '" . (int)$thread_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_related SET thread_id = '" . (int)$related_id . "', related_id = '" . (int)$thread_id . "'");
			}
		}

		if (isset($data['thread_reward'])) {
			foreach ($data['thread_reward'] as $customer_group_id => $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_reward SET thread_id = '" . (int)$thread_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$value['points'] . "'");
			}
		}

		if (isset($data['thread_layout'])) {
			foreach ($data['thread_layout'] as $user_group_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "thread_to_layout SET thread_id = '" . (int)$thread_id . "', user_group_id = '" . (int)$user_group_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}

		foreach ($data['thread_tag'] as $language_id => $value) {
			if ($value) {
				$tags = explode(',', $value);

				foreach ($tags as $tag) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "thread_tag SET thread_id = '" . (int)$thread_id . "', language_id = '" . (int)$language_id . "', tag = '" . $this->db->escape(trim($tag)) . "'");
				}
			}
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'thread_id=" . (int)$thread_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
*/


		$this->cache->delete('thread');
	}

	public function getThread($thread_id) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

//		$query = $this->db->query("SELECT DISTINCT *, pd.name AS name, p.image, m.name AS user, (SELECT price FROM " . DB_PREFIX . "thread_discount pd2 WHERE pd2.thread_id = p.thread_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "thread_headline ps WHERE ps.thread_id = p.thread_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS headline, (SELECT points FROM " . DB_PREFIX . "thread_reward pr WHERE pr.thread_id = p.thread_id AND customer_group_id = '" . (int)$customer_group_id . "') AS reward, (SELECT ss.name FROM " . DB_PREFIX . "thread_status ss WHERE ss.thread_status_id = p.thread_status_id AND ss.language_id = '" . (int)$this->config->get('config_language_id') . "') AS thread_status, (SELECT wcd.unit FROM " . DB_PREFIX . "weight_class_description wcd WHERE p.weight_class_id = wcd.weight_class_id AND wcd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS weight_class, (SELECT lcd.unit FROM " . DB_PREFIX . "length_class_description lcd WHERE p.length_class_id = lcd.length_class_id AND lcd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS length_class, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "post r1 WHERE r1.thread_id = p.thread_id AND r1.status = '1' GROUP BY r1.thread_id) AS rating, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "post r2 WHERE r2.thread_id = p.thread_id AND r2.status = '1' GROUP BY r2.thread_id) AS posts FROM " . DB_PREFIX . "thread p LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id) LEFT JOIN " . DB_PREFIX . "thread_to_store p2s ON (p.thread_id = p2s.thread_id) LEFT JOIN " . DB_PREFIX . "user m ON (p.user_id = m.user_id) WHERE p.thread_id = '" . (int)$thread_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'");
/*
(SELECT price FROM
" . DB_PREFIX . "thread_discount pd2
WHERE pd2.thread_id = p.thread_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "'
AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW())
AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC,
pd2.price ASC LIMIT 1) AS discount,


		$query = $this->db->query("
SELECT DISTINCT *, pd.name AS name, p.image, m.name AS user,
(SELECT points FROM " . DB_PREFIX . "thread_reward pr WHERE pr.thread_id = p.thread_id AND customer_group_id = '" . (int)$customer_group_id . "') AS reward,
(SELECT AVG(rating) AS total FROM " . DB_PREFIX . "post r1 WHERE r1.thread_id = p.thread_id AND r1.status = '1' GROUP BY r1.thread_id) AS rating,
(SELECT COUNT(*) AS total FROM " . DB_PREFIX . "post r2 WHERE r2.thread_id = p.thread_id AND r2.status = '1' GROUP BY r2.thread_id) AS posts
FROM " . DB_PREFIX . "thread p
LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id)
LEFT JOIN " . DB_PREFIX . "thread_to_store p2s ON (p.thread_id = p2s.thread_id)
LEFT JOIN " . DB_PREFIX . "user m ON (p.user_id = m.user_id) WHERE p.thread_id = '" . (int)$thread_id . "'
AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1'
AND p.date_available <= NOW()
AND p2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'
");
*/
		$query = $this->db->query("
SELECT DISTINCT *, pd.title AS title, p.image, m.username AS user,
(SELECT points FROM " . DB_PREFIX . "thread_reward pr WHERE pr.thread_id = p.thread_id AND customer_group_id = '" . (int)$customer_group_id . "') AS reward,
(SELECT AVG(rating) AS total FROM " . DB_PREFIX . "post r1 WHERE r1.thread_id = p.thread_id AND r1.status = '1' GROUP BY r1.thread_id) AS rating,
(SELECT COUNT(*) AS total FROM " . DB_PREFIX . "post r2 WHERE r2.thread_id = p.thread_id AND r2.status = '1' GROUP BY r2.thread_id) AS posts
FROM " . DB_PREFIX . "thread p
LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id)
LEFT JOIN " . DB_PREFIX . "thread_to_store p2s ON (p.thread_id = p2s.thread_id)
LEFT JOIN " . DB_PREFIX . "user m ON (p.user_id = m.user_id) WHERE p.thread_id = '" . (int)$thread_id . "'
AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1'
AND p.date_available <= NOW()
");

		if ($query->num_rows) {
			return array(
				'thread_id'       => $query->row['thread_id'],
				'title'             => $query->row['title'],
				'description'      => $query->row['description'],
				'meta_description' => $query->row['meta_description'],
				'meta_keyword'     => $query->row['meta_keyword'],
				'model'            => $query->row['model'],
//				'sku'              => $query->row['sku'],
//				'location'         => $query->row['location'],
//				'quantity'         => $query->row['quantity'],
//				'thread_status'   => $query->row['thread_status'],
				'image'            => $query->row['image'],
				'user_id'        => $query->row['user_id'],
				'user'           => $query->row['user'],
//				'price'            => ($query->row['discount'] ? $query->row['discount'] : $query->row['price']),
//				'price'            => $query->row['price'],
//				'headline'         => $query->row['headline'],
				'reward'           => $query->row['reward'],
				'points'           => $query->row['points'],
//				'tax_class_id'     => $query->row['tax_class_id'],
				'date_available'   => $query->row['date_available'],
//				'weight'           => $query->row['weight'],
//				'weight_class'     => $query->row['weight_class'],
//				'length'           => $query->row['length'],
//				'width'            => $query->row['width'],
//				'height'           => $query->row['height'],
//				'length_class'     => $query->row['length_class'],
//				'subtract'         => $query->row['subtract'],
				'rating'           => (int)$query->row['rating'],
				'posts'         => $query->row['posts'],
//				'minimum'          => $query->row['minimum'],
				'sort_order'       => $query->row['sort_order'],
				'status'           => $query->row['status'],
				'headline'         => $query->row['headline'],
				'date_added'       => $query->row['date_added'],
				'date_modified'    => $query->row['date_modified'],
				'viewed'           => $query->row['viewed']
			);
		} else {
			return false;
		}
	}

	public function getThreads222($data) {
//		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_tag WHERE thread_id = '" . (int)$thread_id . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");
		$query = $this->db->query("
SELECT *
FROM " . DB_PREFIX . "p.thread
WHERE
p.thread_id = '" . (int)$thread_id . "'
AND p.status = '1'
LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id)
WHERE
pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
");

		return $query->rows;
	}

	public function getThreads($data = array()) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

//		$sql = "SELECT p.thread_id, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "post r1 WHERE r1.thread_id = p.thread_id AND r1.status = '1' GROUP BY r1.thread_id) AS rating FROM " . DB_PREFIX . "thread p LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id) LEFT JOIN " . DB_PREFIX . "thread_to_store p2s ON (p.thread_id = p2s.thread_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'";
/*
		$sql = "
SELECT p.thread_id, (SELECT AVG(rating) AS total
FROM " . DB_PREFIX . "post r1
WHERE
r1.thread_id = p.thread_id
AND r1.status = '1'
GROUP BY r1.thread_id) AS rating
FROM " . DB_PREFIX . "thread p
LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id)
LEFT JOIN " . DB_PREFIX . "thread_to_store p2s ON (p.thread_id = p2s.thread_id)
WHERE
pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
AND p.status = '1'
AND p.date_available <= NOW()
AND p2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'
";

LEFT JOIN " . DB_PREFIX . "user u ON (p.user_id = u.user_id)
LEFT JOIN " . DB_PREFIX . "user_group ug ON (u.user_group_id = ug.user_group_id)
*/

//print_r($data);

		$sql = "
SELECT *, p.thread_id
FROM " . DB_PREFIX . "thread p
LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id)
LEFT JOIN " . DB_PREFIX . "thread_to_store p2s ON (p.thread_id = p2s.thread_id)
WHERE
pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
AND p.status = '1'
AND p.date_available <= NOW()
";

		if (isset($data['filter_name']) && $data['filter_name']) {
			if (isset($data['filter_description']) && $data['filter_description']) {
				$sql .= " AND (LCASE(pd.title) LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%' OR p.thread_id IN (SELECT pt.thread_id FROM " . DB_PREFIX . "thread_tag pt WHERE pt.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pt.tag LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%') OR LCASE(pd.description) LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%')";
			} else {
				$sql .= " AND (LCASE(pd.title) LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%' OR p.thread_id IN (SELECT pt.thread_id FROM " . DB_PREFIX . "thread_tag pt WHERE pt.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pt.tag LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%'))";
			}
		}

		if (isset($data['filter_tag']) && $data['filter_tag']) {
			$sql .= " AND p.thread_id IN (SELECT pt.thread_id FROM " . DB_PREFIX . "thread_tag pt WHERE pt.language_id = '" . (int)$this->config->get('config_language_id') . "' AND LOWER(pt.tag) LIKE '%" . $this->db->escape(strtolower($data['filter_tag'])) . "%')";
		}

		if (isset($data['filter_category_id']) && $data['filter_category_id']) {
			if (isset($data['filter_sub_category']) && $data['filter_sub_category']) {
				$implode_data = array();

				$this->load->model('forum/forum_category');

				$categories = $this->model_forum_forum_category->getCategoriesByParentId($data['filter_category_id']);

				foreach ($categories as $category_id) {
					$implode_data[] = "p2c.category_id = '" . (int)$category_id . "'";
				}

				$sql .= " AND p.thread_id IN (SELECT p2c.thread_id FROM " . DB_PREFIX . "thread_to_category p2c WHERE " . implode(' OR ', $implode_data) . ")";
			} else {
				$sql .= " AND p.thread_id IN (SELECT p2c.thread_id FROM " . DB_PREFIX . "thread_to_category p2c WHERE p2c.category_id = '" . (int)$data['filter_category_id'] . "')";
			}
		}


		if (isset($data['filter_user_id'])) {
			$sql .= " AND p.user_id = '" . (int)$data['filter_user_id'] . "'";
		}

		$sort_data = array(
			'pd.title',
			'p.model',
//			'p.quantity',
//			'p.price',
			'rating',
			'p.sort_order',
			'p.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'pd.title' || $data['sort'] == 'p.model') {
				$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
			} else {
				$sql .= " ORDER BY " . $data['sort'];
			}
		} else {
			$sql .= " ORDER BY p.sort_order";
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

		$thread_data = array();

		$query = $this->db->query($sql);

		foreach ($query->rows as $result) {
			$thread_data[$result['thread_id']] = $this->getThread($result['thread_id']);
		}

		return $thread_data;
	}
/*
	public function getThreadHeadlines($data = array()) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

//		$sql = "SELECT DISTINCT ps.thread_id, (SELECT AVG(rating) FROM " . DB_PREFIX . "post r1 WHERE r1.thread_id = ps.thread_id AND r1.status = '1' GROUP BY r1.thread_id) AS rating FROM " . DB_PREFIX . "thread_headline ps LEFT JOIN " . DB_PREFIX . "thread p ON (ps.thread_id = p.thread_id) LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id) LEFT JOIN " . DB_PREFIX . "thread_to_store p2s ON (p.thread_id = p2s.thread_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "' AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) GROUP BY ps.thread_id";
		$sql = "SELECT DISTINCT ps.thread_id, (SELECT AVG(rating) FROM " . DB_PREFIX . "post r1
WHERE r1.thread_id = ps.thread_id AND r1.status = '1' GROUP BY r1.thread_id) AS rating
FROM " . DB_PREFIX . "thread_headline ps LEFT JOIN " . DB_PREFIX . "thread p ON (ps.thread_id = p.thread_id)
LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id)
LEFT JOIN " . DB_PREFIX . "thread_to_store p2s ON (p.thread_id = p2s.thread_id)
WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'
AND ps.customer_group_id = '" . (int)$customer_group_id . "'
AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW())
AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) GROUP BY ps.thread_id";

		$sort_data = array(
			'pd.name',
			'p.model',
//			'ps.price',
			'rating',
			'p.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
				$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
			} else {
				$sql .= " ORDER BY " . $data['sort'];
			}
		} else {
			$sql .= " ORDER BY p.sort_order";
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

		$thread_data = array();

		$query = $this->db->query($sql);

		foreach ($query->rows as $result) {
			$thread_data[$result['thread_id']] = $this->getThread($result['thread_id']);
		}

		return $thread_data;
	}
*/
	public function getLatestThreads($limit) {
		$thread_data = $this->cache->get('thread.latest.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_user_group_id') . '.' . $limit);

		if (!$thread_data) {
			$query = $this->db->query("SELECT p.thread_id FROM " . DB_PREFIX . "thread p LEFT JOIN " . DB_PREFIX . "thread_to_store p2s ON (p.thread_id = p2s.thread_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "' ORDER BY p.date_added DESC LIMIT " . (int)$limit);

			foreach ($query->rows as $result) {
				$thread_data[$result['thread_id']] = $this->getThread($result['thread_id']);
			}

			$this->cache->set('thread.latest.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_user_group_id') . '.' . $limit, $thread_data);
		}

		return $thread_data;
	}

	public function getHeadlineThreads($limit) {
		$thread_data = $this->cache->get('thread.headline.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_user_group_id') . '.' . $limit);

		if (!$thread_data) {
//			$query = $this->db->query("SELECT p.thread_id FROM " . DB_PREFIX . "thread p
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread p
LEFT JOIN " . DB_PREFIX . "thread_to_store p2s ON (p.thread_id = p2s.thread_id)
LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id)
WHERE
p.status = '1'
AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
AND p.headline = '1'
AND p.date_available <= NOW()
AND p2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'
ORDER BY p.date_added DESC LIMIT " . (int)$limit);

//print_r($query);

/*
			foreach ($query->rows as $result) {
				$thread_data[$result['thread_id']] = $this->getThread($result['thread_id']);
				$result['thread_id'] = $this->getThread($result['thread_id']);
			}
*/
			$this->cache->set('thread.headline.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_user_group_id') . '.' . $limit, $thread_data);
		}

		return $query->rows;
//		return $thread_data;
//		return $results;
	}

	public function getPopularThreads($limit) {
		$thread_data = array();

		$query = $this->db->query("SELECT p.thread_id FROM " . DB_PREFIX . "thread p LEFT JOIN " . DB_PREFIX . "thread_to_store p2s ON (p.thread_id = p2s.thread_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "' ORDER BY p.viewed, p.date_added DESC LIMIT " . (int)$limit);

		foreach ($query->rows as $result) {
			$thread_data[$result['thread_id']] = $this->getThread($result['thread_id']);
		}

		return $thread_data;
	}

	public function getBestSellerThreads($limit) {
		$thread_data = $this->cache->get('thread.bestseller.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_user_group_id') . '.' . $limit);

		if (!$thread_data) {
			$thread_data = array();

			$query = $this->db->query("SELECT op.thread_id, COUNT(*) AS total FROM " . DB_PREFIX . "order_thread op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id) LEFT JOIN `" . DB_PREFIX . "thread` p ON (op.thread_id = p.thread_id) LEFT JOIN " . DB_PREFIX . "thread_to_store p2s ON (p.thread_id = p2s.thread_id) WHERE o.order_status_id > '0' AND p.status = '1' AND p.date_available <= NOW() AND p2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "' GROUP BY op.thread_id ORDER BY total DESC LIMIT " . (int)$limit);

			foreach ($query->rows as $result) {
				$thread_data[$result['thread_id']] = $this->getThread($result['thread_id']);
			}

			$this->cache->set('thread.bestseller.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_user_group_id') . '.' . $limit, $thread_data);
		}

		return $thread_data;
	}
/*
	public function getThreadAttributes($thread_id) {
		$thread_attribute_group_data = array();

		$thread_attribute_group_query = $this->db->query("SELECT ag.attribute_group_id, agd.name FROM " . DB_PREFIX . "thread_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_group ag ON (a.attribute_group_id = ag.attribute_group_id) LEFT JOIN " . DB_PREFIX . "attribute_group_description agd ON (ag.attribute_group_id = agd.attribute_group_id) WHERE pa.thread_id = '" . (int)$thread_id . "' AND agd.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY ag.attribute_group_id ORDER BY ag.sort_order, agd.name");

		foreach ($thread_attribute_group_query->rows as $thread_attribute_group) {
			$thread_attribute_data = array();

			$thread_attribute_query = $this->db->query("SELECT a.attribute_id, ad.name, pa.text FROM " . DB_PREFIX . "thread_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (a.attribute_id = ad.attribute_id) WHERE pa.thread_id = '" . (int)$thread_id . "' AND a.attribute_group_id = '" . (int)$thread_attribute_group['attribute_group_id'] . "' AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pa.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY a.sort_order, ad.name");

			foreach ($thread_attribute_query->rows as $thread_attribute) {
				$thread_attribute_data[] = array(
					'attribute_id' => $thread_attribute['attribute_id'],
					'name'         => $thread_attribute['name'],
					'text'         => $thread_attribute['text']
				);
			}

			$thread_attribute_group_data[] = array(
				'attribute_group_id' => $thread_attribute_group['attribute_group_id'],
				'name'               => $thread_attribute_group['name'],
				'attribute'          => $thread_attribute_data
			);
		}

		return $thread_attribute_group_data;
	}
*/
/*
	public function getThreadOptions($thread_id) {
		$thread_option_data = array();

		$thread_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.thread_id = '" . (int)$thread_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY o.sort_order");

		foreach ($thread_option_query->rows as $thread_option) {
			if ($thread_option['type'] == 'select' || $thread_option['type'] == 'radio' || $thread_option['type'] == 'checkbox') {
				$thread_option_value_data = array();

				$thread_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.thread_id = '" . (int)$thread_id . "' AND pov.thread_option_id = '" . (int)$thread_option['thread_option_id'] . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY ov.sort_order");

				foreach ($thread_option_value_query->rows as $thread_option_value) {
					$thread_option_value_data[] = array(
						'thread_option_value_id' => $thread_option_value['thread_option_value_id'],
						'option_value_id'         => $thread_option_value['option_value_id'],
						'name'                    => $thread_option_value['name'],
						'quantity'                => $thread_option_value['quantity'],
						'subtract'                => $thread_option_value['subtract'],
						'price'                   => $thread_option_value['price'],
						'price_prefix'            => $thread_option_value['price_prefix'],
						'weight'                  => $thread_option_value['weight'],
						'weight_prefix'           => $thread_option_value['weight_prefix']
					);
				}

				$thread_option_data[] = array(
					'thread_option_id' => $thread_option['thread_option_id'],
					'option_id'         => $thread_option['option_id'],
					'name'              => $thread_option['name'],
					'type'              => $thread_option['type'],
					'option_value'      => $thread_option_value_data,
					'required'          => $thread_option['required']
				);
			} else {
				$thread_option_data[] = array(
					'thread_option_id' => $thread_option['thread_option_id'],
					'option_id'         => $thread_option['option_id'],
					'name'              => $thread_option['name'],
					'type'              => $thread_option['type'],
					'option_value'      => $thread_option['option_value'],
					'required'          => $thread_option['required']
				);
			}
		}

		return $thread_option_data;
	}
*/
/*
	public function getThreadDiscounts($thread_id) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_discount WHERE thread_id = '" . (int)$thread_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND quantity > 1 AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity ASC, priority ASC, price ASC");

		return $query->rows;
	}
*/
	public function getThreadImages($thread_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_image WHERE thread_id = '" . (int)$thread_id . "'");

		return $query->rows;
	}

	public function getThreadRelated($thread_id) {
		$thread_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_related WHERE thread_id = '" . (int)$thread_id . "'");

		foreach ($query->rows as $result) {
			$thread_data[$result['related_id']] = $this->getThread($result['related_id']);
		}

		return $thread_data;
	}

	public function getThreadTags($thread_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_tag WHERE thread_id = '" . (int)$thread_id . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");
		return $query->rows;
	}

	public function getThreadLayoutId($thread_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_to_layout WHERE thread_id = '" . (int)$thread_id . "' AND user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return $this->config->get('config_layout_thread');
		}
	}

	public function getCategories($thread_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_to_category WHERE thread_id = '" . (int)$thread_id . "'");

		return $query->rows;
	}

	public function getTotalThreads($data = array()) {
//		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "thread p LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id) LEFT JOIN " . DB_PREFIX . "thread_to_store p2s ON (p.thread_id = p2s.thread_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'";
/*
		$sql = "
SELECT COUNT(*) AS total
FROM " . DB_PREFIX . "thread p
LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id)
LEFT JOIN " . DB_PREFIX . "thread_to_store p2s ON (p.thread_id = p2s.thread_id)
WHERE
pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
AND p.status = '1'
AND p.date_available <= NOW()
AND p2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'
";
*/

//print_r($data);

		$sql = "
SELECT COUNT(*) AS total
FROM " . DB_PREFIX . "thread p
LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id)
LEFT JOIN " . DB_PREFIX . "thread_to_store p2s ON (p.thread_id = p2s.thread_id)
WHERE
pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
AND p.status = '1'
AND p.date_available <= NOW()
";
		if (isset($data['filter_name'])) {
			if (isset($data['filter_description']) && $data['filter_description']) {
				$sql .= " AND (LCASE(pd.name) LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%' OR p.thread_id IN (SELECT pt.thread_id FROM " . DB_PREFIX . "thread_tag pt WHERE pt.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pt.tag LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%') OR LCASE(pd.description) LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%')";
			} else {
				$sql .= " AND (LCASE(pd.title) LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%' OR p.thread_id IN (SELECT pt.thread_id FROM " . DB_PREFIX . "thread_tag pt WHERE pt.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pt.tag LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%'))";
			}
		}

		if (isset($data['filter_tag']) && $data['filter_tag']) {
			$sql .= " AND p.thread_id IN (SELECT pt.thread_id FROM " . DB_PREFIX . "thread_tag pt WHERE pt.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pt.tag LIKE '%" . $this->db->escape(strtolower($data['filter_tag'])) . "%')";
		}

		if (isset($data['filter_category_id']) && $data['filter_category_id']) {
			if (isset($data['filter_sub_category']) && $data['filter_sub_category']) {
				$implode_data = array();

				$this->load->model('forum/forum_category');

				$categories = $this->model_forum_forum_category->getCategoriesByParentId($data['filter_category_id']);

				foreach ($categories as $category_id) {
					$implode_data[] = "p2c.category_id = '" . (int)$category_id . "'";
				}

				$sql .= " AND p.thread_id IN (SELECT p2c.thread_id FROM " . DB_PREFIX . "thread_to_category p2c WHERE " . implode(' OR ', $implode_data) . ")";
			} else {
				$sql .= " AND p.thread_id IN (SELECT p2c.thread_id FROM " . DB_PREFIX . "thread_to_category p2c WHERE p2c.category_id = '" . (int)$data['filter_category_id'] . "')";
			}
		}

		if (isset($data['filter_user_id'])) {
			$sql .= " AND p.user_id = '" . (int)$data['filter_user_id'] . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
/*
	public function getTotalThreadHeadlines() {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$query = $this->db->query("SELECT COUNT(DISTINCT ps.thread_id) AS total FROM " . DB_PREFIX . "thread_headline ps LEFT JOIN " . DB_PREFIX . "thread p ON (ps.thread_id = p.thread_id) LEFT JOIN " . DB_PREFIX . "thread_to_store p2s ON (p.thread_id = p2s.thread_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "' AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW()))");

		if (isset($query->row['total'])) {
			return $query->row['total'];
		} else {
			return 0;
		}
	}
*/
}
