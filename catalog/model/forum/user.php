<?php
class ModelForumUser extends Model {

	public function getUser($user_id) {
//		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user m LEFT JOIN " . DB_PREFIX . "user_group m2s ON (m.user_id = m2s.user_id) WHERE m.user_id = '" . (int)$user_id . "' AND m2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'");
/*
		$query = $this->db->query("
SELECT * FROM " . DB_PREFIX . "user m
LEFT JOIN " . DB_PREFIX . "user_group m2s ON (m.user_id = m2s.user_id)
WHERE
m.user_id = '" . (int)$user_id . "'
AND m2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'
");
*/
		$query = $this->db->query("
SELECT * FROM " . DB_PREFIX . "user m
LEFT JOIN " . DB_PREFIX . "user_group m2s ON (m.user_id = m2s.user_group_id)
");

		return $query->row;
	}

	public function getUsers($data = array()) {
		if ($data) {
//			$sql = "SELECT * FROM " . DB_PREFIX . "user m LEFT JOIN " . DB_PREFIX . "user_group m2s ON (m.user_id = m2s.user_id) WHERE m2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'";
/*
			$sql = "
SELECT * FROM " . DB_PREFIX . "user m
LEFT JOIN " . DB_PREFIX . "user_group m2s ON (m.user_id = m2s.user_id)
WHERE
m2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'
";
*/
			$sql = "
SELECT * FROM " . DB_PREFIX . "user m
LEFT JOIN " . DB_PREFIX . "user_group m2s ON (m.user_id = m2s.user_id)
";

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
			$user_data = $this->cache->get('user.' . (int)$this->config->get('config_user_group_id'));

			if (!$user_data) {
//				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user m LEFT JOIN " . DB_PREFIX . "user_group m2s ON (m.user_id = m2s.user_id) WHERE m2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "' ORDER BY name");
/*
				$query = $this->db->query("
SELECT * FROM " . DB_PREFIX . "user m
LEFT JOIN " . DB_PREFIX . "user_group m2s ON (m.user_id = m2s.user_id)
WHERE
m2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'
ORDER BY name
");
*/
				$query = $this->db->query("
SELECT * FROM " . DB_PREFIX . "user m
LEFT JOIN " . DB_PREFIX . "user_group m2s ON (m.user_id = m2s.user_group_id)
ORDER BY name
");

				$user_data = $query->rows;

				$this->cache->set('user.' . (int)$this->config->get('config_user_group_id'), $user_data);
			}

			return $user_data;
		}
	}
}
