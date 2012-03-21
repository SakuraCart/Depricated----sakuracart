<?php
class ModelArticleAuthor extends Model {
	public function getAuthor($author_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "author m LEFT JOIN " . DB_PREFIX . "author_to_store m2s ON (m.author_id = m2s.author_id) WHERE m.author_id = '" . (int)$author_id . "' AND m2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");
		return $query->row;
	}

	public function getAuthors($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "author m LEFT JOIN " . DB_PREFIX . "author_to_store m2s ON (m.author_id = m2s.author_id) WHERE m2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

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

			$author_data = $this->cache->get('author.' . (int)$this->config->get('config_store_id'));

			if (!$author_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "author m LEFT JOIN " . DB_PREFIX . "author_to_store m2s ON (m.author_id = m2s.author_id) WHERE m2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY name");
				$author_data = $query->rows;
				$this->cache->set('author.' . (int)$this->config->get('config_store_id'), $author_data);
			}

			return $author_data;
		}
	}

}
