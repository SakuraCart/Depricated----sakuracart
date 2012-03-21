<?php
class ModelForumForumCategory extends Model {
	public function getCategory($forum_category_id) {
//		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "forum_category c LEFT JOIN " . DB_PREFIX . "forum_category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "forum_category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.category_id = '" . (int)$forum_category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "' AND c.status = '1'");
/*
		$query = $this->db->query("
SELECT DISTINCT *
FROM " . DB_PREFIX . "forum_category c
LEFT JOIN " . DB_PREFIX . "forum_category_description cd ON (c.category_id = cd.category_id)
LEFT JOIN " . DB_PREFIX . "forum_category_to_store c2s ON (c.category_id = c2s.category_id)
WHERE
c.category_id = '" . (int)$forum_category_id . "'
AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "'
AND c2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'
AND c.status = '1'
");
*/
		$query = $this->db->query("
SELECT DISTINCT *
FROM " . DB_PREFIX . "forum_category c
LEFT JOIN " . DB_PREFIX . "forum_category_description cd ON (c.category_id = cd.category_id)
LEFT JOIN " . DB_PREFIX . "forum_category_to_store c2s ON (c.category_id = c2s.category_id)
WHERE
c.category_id = '" . (int)$forum_category_id . "'
AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "'
AND c.status = '1'
");

//		return $query->rows;
		return $query->row;
	}

	public function getCategories($parent_id = 0) {
// ----------------------------------------------------------------------------------------------------
		$forum_category_data = $this->cache->get('forum_categories.' . $parent_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
		if(!$forum_category_data && !is_array($forum_category_data)){
// ----------------------------------------------------------------------------------------------------
//		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "forum_category c LEFT JOIN " . DB_PREFIX . "forum_category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "forum_category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)");
/*
		$query = $this->db->query("
SELECT * FROM " . DB_PREFIX . "forum_category c
LEFT JOIN " . DB_PREFIX . "forum_category_description cd ON (c.category_id = cd.category_id)
LEFT JOIN " . DB_PREFIX . "forum_category_to_store c2s ON (c.category_id = c2s.category_id)
WHERE
c.parent_id = '" . (int)$parent_id . "'
AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "'
AND c2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'
AND c.status = '1'
ORDER BY c.sort_order, LCASE(cd.name)
");
*/
		$query = $this->db->query("
SELECT * FROM " . DB_PREFIX . "forum_category c
LEFT JOIN " . DB_PREFIX . "forum_category_description cd ON (c.category_id = cd.category_id)
LEFT JOIN " . DB_PREFIX . "forum_category_to_store c2s ON (c.category_id = c2s.category_id)
WHERE
c.parent_id = '" . (int)$parent_id . "'
AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "'
AND c.status = '1'
ORDER BY c.sort_order, LCASE(cd.name)
");
// ----------------------------------------------------------------------------------------------------
			$forum_category_data = $query->rows;
			$this->cache->set('forum_categories.' . $parent_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $forum_category_data);
		}
// ----------------------------------------------------------------------------------------------------

//		return $query->rows;
		return $forum_category_data;
	}

	public function getCategoriesByParentId($forum_category_id) {
		$forum_category_data = array();

		$forum_category_data[] = $forum_category_id;

		$forum_category_query = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "forum_category WHERE parent_id = '" . (int)$forum_category_id . "'");

		foreach ($forum_category_query->rows as $forum_category) {
			$children = $this->getCategoriesByParentId($forum_category['category_id']);

			if ($children) {
				$forum_category_data = array_merge($children, $forum_category_data);
			}
		}

		return $forum_category_data;
	}

	public function getCategoryLayoutId($forum_category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "forum_category_to_layout WHERE category_id = '" . (int)$forum_category_id . "' AND user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return $this->config->get('config_layout_category');
		}
	}

	public function getCategoriesAndTotals($parent_id = 0){
		$forum_category_data = $this->cache->get('categoryandtotal.' . $parent_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
		if(!$forum_category_data && !is_array($forum_category_data)){
			$query = $this->db->query("SELECT c.category_id, cd.name FROM " . DB_PREFIX . "forum_category c LEFT JOIN " . DB_PREFIX . "forum_category_description cd ON cd.category_id = c.category_id AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' LEFT JOIN " . DB_PREFIX . "forum_category_to_store c2s ON c2s.category_id = c.category_id WHERE c.parent_id = '" . (int)$parent_id . "' AND c.status = '1' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY c.sort_order, LCASE(cd.name)");
			$forum_category_data = array();
			foreach($query->rows as $forum_category){
				$cid_list_array = $this->getCategoriesByParentId($forum_category['category_id']);
				$cid_list = implode(',', $cid_list_array);
				$cnt_query = $this->db->query("SELECT COUNT(*) as qty FROM " . DB_PREFIX . "product_to_category p2c LEFT JOIN " . DB_PREFIX . "product p ON p.product_id = p2c.product_id WHERE p.status = '1' AND p2c.category_id IN (" . $cid_list . ")");
				$forum_category_data[] = array(
					'qty' => $cnt_query->row['qty'],
					'category_id' => $forum_category['category_id'],
					'name' => $forum_category['name']
				);
			}
			$this->cache->set('categoryandtotal.' . $parent_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $forum_category_data);
		}
		return $forum_category_data;
	}


	public function getTotalCategoriesByCategoryId($parent_id = 0) {
//		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "forum_category c LEFT JOIN " . DB_PREFIX . "forum_category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND c2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "' AND c.status = '1'");
/*
		$query = $this->db->query("
SELECT COUNT(*) AS total
FROM " . DB_PREFIX . "forum_category c
LEFT JOIN " . DB_PREFIX . "forum_category_to_store c2s ON (c.category_id = c2s.category_id)
WHERE
c.parent_id = '" . (int)$parent_id . "'
AND c2s.user_group_id = '" . (int)$this->config->get('config_user_group_id') . "'
AND c.status = '1'
");
*/
		$query = $this->db->query("
SELECT COUNT(*) AS total
FROM " . DB_PREFIX . "forum_category c
LEFT JOIN " . DB_PREFIX . "forum_category_to_store c2s ON (c.category_id = c2s.category_id)
WHERE
c.parent_id = '" . (int)$parent_id . "'
AND c.status = '1'
");

		return $query->row['total'];
	}
}
