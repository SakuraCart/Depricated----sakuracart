<?php
class ModelForumPost extends Model {

	public function addPost($data) {
//		$this->db->query("INSERT INTO " . DB_PREFIX . "post SET user = '" . $this->db->escape($data['user']) . "', thread_id = '" . $this->db->escape($data['thread_id']) . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', rating = '" . (int)$data['rating'] . "', status = '" . (int)$data['status'] . "', date_added = NOW()");
/*
		$this->db->query("
INSERT INTO " . DB_PREFIX . "post
SET
user = '" . $this->db->escape($data['user']) . "',
thread_id = '" . $this->db->escape($data['thread_id']) . "',
text = '" . $this->db->escape(strip_tags($data['text'])) . "',
rating = '" . (int)$data['rating'] . "',
status = '" . (int)$data['status'] . "',
date_added = NOW()"
);
*/
		$this->db->query("
INSERT INTO " . DB_PREFIX . "post
SET
rating = '" . (int)$data['rating'] . "',
username = '" . $this->db->escape($data['username']) . "',
user_id = '" . $this->db->escape($data['user_id']) . "',
thread_id = '" . $this->db->escape($data['thread_id']) . "',
text = '" . $this->db->escape(strip_tags($data['text'])) . "',
date_added = NOW()"
);

	}

	public function editPost($post_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "post SET
username = '" . $this->db->escape($data['username']) . "',
user_id = '" . $this->db->escape($data['user_id']) . "',
thread_id = '" . $this->db->escape($data['thread_id']) . "',
text = '" . $this->db->escape(strip_tags($data['text'])) . "',
rating = '" . (int)$data['rating'] . "',
status = '" . (int)$data['status'] . "', date_added = NOW() WHERE post_id = '" . (int)$post_id . "'");
	}

	public function deletePost($post_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "post WHERE post_id = '" . (int)$post_id . "'");
	}

	public function getPost($post_id) {
//		$query = $this->db->query("SELECT DISTINCT *, (SELECT pd.name FROM " . DB_PREFIX . "thread_description pd WHERE pd.thread_id = r.thread_id AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS thread FROM " . DB_PREFIX . "post r WHERE r.post_id = '" . (int)$post_id . "'");
		$query = $this->db->query("SELECT DISTINCT *, (SELECT pd.title
FROM " . DB_PREFIX . "thread_description pd
WHERE pd.thread_id = r.thread_id
AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS thread
FROM " . DB_PREFIX . "post r WHERE r.post_id = '" . (int)$post_id . "'");

		return $query->row;
	}

	public function getPosts($data = array()) {
/*
		$sql = "SELECT r.post_id,
pd.name,
r.user,
r.rating,
r.status, r.date_added FROM " . DB_PREFIX . "post r LEFT JOIN " . DB_PREFIX . "thread_description pd ON (r.thread_id = pd.thread_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
*/
$sql = "SELECT r.post_id,
pd.title,
pd.description,
r.rating,
r.username,
r.user_id,
r.status, r.date_added FROM " . DB_PREFIX . "post r
LEFT JOIN " . DB_PREFIX . "thread_description pd ON (r.thread_id = pd.thread_id)
WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		$sort_data = array(
			'pd.title',
			'r.username',
			'r.user_id',
			'r.rating',
			'r.status',
			'r.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY r.date_added";
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

	public function getTotalPostsAwaitingApproval() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "post WHERE status = '0'");
		return $query->row['total'];
	}

}
