<?php
class ModelArticleAuthor extends Model {
	public function addAuthor($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "author SET name = '" . $this->db->escape($data['name']) . "', sort_order = '" . (int)$data['sort_order'] . "'");

		$author_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "author SET image = '" . $this->db->escape($data['image']) . "' WHERE author_id = '" . (int)$author_id . "'");
		}

		if (isset($data['author_store'])) {
			foreach ($data['author_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "author_to_store SET author_id = '" . (int)$author_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'author_id=" . (int)$author_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('author');
	}

	public function editAuthor($author_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "author SET name = '" . $this->db->escape($data['name']) . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE author_id = '" . (int)$author_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "author SET image = '" . $this->db->escape($data['image']) . "' WHERE author_id = '" . (int)$author_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "author_to_store WHERE author_id = '" . (int)$author_id . "'");

		if (isset($data['author_store'])) {
			foreach ($data['author_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "author_to_store SET author_id = '" . (int)$author_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'author_id=" . (int)$author_id. "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'author_id=" . (int)$author_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('author');
	}

	public function deleteAuthor($author_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "author WHERE author_id = '" . (int)$author_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "author_to_store WHERE author_id = '" . (int)$author_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'author_id=" . (int)$author_id . "'");

		$this->cache->delete('author');
	}

	public function getAuthor($author_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'author_id=" . (int)$author_id . "') AS keyword FROM " . DB_PREFIX . "author WHERE author_id = '" . (int)$author_id . "'");

		return $query->row;
	}

	public function getAuthors($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "author";

			$sort_data = array(
				'name',
				'sort_order'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY name";
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
		} else {
			$author_data = $this->cache->get('author');

			if (!$author_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "author ORDER BY name");

				$author_data = $query->rows;

				$this->cache->set('author', $author_data);
			}

			return $author_data;
		}
	}

	public function getAuthorStores($author_id) {
		$author_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "author_to_store WHERE author_id = '" . (int)$author_id . "'");

		foreach ($query->rows as $result) {
			$author_store_data[] = $result['store_id'];
		}

		return $author_store_data;
	}

	public function getTotalAuthorsByImageId($image_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "author WHERE image_id = '" . (int)$image_id . "'");

		return $query->row['total'];
	}

	public function getTotalAuthors() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "author");

		return $query->row['total'];
	}
}
