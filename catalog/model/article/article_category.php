<?php
class ModelArticleArticleCategory extends Model {
	public function getCategory($category_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "article_category c LEFT JOIN " . DB_PREFIX . "article_category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "article_category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");

		return $query->row;
	}

	public function getCategories($parent_id = 0) {
// ----------------------------------------------------------------------------------------------------
		$category_data = $this->cache->get('article_categories.' . $parent_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
		if(!$category_data && !is_array($category_data)){
// ----------------------------------------------------------------------------------------------------
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_category c LEFT JOIN " . DB_PREFIX . "article_category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "article_category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)");
// ----------------------------------------------------------------------------------------------------
			$category_data = $query->rows;
			$this->cache->set('article_categories.' . $parent_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $category_data);
		}
// ----------------------------------------------------------------------------------------------------

//		return $query->rows;
		return $category_data;
	}

	public function getCategoriesByParentId($category_id) {
		$article_category_data = array();

		$article_category_data[] = $category_id;

		$article_category_query = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "article_category WHERE parent_id = '" . (int)$category_id . "'");

		foreach ($article_category_query->rows as $article_category) {
			$children = $this->getCategoriesByParentId($article_category['category_id']);

			if ($children) {
				$article_category_data = array_merge($children, $article_category_data);
			}
		}

		return $article_category_data;
	}

	public function getCategoryLayoutId($category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_category_to_layout WHERE category_id = '" . (int)$category_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return $this->config->get('config_layout_article_category');
		}
	}

	public function getTotalCategoriesByCategoryId($parent_id = 0) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "article_category c LEFT JOIN " . DB_PREFIX . "article_category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");

		return $query->row['total'];
	}
}
