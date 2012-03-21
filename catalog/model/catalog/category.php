<?php
class ModelCatalogCategory extends Model {
	public function getCategory($category_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");

		return $query->row;
	}

	public function getCategories($parent_id = 0) {
// ----------------------------------------------------------------------------------------------------
		$category_data = $this->cache->get('categories.' . $parent_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
		if(!$category_data && !is_array($category_data)){
// ----------------------------------------------------------------------------------------------------
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)");
// ----------------------------------------------------------------------------------------------------
			$category_data = $query->rows;
			$this->cache->set('categories.' . $parent_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $category_data);
		}
// ----------------------------------------------------------------------------------------------------

//		return $query->rows;
		return $category_data;
	}

	public function getCategoriesByParentId($category_id) {
		$category_data = array();
		$category_query = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "category WHERE parent_id = '" . (int)$category_id . "'");

		foreach ($category_query->rows as $category) {
			$category_data[] = $category['category_id'];
			$children = $this->getCategoriesByParentId($category['category_id']);

			if ($children) {
				$category_data = array_merge($children, $category_data);
			}
		}

		return $category_data;
	}

	public function getCategoryLayoutId($category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_to_layout WHERE category_id = '" . (int)$category_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return $this->config->get('config_layout_category');
		}
	}

	public function getCategoriesAndTotals($parent_id = 0){
		$category_data = $this->cache->get('categoryandtotal.' . $parent_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
		if(!$category_data && !is_array($category_data)){
			$query = $this->db->query("SELECT c.category_id, cd.name FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON cd.category_id = c.category_id AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON c2s.category_id = c.category_id WHERE c.parent_id = '" . (int)$parent_id . "' AND c.status = '1' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY c.sort_order, LCASE(cd.name)");
			$category_data = array();
			foreach($query->rows as $category){
				$cid_list_array = $this->getCategoriesByParentId($category['category_id']);
				$cid_list = implode(',', $cid_list_array);
				$cnt_query = $this->db->query("SELECT COUNT(*) as qty FROM " . DB_PREFIX . "product_to_category p2c LEFT JOIN " . DB_PREFIX . "product p ON p.product_id = p2c.product_id WHERE p.status = '1' AND p2c.category_id IN (" . $cid_list . ")");
				$category_data[] = array(
					'qty' => $cnt_query->row['qty'],
					'category_id' => $category['category_id'],
					'name' => $category['name']
				);
			}
			$this->cache->set('categoryandtotal.' . $parent_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $category_data);
		}
		return $category_data;
	}

	public function getTotalCategoriesByCategoryId($parent_id = 0) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");

		return $query->row['total'];
	}
}
