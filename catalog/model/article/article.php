<?php
class ModelArticleArticle extends Model {

	public function updateViewed($article_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "article SET viewed = (viewed + 1) WHERE article_id = '" . (int)$article_id . "'");
	}

	public function getArticle($article_id) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

//		$query = $this->db->query("SELECT DISTINCT *, pd.name AS name, p.image, m.name AS author, (SELECT price FROM " . DB_PREFIX . "article_discount pd2 WHERE pd2.article_id = p.article_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "article_headline ps WHERE ps.article_id = p.article_id AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS headline, (SELECT points FROM " . DB_PREFIX . "article_reward pr WHERE pr.article_id = p.article_id AND customer_group_id = '" . (int)$customer_group_id . "') AS reward, (SELECT ss.name FROM " . DB_PREFIX . "article_status ss WHERE ss.article_status_id = p.article_status_id AND ss.language_id = '" . (int)$this->config->get('config_language_id') . "') AS article_status, (SELECT wcd.unit FROM " . DB_PREFIX . "weight_class_description wcd WHERE p.weight_class_id = wcd.weight_class_id AND wcd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS weight_class, (SELECT lcd.unit FROM " . DB_PREFIX . "length_class_description lcd WHERE p.length_class_id = lcd.length_class_id AND lcd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS length_class, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "comment r1 WHERE r1.article_id = p.article_id AND r1.status = '1' GROUP BY r1.article_id) AS rating, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "comment r2 WHERE r2.article_id = p.article_id AND r2.status = '1' GROUP BY r2.article_id) AS comments FROM " . DB_PREFIX . "article p LEFT JOIN " . DB_PREFIX . "article_description pd ON (p.article_id = pd.article_id) LEFT JOIN " . DB_PREFIX . "article_to_store p2s ON (p.article_id = p2s.article_id) LEFT JOIN " . DB_PREFIX . "author m ON (p.author_id = m.author_id) WHERE p.article_id = '" . (int)$article_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");
/*
(SELECT price FROM
" . DB_PREFIX . "article_discount pd2
WHERE pd2.article_id = p.article_id AND pd2.customer_group_id = '" . (int)$customer_group_id . "'
AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW())
AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC,
pd2.price ASC LIMIT 1) AS discount,
*/
		$query = $this->db->query("
SELECT DISTINCT *, pd.name AS name, p.image, m.name AS author,
(SELECT points FROM " . DB_PREFIX . "article_reward pr WHERE pr.article_id = p.article_id AND customer_group_id = '" . (int)$customer_group_id . "') AS reward,
(SELECT AVG(rating) AS total FROM " . DB_PREFIX . "comment r1 WHERE r1.article_id = p.article_id AND r1.status = '1' GROUP BY r1.article_id) AS rating,
(SELECT COUNT(*) AS total FROM " . DB_PREFIX . "comment r2 WHERE r2.article_id = p.article_id AND r2.status = '1' GROUP BY r2.article_id) AS comments
FROM " . DB_PREFIX . "article p
LEFT JOIN " . DB_PREFIX . "article_description pd ON (p.article_id = pd.article_id)
LEFT JOIN " . DB_PREFIX . "article_to_store p2s ON (p.article_id = p2s.article_id)
LEFT JOIN " . DB_PREFIX . "author m ON (p.author_id = m.author_id) WHERE p.article_id = '" . (int)$article_id . "'
AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1'
AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return array(
				'article_id'       => $query->row['article_id'],
				'name'             => $query->row['name'],
				'description'      => $query->row['description'],
				'meta_description' => $query->row['meta_description'],
				'meta_keyword'     => $query->row['meta_keyword'],
				'summary'            => $query->row['summary'],
//				'sku'              => $query->row['sku'],
//				'location'         => $query->row['location'],
//				'quantity'         => $query->row['quantity'],
//				'article_status'   => $query->row['article_status'],
				'image'            => $query->row['image'],
				'author_id'        => $query->row['author_id'],
				'author'           => $query->row['author'],
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
				'comments'         => $query->row['comments'],
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

	public function getArticles($data = array()) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$sql = "SELECT p.article_id, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "comment r1 WHERE r1.article_id = p.article_id AND r1.status = '1' GROUP BY r1.article_id) AS rating FROM " . DB_PREFIX . "article p LEFT JOIN " . DB_PREFIX . "article_description pd ON (p.article_id = pd.article_id) LEFT JOIN " . DB_PREFIX . "article_to_store p2s ON (p.article_id = p2s.article_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

		if (isset($data['filter_name']) && $data['filter_name']) {
			if (isset($data['filter_description']) && $data['filter_description']) {
				$sql .= " AND (LCASE(pd.name) LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%' OR p.article_id IN (SELECT pt.article_id FROM " . DB_PREFIX . "article_tag pt WHERE pt.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pt.tag LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%') OR LCASE(pd.description) LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%')";
			} else {
				$sql .= " AND (LCASE(pd.name) LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%' OR p.article_id IN (SELECT pt.article_id FROM " . DB_PREFIX . "article_tag pt WHERE pt.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pt.tag LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%'))";
			}
		}

		if (isset($data['filter_tag']) && $data['filter_tag']) {
			$sql .= " AND p.article_id IN (SELECT pt.article_id FROM " . DB_PREFIX . "article_tag pt WHERE pt.language_id = '" . (int)$this->config->get('config_language_id') . "' AND LOWER(pt.tag) LIKE '%" . $this->db->escape(strtolower($data['filter_tag'])) . "%')";
		}

		if (isset($data['filter_category_id']) && $data['filter_category_id']) {
			if (isset($data['filter_sub_category']) && $data['filter_sub_category']) {
				$implode_data = array();

				$this->load->model('article/article_category');

				$categories = $this->model_article_article_category->getCategoriesByParentId($data['filter_category_id']);

				foreach ($categories as $category_id) {
					$implode_data[] = "p2c.category_id = '" . (int)$category_id . "'";
				}

				$sql .= " AND p.article_id IN (SELECT p2c.article_id FROM " . DB_PREFIX . "article_to_category p2c WHERE " . implode(' OR ', $implode_data) . ")";
			} else {
				$sql .= " AND p.article_id IN (SELECT p2c.article_id FROM " . DB_PREFIX . "article_to_category p2c WHERE p2c.category_id = '" . (int)$data['filter_category_id'] . "')";
			}
		}

		if (isset($data['filter_author_id'])) {
			$sql .= " AND p.author_id = '" . (int)$data['filter_author_id'] . "'";
		}

		$sort_data = array(
			'pd.name',
			'p.summary',
//			'p.quantity',
//			'p.price',
			'rating',
			'p.sort_order',
			'p.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.summary') {
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

		$article_data = array();

		$query = $this->db->query($sql);

		foreach ($query->rows as $result) {
			$article_data[$result['article_id']] = $this->getArticle($result['article_id']);
		}

		return $article_data;
	}
/*
	public function getArticleHeadlines($data = array()) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

//		$sql = "SELECT DISTINCT ps.article_id, (SELECT AVG(rating) FROM " . DB_PREFIX . "comment r1 WHERE r1.article_id = ps.article_id AND r1.status = '1' GROUP BY r1.article_id) AS rating FROM " . DB_PREFIX . "article_headline ps LEFT JOIN " . DB_PREFIX . "article p ON (ps.article_id = p.article_id) LEFT JOIN " . DB_PREFIX . "article_description pd ON (p.article_id = pd.article_id) LEFT JOIN " . DB_PREFIX . "article_to_store p2s ON (p.article_id = p2s.article_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) GROUP BY ps.article_id";
		$sql = "SELECT DISTINCT ps.article_id, (SELECT AVG(rating) FROM " . DB_PREFIX . "comment r1
WHERE r1.article_id = ps.article_id AND r1.status = '1' GROUP BY r1.article_id) AS rating
FROM " . DB_PREFIX . "article_headline ps LEFT JOIN " . DB_PREFIX . "article p ON (ps.article_id = p.article_id)
LEFT JOIN " . DB_PREFIX . "article_description pd ON (p.article_id = pd.article_id)
LEFT JOIN " . DB_PREFIX . "article_to_store p2s ON (p.article_id = p2s.article_id)
WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'
AND ps.customer_group_id = '" . (int)$customer_group_id . "'
AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW())
AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) GROUP BY ps.article_id";

		$sort_data = array(
			'pd.name',
			'p.summary',
//			'ps.price',
			'rating',
			'p.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.summary') {
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

		$article_data = array();

		$query = $this->db->query($sql);

		foreach ($query->rows as $result) {
			$article_data[$result['article_id']] = $this->getArticle($result['article_id']);
		}

		return $article_data;
	}
*/
	public function getLatestArticles($limit) {
		$article_data = $this->cache->get('article.latest.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $limit);

		if (!$article_data) {
			$query = $this->db->query("SELECT p.article_id FROM " . DB_PREFIX . "article p LEFT JOIN " . DB_PREFIX . "article_to_store p2s ON (p.article_id = p2s.article_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY p.date_added DESC LIMIT " . (int)$limit);

			foreach ($query->rows as $result) {
				$article_data[$result['article_id']] = $this->getArticle($result['article_id']);
			}

			$this->cache->set('article.latest.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $limit, $article_data);
		}

		return $article_data;
	}

	public function getHeadlineArticles($limit) {
		$article_data = $this->cache->get('article.headline.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $limit);

		if (!$article_data) {
//			$query = $this->db->query("SELECT p.article_id FROM " . DB_PREFIX . "article p
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article p
LEFT JOIN " . DB_PREFIX . "article_to_store p2s ON (p.article_id = p2s.article_id)
LEFT JOIN " . DB_PREFIX . "article_description pd ON (p.article_id = pd.article_id)
WHERE
p.status = '1'
AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
AND p.headline = '1'
AND p.date_available <= NOW()
AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'
ORDER BY p.date_added DESC LIMIT " . (int)$limit);

//print_r($query);

/*
			foreach ($query->rows as $result) {
				$article_data[$result['article_id']] = $this->getArticle($result['article_id']);
				$result['article_id'] = $this->getArticle($result['article_id']);
			}
*/
			$this->cache->set('article.headline.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $limit, $article_data);
		}

		return $query->rows;
//		return $article_data;
//		return $results;
	}

	public function getPopularArticles($limit) {
		$article_data = array();

		$query = $this->db->query("SELECT p.article_id FROM " . DB_PREFIX . "article p LEFT JOIN " . DB_PREFIX . "article_to_store p2s ON (p.article_id = p2s.article_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY p.viewed, p.date_added DESC LIMIT " . (int)$limit);

		foreach ($query->rows as $result) {
			$article_data[$result['article_id']] = $this->getArticle($result['article_id']);
		}

		return $article_data;
	}

	public function getBestSellerArticles($limit) {
		$article_data = $this->cache->get('article.bestseller.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $limit);

		if (!$article_data) {
			$article_data = array();

			$query = $this->db->query("SELECT op.article_id, COUNT(*) AS total FROM " . DB_PREFIX . "order_article op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id) LEFT JOIN `" . DB_PREFIX . "article` p ON (op.article_id = p.article_id) LEFT JOIN " . DB_PREFIX . "article_to_store p2s ON (p.article_id = p2s.article_id) WHERE o.order_status_id > '0' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' GROUP BY op.article_id ORDER BY total DESC LIMIT " . (int)$limit);

			foreach ($query->rows as $result) {
				$article_data[$result['article_id']] = $this->getArticle($result['article_id']);
			}

			$this->cache->set('article.bestseller.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $limit, $article_data);
		}

		return $article_data;
	}
/*
	public function getArticleAttributes($article_id) {
		$article_attribute_group_data = array();

		$article_attribute_group_query = $this->db->query("SELECT ag.attribute_group_id, agd.name FROM " . DB_PREFIX . "article_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_group ag ON (a.attribute_group_id = ag.attribute_group_id) LEFT JOIN " . DB_PREFIX . "attribute_group_description agd ON (ag.attribute_group_id = agd.attribute_group_id) WHERE pa.article_id = '" . (int)$article_id . "' AND agd.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY ag.attribute_group_id ORDER BY ag.sort_order, agd.name");

		foreach ($article_attribute_group_query->rows as $article_attribute_group) {
			$article_attribute_data = array();

			$article_attribute_query = $this->db->query("SELECT a.attribute_id, ad.name, pa.text FROM " . DB_PREFIX . "article_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (a.attribute_id = ad.attribute_id) WHERE pa.article_id = '" . (int)$article_id . "' AND a.attribute_group_id = '" . (int)$article_attribute_group['attribute_group_id'] . "' AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pa.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY a.sort_order, ad.name");

			foreach ($article_attribute_query->rows as $article_attribute) {
				$article_attribute_data[] = array(
					'attribute_id' => $article_attribute['attribute_id'],
					'name'         => $article_attribute['name'],
					'text'         => $article_attribute['text']
				);
			}

			$article_attribute_group_data[] = array(
				'attribute_group_id' => $article_attribute_group['attribute_group_id'],
				'name'               => $article_attribute_group['name'],
				'attribute'          => $article_attribute_data
			);
		}

		return $article_attribute_group_data;
	}
*/
/*
	public function getArticleOptions($article_id) {
		$article_option_data = array();

		$article_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.article_id = '" . (int)$article_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY o.sort_order");

		foreach ($article_option_query->rows as $article_option) {
			if ($article_option['type'] == 'select' || $article_option['type'] == 'radio' || $article_option['type'] == 'checkbox') {
				$article_option_value_data = array();

				$article_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.article_id = '" . (int)$article_id . "' AND pov.article_option_id = '" . (int)$article_option['article_option_id'] . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY ov.sort_order");

				foreach ($article_option_value_query->rows as $article_option_value) {
					$article_option_value_data[] = array(
						'article_option_value_id' => $article_option_value['article_option_value_id'],
						'option_value_id'         => $article_option_value['option_value_id'],
						'name'                    => $article_option_value['name'],
						'quantity'                => $article_option_value['quantity'],
						'subtract'                => $article_option_value['subtract'],
						'price'                   => $article_option_value['price'],
						'price_prefix'            => $article_option_value['price_prefix'],
						'weight'                  => $article_option_value['weight'],
						'weight_prefix'           => $article_option_value['weight_prefix']
					);
				}

				$article_option_data[] = array(
					'article_option_id' => $article_option['article_option_id'],
					'option_id'         => $article_option['option_id'],
					'name'              => $article_option['name'],
					'type'              => $article_option['type'],
					'option_value'      => $article_option_value_data,
					'required'          => $article_option['required']
				);
			} else {
				$article_option_data[] = array(
					'article_option_id' => $article_option['article_option_id'],
					'option_id'         => $article_option['option_id'],
					'name'              => $article_option['name'],
					'type'              => $article_option['type'],
					'option_value'      => $article_option['option_value'],
					'required'          => $article_option['required']
				);
			}
		}

		return $article_option_data;
	}
*/
/*
	public function getArticleDiscounts($article_id) {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_discount WHERE article_id = '" . (int)$article_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND quantity > 1 AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity ASC, priority ASC, price ASC");

		return $query->rows;
	}
*/
	public function getArticleImages($article_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_image WHERE article_id = '" . (int)$article_id . "'");

		return $query->rows;
	}

	public function getArticleRelated($article_id) {
		$article_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_related WHERE article_id = '" . (int)$article_id . "'");

		foreach ($query->rows as $result) {
			$article_data[$result['related_id']] = $this->getArticle($result['related_id']);
		}

		return $article_data;
	}

	public function getArticleTags($article_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_tag WHERE article_id = '" . (int)$article_id . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");
		return $query->rows;
	}

	public function getArticleLayoutId($article_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_to_layout WHERE article_id = '" . (int)$article_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return $this->config->get('config_layout_article');
		}
	}

	public function getCategories($article_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_to_category WHERE article_id = '" . (int)$article_id . "'");

		return $query->rows;
	}

	public function getTotalArticles($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "article p LEFT JOIN " . DB_PREFIX . "article_description pd ON (p.article_id = pd.article_id) LEFT JOIN " . DB_PREFIX . "article_to_store p2s ON (p.article_id = p2s.article_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

		if (isset($data['filter_name'])) {
			if (isset($data['filter_description']) && $data['filter_description']) {
				$sql .= " AND (LCASE(pd.name) LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%' OR p.article_id IN (SELECT pt.article_id FROM " . DB_PREFIX . "article_tag pt WHERE pt.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pt.tag LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%') OR LCASE(pd.description) LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%')";
			} else {
				$sql .= " AND (LCASE(pd.name) LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%' OR p.article_id IN (SELECT pt.article_id FROM " . DB_PREFIX . "article_tag pt WHERE pt.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pt.tag LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%'))";
			}
		}

		if (isset($data['filter_tag']) && $data['filter_tag']) {
			$sql .= " AND p.article_id IN (SELECT pt.article_id FROM " . DB_PREFIX . "article_tag pt WHERE pt.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pt.tag LIKE '%" . $this->db->escape(strtolower($data['filter_tag'])) . "%')";
		}

		if (isset($data['filter_category_id']) && $data['filter_category_id']) {
			if (isset($data['filter_sub_category']) && $data['filter_sub_category']) {
				$implode_data = array();

				$this->load->model('article/article_category');

				$categories = $this->model_article_article_category->getCategoriesByParentId($data['filter_category_id']);

				foreach ($categories as $category_id) {
					$implode_data[] = "p2c.category_id = '" . (int)$category_id . "'";
				}

				$sql .= " AND p.article_id IN (SELECT p2c.article_id FROM " . DB_PREFIX . "article_to_category p2c WHERE " . implode(' OR ', $implode_data) . ")";
			} else {
				$sql .= " AND p.article_id IN (SELECT p2c.article_id FROM " . DB_PREFIX . "article_to_category p2c WHERE p2c.category_id = '" . (int)$data['filter_category_id'] . "')";
			}
		}

		if (isset($data['filter_author_id'])) {
			$sql .= " AND p.author_id = '" . (int)$data['filter_author_id'] . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
/*
	public function getTotalArticleHeadlines() {
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$query = $this->db->query("SELECT COUNT(DISTINCT ps.article_id) AS total FROM " . DB_PREFIX . "article_headline ps LEFT JOIN " . DB_PREFIX . "article p ON (ps.article_id = p.article_id) LEFT JOIN " . DB_PREFIX . "article_to_store p2s ON (p.article_id = p2s.article_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND ps.customer_group_id = '" . (int)$customer_group_id . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW()))");

		if (isset($query->row['total'])) {
			return $query->row['total'];
		} else {
			return 0;
		}
	}
*/
}
