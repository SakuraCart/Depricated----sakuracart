<?php
class ModelArticleArticle extends Model {

	public function addArticle($data) {
//		$this->db->query("INSERT INTO " . DB_PREFIX . "article SET summary = '" . $this->db->escape($data['summary']) . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', article_status_id = '" . (int)$data['article_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', author_id = '" . (int)$data['author_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW()");
// points = '" . (int)$data['points'] . "', 
		$this->db->query("INSERT INTO " . DB_PREFIX . "article SET 
date_available = '" . $this->db->escape($data['date_available']) . "', 
author_id = '" . (int)$data['author_id'] . "', 
status = '" . (int)$data['status'] . "', 
headline = '" . (int)$data['headline'] . "', 
sort_order = '" . (int)$data['sort_order'] . "', 
date_added = NOW()");

		$article_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "article SET image = '" . $this->db->escape($data['image']) . "' WHERE article_id = '" . (int)$article_id . "'");
		}

		foreach ($data['article_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "article_description SET 
article_id = '" . (int)$article_id . "', 
language_id = '" . (int)$language_id . "', 
name = '" . $this->db->escape($value['name']) . "', 
summary = '" . $this->db->escape($data['summary']) . "', 
meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', 
meta_description = '" . $this->db->escape($value['meta_description']) . "', 
description = '" . $this->db->escape($value['description']) . "'");
		}

		if (isset($data['article_store'])) {
			foreach ($data['article_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_to_store SET article_id = '" . (int)$article_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
/*
		if (isset($data['article_attribute'])) {
			foreach ($data['article_attribute'] as $article_attribute) {
				if ($article_attribute['attribute_id']) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "article_attribute WHERE article_id = '" . (int)$article_id . "' AND attribute_id = '" . (int)$article_attribute['attribute_id'] . "'");

				foreach ($article_attribute['article_attribute_description'] as $language_id => $article_attribute_description) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "article_attribute SET article_id = '" . (int)$article_id . "', attribute_id = '" . (int)$article_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($article_attribute_description['text']) . "'");
				}
			}
		}
		}
*/
/*
		if (isset($data['article_option'])) {
			foreach ($data['article_option'] as $article_option) {
				if ($article_option['type'] == 'select' || $article_option['type'] == 'radio' || $article_option['type'] == 'checkbox') {
					$this->db->query("INSERT INTO " . DB_PREFIX . "article_option SET article_id = '" . (int)$article_id . "', option_id = '" . (int)$article_option['option_id'] . "', required = '" . (int)$article_option['required'] . "'");

					$article_option_id = $this->db->getLastId();

					if (isset($article_option['article_option_value'])) {
					foreach ($article_option['article_option_value'] as $article_option_value) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "article_option_value SET article_option_id = '" . (int)$article_option_id . "', article_id = '" . (int)$article_id . "', option_id = '" . (int)$article_option['option_id'] . "', option_value_id = '" . $this->db->escape($article_option_value['option_value_id']) . "', quantity = '" . (int)$article_option_value['quantity'] . "', subtract = '" . (int)$article_option_value['subtract'] . "', price = '" . (float)$article_option_value['price'] . "', price_prefix = '" . $this->db->escape($article_option_value['price_prefix']) . "', points = '" . (int)$article_option_value['points'] . "', points_prefix = '" . $this->db->escape($article_option_value['points_prefix']) . "', weight = '" . (float)$article_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($article_option_value['weight_prefix']) . "'");
					}
					}
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "article_option SET article_id = '" . (int)$article_id . "', option_id = '" . (int)$article_option['option_id'] . "', option_value = '" . $this->db->escape($article_option['option_value']) . "', required = '" . (int)$article_option['required'] . "'");
				}
			}
		}
*/
/*
		if (isset($data['article_discount'])) {
			foreach ($data['article_discount'] as $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_discount SET article_id = '" . (int)$article_id . "', customer_group_id = '" . (int)$value['customer_group_id'] . "', quantity = '" . (int)$value['quantity'] . "', priority = '" . (int)$value['priority'] . "', price = '" . (float)$value['price'] . "', date_start = '" . $this->db->escape($value['date_start']) . "', date_end = '" . $this->db->escape($value['date_end']) . "'");
			}
		}
*/
/*
		if (isset($data['article_headline'])) {
			foreach ($data['article_headline'] as $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_headline SET article_id = '" . (int)$article_id . "', customer_group_id = '" . (int)$value['customer_group_id'] . "', priority = '" . (int)$value['priority'] . "', price = '" . (float)$value['price'] . "', date_start = '" . $this->db->escape($value['date_start']) . "', date_end = '" . $this->db->escape($value['date_end']) . "'");
			}
		}
*/
/*
		if (isset($data['article_image'])) {
			foreach ($data['article_image'] as $image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_image SET article_id = '" . (int)$article_id . "', image = '" . $this->db->escape($image) . "'");
			}
		}
*/
		if (isset($data['article_image'])) {
			foreach ($data['article_image'] as $article_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_image SET article_id = '" . (int)$article_id . "', image = '" . $this->db->escape(html_entity_decode($article_image['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int)$article_image['sort_order'] . "'");
			}
		}

		if (isset($data['article_download'])) {
			foreach ($data['article_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_to_download SET article_id = '" . (int)$article_id . "', download_id = '" . (int)$download_id . "'");
			}
		}

		if (isset($data['article_category'])) {
			foreach ($data['article_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_to_category SET article_id = '" . (int)$article_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		if (isset($data['article_related'])) {
			foreach ($data['article_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "article_related WHERE article_id = '" . (int)$article_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_related SET article_id = '" . (int)$article_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "article_related WHERE article_id = '" . (int)$related_id . "' AND related_id = '" . (int)$article_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_related SET article_id = '" . (int)$related_id . "', related_id = '" . (int)$article_id . "'");
			}
		}

		if (isset($data['article_reward'])) {
			foreach ($data['article_reward'] as $customer_group_id => $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_reward SET article_id = '" . (int)$article_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$value['points'] . "'");
			}
		}

		if (isset($data['article_layout'])) {
			foreach ($data['article_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "article_to_layout SET article_id = '" . (int)$article_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}

		foreach ($data['article_tag'] as $language_id => $value) {
			if ($value) {
				$tags = explode(',', $value);

				foreach ($tags as $tag) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "article_tag SET article_id = '" . (int)$article_id . "', language_id = '" . (int)$language_id . "', tag = '" . $this->db->escape(trim($tag)) . "'");
				}
			}
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'article_id=" . (int)$article_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('article');
	}

	public function editArticle($article_id, $data) {
//		$this->db->query("UPDATE " . DB_PREFIX . "article SET summary = '" . $this->db->escape($data['summary']) . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', article_status_id = '" . (int)$data['article_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', author_id = '" . (int)$data['author_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', tax_class_id = '" . (int)$data['tax_class_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE article_id = '" . (int)$article_id . "'");
/*
		$this->db->query("UPDATE " . DB_PREFIX . "article SET summary = '" . $this->db->escape($data['summary']) . "',
date_available = '" . $this->db->escape($data['date_available']) . "', author_id = '" . (int)$data['author_id'] . "',
points = '" . (int)$data['points'] . "',
status = '" . (int)$data['status'] . "', headline = '" . (int)$data['headline'] . "',
sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE article_id = '" . (int)$article_id . "'");
*/
		$this->db->query("UPDATE " . DB_PREFIX . "article SET 
date_available = '" . $this->db->escape($data['date_available']) . "', 
author_id = '" . (int)$data['author_id'] . "', 
status = '" . (int)$data['status'] . "', 
headline = '" . (int)$data['headline'] . "', 
sort_order = '" . (int)$data['sort_order'] . "', 
date_modified = NOW() 
WHERE article_id = '" . (int)$article_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "article SET image = '" . $this->db->escape($data['image']) . "' WHERE article_id = '" . (int)$article_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "article_description WHERE article_id = '" . (int)$article_id . "'");

		foreach ($data['article_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "article_description SET 
article_id = '" . (int)$article_id . "', 
language_id = '" . (int)$language_id . "', 
name = '" . $this->db->escape($value['name']) . "', 
summary = '" . $this->db->escape($data['summary']) . "', 
meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', 
meta_description = '" . $this->db->escape($value['meta_description']) . "', 
description = '" . $this->db->escape($value['description']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "article_to_store WHERE article_id = '" . (int)$article_id . "'");

		if (isset($data['article_store'])) {
			foreach ($data['article_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_to_store SET article_id = '" . (int)$article_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
/*
		$this->db->query("DELETE FROM " . DB_PREFIX . "article_attribute WHERE article_id = '" . (int)$article_id . "'");

		if (isset($data['article_attribute'])) {
			foreach ($data['article_attribute'] as $article_attribute) {
				if ($article_attribute['attribute_id']) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "article_attribute WHERE article_id = '" . (int)$article_id . "' AND attribute_id = '" . (int)$article_attribute['attribute_id'] . "'");

				foreach ($article_attribute['article_attribute_description'] as $language_id => $article_attribute_description) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "article_attribute SET article_id = '" . (int)$article_id . "', attribute_id = '" . (int)$article_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($article_attribute_description['text']) . "'");
				}
			}
		}
		}
*/
/*
		$this->db->query("DELETE FROM " . DB_PREFIX . "article_option WHERE article_id = '" . (int)$article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "article_option_value WHERE article_id = '" . (int)$article_id . "'");

		if (isset($data['article_option'])) {
			foreach ($data['article_option'] as $article_option) {
				if ($article_option['type'] == 'select' || $article_option['type'] == 'radio' || $article_option['type'] == 'checkbox') {
					$this->db->query("INSERT INTO " . DB_PREFIX . "article_option SET article_option_id = '" . (int)$article_option['article_option_id'] . "', article_id = '" . (int)$article_id . "', option_id = '" . (int)$article_option['option_id'] . "', required = '" . (int)$article_option['required'] . "'");

					$article_option_id = $this->db->getLastId();

					if (isset($article_option['article_option_value'])) {
					foreach ($article_option['article_option_value'] as $article_option_value) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "article_option_value SET article_option_value_id = '" . (int)$article_option_value['article_option_value_id'] . "', article_option_id = '" . (int)$article_option_id . "', article_id = '" . (int)$article_id . "', option_id = '" . (int)$article_option['option_id'] . "', option_value_id = '" . $this->db->escape($article_option_value['option_value_id']) . "', quantity = '" . (int)$article_option_value['quantity'] . "', subtract = '" . (int)$article_option_value['subtract'] . "', price = '" . (float)$article_option_value['price'] . "', price_prefix = '" . $this->db->escape($article_option_value['price_prefix']) . "', points = '" . (int)$article_option_value['points'] . "', points_prefix = '" . $this->db->escape($article_option_value['points_prefix']) . "', weight = '" . (float)$article_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($article_option_value['weight_prefix']) . "'");
					}
					}
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "article_option SET article_option_id = '" . (int)$article_option['article_option_id'] . "', article_id = '" . (int)$article_id . "', option_id = '" . (int)$article_option['option_id'] . "', option_value = '" . $this->db->escape($article_option['option_value']) . "', required = '" . (int)$article_option['required'] . "'");
				}
			}
		}
*/
/*
		$this->db->query("DELETE FROM " . DB_PREFIX . "article_discount WHERE article_id = '" . (int)$article_id . "'");

		if (isset($data['article_discount'])) {
			foreach ($data['article_discount'] as $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_discount SET article_id = '" . (int)$article_id . "', customer_group_id = '" . (int)$value['customer_group_id'] . "', quantity = '" . (int)$value['quantity'] . "', priority = '" . (int)$value['priority'] . "', price = '" . (float)$value['price'] . "', date_start = '" . $this->db->escape($value['date_start']) . "', date_end = '" . $this->db->escape($value['date_end']) . "'");
			}
		}
*/
/*
		$this->db->query("DELETE FROM " . DB_PREFIX . "article_headline WHERE article_id = '" . (int)$article_id . "'");

		if (isset($data['article_headline'])) {
			foreach ($data['article_headline'] as $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_headline SET article_id = '" . (int)$article_id . "', customer_group_id = '" . (int)$value['customer_group_id'] . "', priority = '" . (int)$value['priority'] . "', price = '" . (float)$value['price'] . "', date_start = '" . $this->db->escape($value['date_start']) . "', date_end = '" . $this->db->escape($value['date_end']) . "'");
			}
		}
*/
		$this->db->query("DELETE FROM " . DB_PREFIX . "article_image WHERE article_id = '" . (int)$article_id . "'");
/*
		if (isset($data['article_image'])) {
			foreach ($data['article_image'] as $image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_image SET article_id = '" . (int)$article_id . "', image = '" . $this->db->escape($image) . "'");
			}
		}
*/
		if (isset($data['article_image'])) {
			foreach ($data['article_image'] as $article_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_image SET article_id = '" . (int)$article_id . "', image = '" . $this->db->escape(html_entity_decode($article_image['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int)$article_image['sort_order'] . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "article_to_download WHERE article_id = '" . (int)$article_id . "'");

		if (isset($data['article_download'])) {
			foreach ($data['article_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_to_download SET article_id = '" . (int)$article_id . "', download_id = '" . (int)$download_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "article_to_category WHERE article_id = '" . (int)$article_id . "'");

		if (isset($data['article_category'])) {
			foreach ($data['article_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_to_category SET article_id = '" . (int)$article_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "article_related WHERE article_id = '" . (int)$article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "article_related WHERE related_id = '" . (int)$article_id . "'");

		if (isset($data['article_related'])) {
			foreach ($data['article_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "article_related WHERE article_id = '" . (int)$article_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_related SET article_id = '" . (int)$article_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "article_related WHERE article_id = '" . (int)$related_id . "' AND related_id = '" . (int)$article_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_related SET article_id = '" . (int)$related_id . "', related_id = '" . (int)$article_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "article_reward WHERE article_id = '" . (int)$article_id . "'");

		if (isset($data['article_reward'])) {
			foreach ($data['article_reward'] as $customer_group_id => $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "article_reward SET article_id = '" . (int)$article_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$value['points'] . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "article_to_layout WHERE article_id = '" . (int)$article_id . "'");

		if (isset($data['article_layout'])) {
			foreach ($data['article_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "article_to_layout SET article_id = '" . (int)$article_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "article_tag WHERE article_id = '" . (int)$article_id. "'");

		foreach ($data['article_tag'] as $language_id => $value) {
			if ($value) {
				$tags = explode(',', $value);

				foreach ($tags as $tag) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "article_tag SET article_id = '" . (int)$article_id . "', language_id = '" . (int)$language_id . "', tag = '" . $this->db->escape(trim($tag)) . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'article_id=" . (int)$article_id. "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'article_id=" . (int)$article_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('article');
	}

	public function copyArticle($article_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "article p LEFT JOIN " . DB_PREFIX . "article_description pd ON (p.article_id = pd.article_id) WHERE p.article_id = '" . (int)$article_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		if ($query->num_rows) {
			$data = array();

			$data = $query->row;

			$data['keyword'] = '';

			$data['status'] = '0';
			$data['headline'] = '0';

//			$data = array_merge($data, array('article_attribute' => $this->getArticleAttributes($article_id)));
			$data = array_merge($data, array('article_description' => $this->getArticleDescriptions($article_id)));
//			$data = array_merge($data, array('article_discount' => $this->getArticleDiscounts($article_id)));
			$data = array_merge($data, array('article_image' => $this->getArticleImages($article_id)));

			$data['article_image'] = array();

			$results = $this->getArticleImages($article_id);

			foreach ($results as $result) {
				$data['article_image'][] = $result['image'];
			}

//			$data = array_merge($data, array('article_option' => $this->getArticleOptions($article_id)));
			$data = array_merge($data, array('article_related' => $this->getArticleRelated($article_id)));
			$data = array_merge($data, array('article_reward' => $this->getArticleRewards($article_id)));
//			$data = array_merge($data, array('article_headline' => $this->getArticleHeadlines($article_id)));
			$data = array_merge($data, array('article_tag' => $this->getArticleTags($article_id)));
			$data = array_merge($data, array('article_category' => $this->getArticleCategories($article_id)));
			$data = array_merge($data, array('article_download' => $this->getArticleDownloads($article_id)));
			$data = array_merge($data, array('article_layout' => $this->getArticleLayouts($article_id)));
			$data = array_merge($data, array('article_store' => $this->getArticleStores($article_id)));

			$this->addArticle($data);
		}
	}

	public function deleteArticle($article_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "article WHERE article_id = '" . (int)$article_id . "'");
//		$this->db->query("DELETE FROM " . DB_PREFIX . "article_attribute WHERE article_id = '" . (int)$article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "article_description WHERE article_id = '" . (int)$article_id . "'");
//		$this->db->query("DELETE FROM " . DB_PREFIX . "article_discount WHERE article_id = '" . (int)$article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "article_image WHERE article_id = '" . (int)$article_id . "'");
//		$this->db->query("DELETE FROM " . DB_PREFIX . "article_option WHERE article_id = '" . (int)$article_id . "'");
//		$this->db->query("DELETE FROM " . DB_PREFIX . "article_option_value WHERE article_id = '" . (int)$article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "article_related WHERE article_id = '" . (int)$article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "article_related WHERE related_id = '" . (int)$article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "article_reward WHERE article_id = '" . (int)$article_id . "'");
//		$this->db->query("DELETE FROM " . DB_PREFIX . "article_headline WHERE article_id = '" . (int)$article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "article_tag WHERE article_id='" . (int)$article_id. "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "article_to_category WHERE article_id = '" . (int)$article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "article_to_download WHERE article_id = '" . (int)$article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "article_to_layout WHERE article_id = '" . (int)$article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "article_to_store WHERE article_id = '" . (int)$article_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "comment WHERE article_id = '" . (int)$article_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'article_id=" . (int)$article_id. "'");

		$this->cache->delete('article');
	}

	public function getArticle($article_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'article_id=" . (int)$article_id . "') AS keyword FROM " . DB_PREFIX . "article p LEFT JOIN " . DB_PREFIX . "article_description pd ON (p.article_id = pd.article_id) WHERE p.article_id = '" . (int)$article_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getArticles($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "article p LEFT JOIN " . DB_PREFIX . "article_description pd ON (p.article_id = pd.article_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

			if (isset($data['filter_name']) && !is_null($data['filter_name'])) {
				$sql .= " AND LCASE(pd.name) LIKE '" . $this->db->escape(strtolower($data['filter_name'])) . "%'";
			}

			if (isset($data['filter_summary']) && !is_null($data['filter_summary'])) {
				$sql .= " AND LCASE(p.summary) LIKE '" . $this->db->escape(strtolower($data['filter_summary'])) . "%'";
			}
/*
			if (isset($data['filter_price']) && !is_null($data['filter_price'])) {
				$sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
			}
*/
/*
			if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) {
				$sql .= " AND p.quantity = '" . $this->db->escape($data['filter_quantity']) . "'";
			}
*/
			if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
				$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
			}
			if (isset($data['filter_headline']) && !is_null($data['filter_headline'])) {
				$sql .= " AND p.headline = '" . (int)$data['filter_headline'] . "'";
			}

			$sort_data = array(
				'pd.name',
				'p.summary',
//				'p.price',
//				'p.quantity',
				'p.status',
				'p.headline',
				'p.sort_order'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY pd.name";
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

//print_r($query);

			return $query->rows;
		} else {
			$article_data = $this->cache->get('article.' . $this->config->get('config_language_id'));

			if (!$article_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article p LEFT JOIN " . DB_PREFIX . "article_description pd ON (p.article_id = pd.article_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY pd.name ASC");

				$article_data = $query->rows;

				$this->cache->set('article.' . $this->config->get('config_language_id'), $article_data);
			}

			return $article_data;
		}
	}

	public function getArticlesByCategoryId($category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article p LEFT JOIN " . DB_PREFIX . "article_description pd ON (p.article_id = pd.article_id) LEFT JOIN " . DB_PREFIX . "article_to_category p2c ON (p.article_id = p2c.article_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p2c.category_id = '" . (int)$category_id . "' ORDER BY pd.name ASC");

		return $query->rows;
	}

	public function getArticleDescriptions($article_id) {
		$article_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_description WHERE article_id = '" . (int)$article_id . "'");

		foreach ($query->rows as $result) {
			$article_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'description'      => $result['description'],
				'meta_keyword'     => $result['meta_keyword'],
				'meta_description' => $result['meta_description']
			);
		}

		return $article_description_data;
	}
/*
	public function getArticleAttributes($article_id) {
		$article_attribute_data = array();

		$article_attribute_query = $this->db->query("SELECT pa.attribute_id, ad.name FROM " . DB_PREFIX . "article_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (a.attribute_id = ad.attribute_id) WHERE pa.article_id = '" . (int)$article_id . "' AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY pa.attribute_id");

		foreach ($article_attribute_query->rows as $article_attribute) {
			$article_attribute_description_data = array();

			$article_attribute_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_attribute WHERE article_id = '" . (int)$article_id . "' AND attribute_id = '" . (int)$article_attribute['attribute_id'] . "'");

			foreach ($article_attribute_description_query->rows as $article_attribute_description) {
				$article_attribute_description_data[$article_attribute_description['language_id']] = array('text' => $article_attribute_description['text']);
			}

			$article_attribute_data[] = array(
				'attribute_id'                  => $article_attribute['attribute_id'],
				'name'                          => $article_attribute['name'],
				'article_attribute_description' => $article_attribute_description_data
			);
		}

		return $article_attribute_data;
	}
*/
/*
	public function getArticleOptions($article_id) {
		$article_option_data = array();

		$article_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.article_id = '" . (int)$article_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		foreach ($article_option_query->rows as $article_option) {
			if ($article_option['type'] == 'select' || $article_option['type'] == 'radio' || $article_option['type'] == 'checkbox') {
				$article_option_value_data = array();

				$article_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) WHERE pov.article_option_id = '" . (int)$article_option['article_option_id'] . "'");

				foreach ($article_option_value_query->rows as $article_option_value) {
					$article_option_value_data[] = array(
						'article_option_value_id' => $article_option_value['article_option_value_id'],
						'option_value_id'         => $article_option_value['option_value_id'],
						'quantity'                => $article_option_value['quantity'],
						'subtract'                => $article_option_value['subtract'],
						'price'                   => $article_option_value['price'],
						'price_prefix'            => $article_option_value['price_prefix'],
						'points'                  => $article_option_value['points'],
						'points_prefix'           => $article_option_value['points_prefix'],
						'weight'                  => $article_option_value['weight'],
						'weight_prefix'           => $article_option_value['weight_prefix']
					);
				}

				$article_option_data[] = array(
					'article_option_id'    => $article_option['article_option_id'],
					'option_id'            => $article_option['option_id'],
					'name'                 => $article_option['name'],
					'type'                 => $article_option['type'],
					'article_option_value' => $article_option_value_data,
					'required'             => $article_option['required']
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
	public function getArticleImages($article_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_image WHERE article_id = '" . (int)$article_id . "'");

		return $query->rows;
	}
/*
	public function getArticleDiscounts($article_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_discount WHERE article_id = '" . (int)$article_id . "' ORDER BY quantity, priority, price");

		return $query->rows;
	}
*/
/*
	public function getArticleHeadlines($article_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_headline WHERE article_id = '" . (int)$article_id . "' ORDER BY priority, price");

		return $query->rows;
	}
*/
	public function getArticleRewards($article_id) {
		$article_reward_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_reward WHERE article_id = '" . (int)$article_id . "'");

		foreach ($query->rows as $result) {
			$article_reward_data[$result['customer_group_id']] = array('points' => $result['points']);
		}

		return $article_reward_data;
	}

	public function getArticleDownloads($article_id) {
		$article_download_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_to_download WHERE article_id = '" . (int)$article_id . "'");

		foreach ($query->rows as $result) {
			$article_download_data[] = $result['download_id'];
		}

		return $article_download_data;
	}

	public function getArticleStores($article_id) {
		$article_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_to_store WHERE article_id = '" . (int)$article_id . "'");

		foreach ($query->rows as $result) {
			$article_store_data[] = $result['store_id'];
		}

		return $article_store_data;
	}

	public function getArticleLayouts($article_id) {
		$article_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_to_layout WHERE article_id = '" . (int)$article_id . "'");

		foreach ($query->rows as $result) {
			$article_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $article_layout_data;
	}

	public function getArticleCategories($article_id) {
		$article_category_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_to_category WHERE article_id = '" . (int)$article_id . "'");

		foreach ($query->rows as $result) {
			$article_category_data[] = $result['category_id'];
		}

		return $article_category_data;
	}

	public function getArticleRelated($article_id) {
		$article_related_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_related WHERE article_id = '" . (int)$article_id . "'");

		foreach ($query->rows as $result) {
			$article_related_data[] = $result['related_id'];
		}

		return $article_related_data;
	}

	public function getArticleTags($article_id) {
		$article_tag_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "article_tag WHERE article_id = '" . (int)$article_id . "'");

		$tag_data = array();

		foreach ($query->rows as $result) {
			$tag_data[$result['language_id']][] = $result['tag'];
		}

		foreach ($tag_data as $language => $tags) {
			$article_tag_data[$language] = implode(',', $tags);
		}

		return $article_tag_data;
	}

	public function getTotalArticles($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "article p LEFT JOIN " . DB_PREFIX . "article_description pd ON (p.article_id = pd.article_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (isset($data['filter_name']) && !is_null($data['filter_name'])) {
			$sql .= " AND LCASE(pd.name) LIKE '%" . $this->db->escape(strtolower($data['filter_name'])) . "%'";
		}

		if (isset($data['filter_summary']) && !is_null($data['filter_summary'])) {
			$sql .= " AND LCASE(p.summary) LIKE '%" . $this->db->escape(strtolower($data['filter_summary'])) . "%'";
		}
/*
		if (isset($data['filter_price']) && !is_null($data['filter_price'])) {
			$sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
		}
*/
/*
		if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) {
			$sql .= " AND p.quantity = '" . $this->db->escape($data['filter_quantity']) . "'";
		}
*/
		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}
		if (isset($data['filter_headline']) && !is_null($data['filter_headline'])) {
			$sql .= " AND p.headline = '" . (int)$data['filter_headline'] . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
/*
	public function getTotalArticlesByArticleStatusId($article_status_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "article WHERE article_status_id = '" . (int)$article_status_id . "'");

		return $query->row['total'];
	}
*/
	public function getTotalArticlesByImageId($image_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "article WHERE image_id = '" . (int)$image_id . "'");

		return $query->row['total'];
	}
/*
	public function getTotalArticlesByTaxClassId($tax_class_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "article WHERE tax_class_id = '" . (int)$tax_class_id . "'");

		return $query->row['total'];
	}
*/
/*
	public function getTotalArticlesByWeightClassId($weight_class_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "article WHERE weight_class_id = '" . (int)$weight_class_id . "'");

		return $query->row['total'];
	}
*/
/*
	public function getTotalArticlesByLengthClassId($length_class_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "article WHERE length_class_id = '" . (int)$length_class_id . "'");

		return $query->row['total'];
	}
*/
	public function getTotalArticlesByDownloadId($download_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "article_to_download WHERE download_id = '" . (int)$download_id . "'");

		return $query->row['total'];
	}

	public function getTotalArticlesByAuthorId($author_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "article WHERE author_id = '" . (int)$author_id . "'");

		return $query->row['total'];
	}
/*
	public function getTotalArticlesByAttributeId($attribute_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "article_attribute WHERE attribute_id = '" . (int)$attribute_id . "'");

		return $query->row['total'];
	}
*/
/*
	public function getTotalArticlesByOptionId($option_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "article_option WHERE option_id = '" . (int)$option_id . "'");

		return $query->row['total'];
	}
*/
	public function getTotalArticlesByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "article_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}

}
