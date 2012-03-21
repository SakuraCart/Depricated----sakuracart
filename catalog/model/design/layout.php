<?php
class ModelDesignLayout extends Model {
	public function getLayout($route) {
/*
// ----------------------------------------------------------------------------------------------------
		$layout_route_data = $this->cache->get('layout_routes.' . $route . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
		if (!$layout_route_data) {
// ----------------------------------------------------------------------------------------------------
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout_route WHERE '" . $this->db->escape($route) . "' LIKE CONCAT(route, '%') AND store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY route ASC LIMIT 1");
// ----------------------------------------------------------------------------------------------------
//			$layout_route_data = $query;
			$layout_route_data = $query->rows;
//			$this->cache->set('layout_routes', $layout_route_data);
			$this->cache->set('layout_routes.' . $layout_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $layout_route_data);
		}
// ----------------------------------------------------------------------------------------------------
//		if ($layout_route_data) {
//			return $layout_route_data->row['layout_id'],
		} else {
			return 0;
		}
	}

print_r($route);
		$layout_route_data = $this->cache->get('layout_routes.' . $route . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
		if (!$layout_route_data) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout_route WHERE '" . $this->db->escape($route) . "' LIKE CONCAT(route, '%') AND store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY route ASC LIMIT 1");
			$layout_route_data = $query->rows;
			$layout_route_data = $query->row['layout_id'],
			$this->cache->set('layout_routes.' . $route . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $layout_route_data);
		}

		if ($layout_route_data) {
			return $layout_route_data->row['layout_id'],
//		if ($query->num_rows) {
//			return $query->row['layout_id'],
		} else {
			return 0;
		}
*/
//print_r($route);
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout_route WHERE '" . $this->db->escape($route) . "' LIKE CONCAT(route, '%') AND store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY route ASC LIMIT 1");
//print_r($query);
		if ($query->num_rows) {
//print_r($query->num_rows);
//print_r($query->row['layout_id']);
			return $query->row['layout_id'];
		} else {
			return 0;
		}


/*
		$layout_route_data = $this->cache->get('layout_routes.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
		if (!$layout_route_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout_route WHERE '" . $this->db->escape($route) . "' LIKE CONCAT(route, '%') AND store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY route ASC LIMIT 1");
			$this->cache->set('layout_routes.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $query->row['layout_id']);
		}

		if ($layout_route_data) {
			return $layout_route_data->row['layout_id'],
		} else {
			return 0;
		}

/*
		$category_data = $this->cache->get('categories.' . $parent_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
		if(!$category_data && !is_array($category_data)){
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)");
			$category_data = $query->rows;
			$this->cache->set('categories.' . $parent_id . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'), $category_data);
		}
		return $category_data;
*/
	}
}
