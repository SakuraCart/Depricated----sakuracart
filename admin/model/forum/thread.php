<?php
class ModelForumThread extends Model {

	public function addThread($data) {
//		$this->db->query("INSERT INTO " . DB_PREFIX . "thread SET model = '" . $this->db->escape($data['model']) . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', user_id = '" . (int)$data['user_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', tax_class_id = '" . $this->db->escape($data['tax_class_id']) . "', sort_order = '" . (int)$data['sort_order'] . "', date_added = NOW()");
/*
$this->db->query("INSERT INTO " . DB_PREFIX . "thread SET model = '" . $this->db->escape($data['model']) . "',
location = '" . $this->db->escape($data['location']) . "',
stock_status_id = '" . (int)$data['stock_status_id'] . "',
date_available = '" . $this->db->escape($data['date_available']) . "',
user_id = '" . (int)$data['user_id'] . "',
points = '" . (int)$data['points'] . "',
date_added = NOW()");
*/
$this->db->query("INSERT INTO " . DB_PREFIX . "thread SET model = '" . $this->db->escape($data['model']) . "',
date_available = '" . $this->db->escape($data['date_available']) . "',
user_id = '" . (int)$data['user_id'] . "',
date_added = NOW()");

		$thread_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "thread SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE thread_id = '" . (int)$thread_id . "'");
		}

		foreach ($data['thread_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "thread_description SET thread_id = '" . (int)$thread_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		if (isset($data['thread_store'])) {
			foreach ($data['thread_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_to_store SET thread_id = '" . (int)$thread_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
/*
		if (isset($data['thread_attribute'])) {
			foreach ($data['thread_attribute'] as $thread_attribute) {
				if ($thread_attribute['attribute_id']) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "thread_attribute WHERE thread_id = '" . (int)$thread_id . "' AND attribute_id = '" . (int)$thread_attribute['attribute_id'] . "'");

				foreach ($thread_attribute['thread_attribute_description'] as $language_id => $thread_attribute_description) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "thread_attribute SET thread_id = '" . (int)$thread_id . "', attribute_id = '" . (int)$thread_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($thread_attribute_description['text']) . "'");
				}
			}
		}
		}

		if (isset($data['thread_option'])) {
			foreach ($data['thread_option'] as $thread_option) {
				if ($thread_option['type'] == 'select' || $thread_option['type'] == 'radio' || $thread_option['type'] == 'checkbox' || $thread_option['type'] == 'image') {
					$this->db->query("INSERT INTO " . DB_PREFIX . "thread_option SET thread_id = '" . (int)$thread_id . "', option_id = '" . (int)$thread_option['option_id'] . "', required = '" . (int)$thread_option['required'] . "'");

					$thread_option_id = $this->db->getLastId();

					if (isset($thread_option['thread_option_value'])) {
						foreach ($thread_option['thread_option_value'] as $thread_option_value) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "thread_option_value SET thread_option_id = '" . (int)$thread_option_id . "', thread_id = '" . (int)$thread_id . "', option_id = '" . (int)$thread_option['option_id'] . "', option_value_id = '" . (int)$thread_option_value['option_value_id'] . "', quantity = '" . (int)$thread_option_value['quantity'] . "', subtract = '" . (int)$thread_option_value['subtract'] . "', price = '" . (float)$thread_option_value['price'] . "', price_prefix = '" . $this->db->escape($thread_option_value['price_prefix']) . "', points = '" . (int)$thread_option_value['points'] . "', points_prefix = '" . $this->db->escape($thread_option_value['points_prefix']) . "', weight = '" . (float)$thread_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($thread_option_value['weight_prefix']) . "'");
						}
					}
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "thread_option SET thread_id = '" . (int)$thread_id . "', option_id = '" . (int)$thread_option['option_id'] . "', option_value = '" . $this->db->escape($thread_option['option_value']) . "', required = '" . (int)$thread_option['required'] . "'");
				}
			}
		}

		if (isset($data['thread_discount'])) {
			foreach ($data['thread_discount'] as $thread_discount) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_discount SET thread_id = '" . (int)$thread_id . "', customer_group_id = '" . (int)$thread_discount['customer_group_id'] . "', quantity = '" . (int)$thread_discount['quantity'] . "', priority = '" . (int)$thread_discount['priority'] . "', price = '" . (float)$thread_discount['price'] . "', date_start = '" . $this->db->escape($thread_discount['date_start']) . "', date_end = '" . $this->db->escape($thread_discount['date_end']) . "'");
			}
		}

		if (isset($data['thread_special'])) {
			foreach ($data['thread_special'] as $thread_special) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_special SET thread_id = '" . (int)$thread_id . "', customer_group_id = '" . (int)$thread_special['customer_group_id'] . "', priority = '" . (int)$thread_special['priority'] . "', price = '" . (float)$thread_special['price'] . "', date_start = '" . $this->db->escape($thread_special['date_start']) . "', date_end = '" . $this->db->escape($thread_special['date_end']) . "'");
			}
		}
*/
		if (isset($data['thread_image'])) {
			foreach ($data['thread_image'] as $thread_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_image SET thread_id = '" . (int)$thread_id . "', image = '" . $this->db->escape(html_entity_decode($thread_image['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int)$thread_image['sort_order'] . "'");
			}
		}
/*
		if (isset($data['thread_download'])) {
			foreach ($data['thread_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_to_download SET thread_id = '" . (int)$thread_id . "', download_id = '" . (int)$download_id . "'");
			}
		}
*/
		if (isset($data['thread_category'])) {
			foreach ($data['thread_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_to_category SET thread_id = '" . (int)$thread_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		if (isset($data['thread_related'])) {
			foreach ($data['thread_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "thread_related WHERE thread_id = '" . (int)$thread_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_related SET thread_id = '" . (int)$thread_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "thread_related WHERE thread_id = '" . (int)$related_id . "' AND related_id = '" . (int)$thread_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_related SET thread_id = '" . (int)$related_id . "', related_id = '" . (int)$thread_id . "'");
			}
		}

		if (isset($data['thread_reward'])) {
			foreach ($data['thread_reward'] as $customer_group_id => $thread_reward) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_reward SET thread_id = '" . (int)$thread_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$thread_reward['points'] . "'");
			}
		}

		if (isset($data['thread_layout'])) {
			foreach ($data['thread_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "thread_to_layout SET thread_id = '" . (int)$thread_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}

		foreach ($data['thread_tag'] as $language_id => $value) {
			if ($value) {
				$tags = explode(',', $value);

				foreach ($tags as $tag) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "thread_tag SET thread_id = '" . (int)$thread_id . "', language_id = '" . (int)$language_id . "', tag = '" . $this->db->escape(trim($tag)) . "'");
				}
			}
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'thread_id=" . (int)$thread_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('thread');
	}

	public function editThread($thread_id, $data) {
//		$this->db->query("UPDATE " . DB_PREFIX . "thread SET model = '" . $this->db->escape($data['model']) . "', sku = '" . $this->db->escape($data['sku']) . "', upc = '" . $this->db->escape($data['upc']) . "', location = '" . $this->db->escape($data['location']) . "', quantity = '" . (int)$data['quantity'] . "', minimum = '" . (int)$data['minimum'] . "', subtract = '" . (int)$data['subtract'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_available = '" . $this->db->escape($data['date_available']) . "', user_id = '" . (int)$data['user_id'] . "', shipping = '" . (int)$data['shipping'] . "', price = '" . (float)$data['price'] . "', points = '" . (int)$data['points'] . "', weight = '" . (float)$data['weight'] . "', weight_class_id = '" . (int)$data['weight_class_id'] . "', length = '" . (float)$data['length'] . "', width = '" . (float)$data['width'] . "', height = '" . (float)$data['height'] . "', length_class_id = '" . (int)$data['length_class_id'] . "', status = '" . (int)$data['status'] . "', tax_class_id = '" . $this->db->escape($data['tax_class_id']) . "', sort_order = '" . (int)$data['sort_order'] . "', date_modified = NOW() WHERE thread_id = '" . (int)$thread_id . "'");
/*
$this->db->query("UPDATE " . DB_PREFIX . "thread SET model = '" . $this->db->escape($data['model']) . "',
location = '" . $this->db->escape($data['location']) . "',
stock_status_id = '" . (int)$data['stock_status_id'] . "',
date_available = '" . $this->db->escape($data['date_available']) . "',
user_id = '" . (int)$data['user_id'] . "',
points = '" . (int)$data['points'] . "',
sort_order = '" . (int)$data['sort_order'] . "',
date_modified = NOW() WHERE thread_id = '" . (int)$thread_id . "'");
*/
$this->db->query("UPDATE " . DB_PREFIX . "thread SET model = '" . $this->db->escape($data['model']) . "',
date_available = '" . $this->db->escape($data['date_available']) . "',
user_id = '" . (int)$data['user_id'] . "',
sort_order = '" . (int)$data['sort_order'] . "',
date_modified = NOW() WHERE thread_id = '" . (int)$thread_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "thread SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE thread_id = '" . (int)$thread_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_description WHERE thread_id = '" . (int)$thread_id . "'");

		foreach ($data['thread_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "thread_description SET thread_id = '" . (int)$thread_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_to_store WHERE thread_id = '" . (int)$thread_id . "'");

		if (isset($data['thread_store'])) {
			foreach ($data['thread_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_to_store SET thread_id = '" . (int)$thread_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
/*
		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_attribute WHERE thread_id = '" . (int)$thread_id . "'");

		if (!empty($data['thread_attribute'])) {
			foreach ($data['thread_attribute'] as $thread_attribute) {
				if ($thread_attribute['attribute_id']) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "thread_attribute WHERE thread_id = '" . (int)$thread_id . "' AND attribute_id = '" . (int)$thread_attribute['attribute_id'] . "'");

				foreach ($thread_attribute['thread_attribute_description'] as $language_id => $thread_attribute_description) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "thread_attribute SET thread_id = '" . (int)$thread_id . "', attribute_id = '" . (int)$thread_attribute['attribute_id'] . "', language_id = '" . (int)$language_id . "', text = '" .  $this->db->escape($thread_attribute_description['text']) . "'");
				}
			}
		}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_option WHERE thread_id = '" . (int)$thread_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_option_value WHERE thread_id = '" . (int)$thread_id . "'");

		if (isset($data['thread_option'])) {
			foreach ($data['thread_option'] as $thread_option) {
				if ($thread_option['type'] == 'select' || $thread_option['type'] == 'radio' || $thread_option['type'] == 'checkbox' || $thread_option['type'] == 'image') {
					$this->db->query("INSERT INTO " . DB_PREFIX . "thread_option SET thread_option_id = '" . (int)$thread_option['thread_option_id'] . "', thread_id = '" . (int)$thread_id . "', option_id = '" . (int)$thread_option['option_id'] . "', required = '" . (int)$thread_option['required'] . "'");

					$thread_option_id = $this->db->getLastId();

					if (isset($thread_option['thread_option_value'])) {
						foreach ($thread_option['thread_option_value'] as $thread_option_value) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "thread_option_value SET thread_option_value_id = '" . (int)$thread_option_value['thread_option_value_id'] . "', thread_option_id = '" . (int)$thread_option_id . "', thread_id = '" . (int)$thread_id . "', option_id = '" . (int)$thread_option['option_id'] . "', option_value_id = '" . (int)$thread_option_value['option_value_id'] . "', quantity = '" . (int)$thread_option_value['quantity'] . "', subtract = '" . (int)$thread_option_value['subtract'] . "', price = '" . (float)$thread_option_value['price'] . "', price_prefix = '" . $this->db->escape($thread_option_value['price_prefix']) . "', points = '" . (int)$thread_option_value['points'] . "', points_prefix = '" . $this->db->escape($thread_option_value['points_prefix']) . "', weight = '" . (float)$thread_option_value['weight'] . "', weight_prefix = '" . $this->db->escape($thread_option_value['weight_prefix']) . "'");
						}
					}
//					}
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "thread_option SET thread_option_id = '" . (int)$thread_option['thread_option_id'] . "', thread_id = '" . (int)$thread_id . "', option_id = '" . (int)$thread_option['option_id'] . "', option_value = '" . $this->db->escape($thread_option['option_value']) . "', required = '" . (int)$thread_option['required'] . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_discount WHERE thread_id = '" . (int)$thread_id . "'");

		if (isset($data['thread_discount'])) {
			foreach ($data['thread_discount'] as $thread_discount) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_discount SET thread_id = '" . (int)$thread_id . "', customer_group_id = '" . (int)$thread_discount['customer_group_id'] . "', quantity = '" . (int)$thread_discount['quantity'] . "', priority = '" . (int)$thread_discount['priority'] . "', price = '" . (float)$thread_discount['price'] . "', date_start = '" . $this->db->escape($thread_discount['date_start']) . "', date_end = '" . $this->db->escape($thread_discount['date_end']) . "'");
			}
		}

/*
		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_special WHERE thread_id = '" . (int)$thread_id . "'");

		if (isset($data['thread_special'])) {
			foreach ($data['thread_special'] as $thread_special) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_special SET thread_id = '" . (int)$thread_id . "', customer_group_id = '" . (int)$thread_special['customer_group_id'] . "', priority = '" . (int)$thread_special['priority'] . "', price = '" . (float)$thread_special['price'] . "', date_start = '" . $this->db->escape($thread_special['date_start']) . "', date_end = '" . $this->db->escape($thread_special['date_end']) . "'");
			}
		}
*/
		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_image WHERE thread_id = '" . (int)$thread_id . "'");

		if (isset($data['thread_image'])) {
			foreach ($data['thread_image'] as $thread_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_image SET thread_id = '" . (int)$thread_id . "', image = '" . $this->db->escape(html_entity_decode($thread_image['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int)$thread_image['sort_order'] . "'");
			}
		}

/*
		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_to_download WHERE thread_id = '" . (int)$thread_id . "'");

		if (isset($data['thread_download'])) {
			foreach ($data['thread_download'] as $download_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_to_download SET thread_id = '" . (int)$thread_id . "', download_id = '" . (int)$download_id . "'");
			}
		}
*/
		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_to_category WHERE thread_id = '" . (int)$thread_id . "'");

		if (isset($data['thread_category'])) {
			foreach ($data['thread_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_to_category SET thread_id = '" . (int)$thread_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_related WHERE thread_id = '" . (int)$thread_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_related WHERE related_id = '" . (int)$thread_id . "'");

		if (isset($data['thread_related'])) {
			foreach ($data['thread_related'] as $related_id) {
				$this->db->query("DELETE FROM " . DB_PREFIX . "thread_related WHERE thread_id = '" . (int)$thread_id . "' AND related_id = '" . (int)$related_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_related SET thread_id = '" . (int)$thread_id . "', related_id = '" . (int)$related_id . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "thread_related WHERE thread_id = '" . (int)$related_id . "' AND related_id = '" . (int)$thread_id . "'");
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_related SET thread_id = '" . (int)$related_id . "', related_id = '" . (int)$thread_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_reward WHERE thread_id = '" . (int)$thread_id . "'");

		if (isset($data['thread_reward'])) {
			foreach ($data['thread_reward'] as $customer_group_id => $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "thread_reward SET thread_id = '" . (int)$thread_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$value['points'] . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_to_layout WHERE thread_id = '" . (int)$thread_id . "'");

		if (isset($data['thread_layout'])) {
			foreach ($data['thread_layout'] as $store_id => $layout) {
				if ($layout['layout_id']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "thread_to_layout SET thread_id = '" . (int)$thread_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout['layout_id'] . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_tag WHERE thread_id = '" . (int)$thread_id. "'");

		foreach ($data['thread_tag'] as $language_id => $value) {
			if ($value) {
				$tags = explode(',', $value);

				foreach ($tags as $tag) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "thread_tag SET thread_id = '" . (int)$thread_id . "', language_id = '" . (int)$language_id . "', tag = '" . $this->db->escape(trim($tag)) . "'");
				}
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'thread_id=" . (int)$thread_id. "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'thread_id=" . (int)$thread_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('thread');
	}

	public function copyThread($thread_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "thread p LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id) WHERE p.thread_id = '" . (int)$thread_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		if ($query->num_rows) {
			$data = array();

			$data = $query->row;

			$data['keyword'] = '';

			$data['status'] = '0';

			$data = array_merge($data, array('thread_attribute' => $this->getThreadAttributes($thread_id)));
			$data = array_merge($data, array('thread_description' => $this->getThreadDescriptions($thread_id)));
//			$data = array_merge($data, array('thread_discount' => $this->getThreadDiscounts($thread_id)));
			$data = array_merge($data, array('thread_image' => $this->getThreadImages($thread_id)));
			$data = array_merge($data, array('thread_option' => $this->getThreadOptions($thread_id)));
			$data = array_merge($data, array('thread_related' => $this->getThreadRelated($thread_id)));
			$data = array_merge($data, array('thread_reward' => $this->getThreadRewards($thread_id)));
//			$data = array_merge($data, array('thread_special' => $this->getThreadSpecials($thread_id)));
			$data = array_merge($data, array('thread_tag' => $this->getThreadTags($thread_id)));
			$data = array_merge($data, array('thread_category' => $this->getThreadCategories($thread_id)));
//			$data = array_merge($data, array('thread_download' => $this->getThreadDownloads($thread_id)));
			$data = array_merge($data, array('thread_layout' => $this->getThreadLayouts($thread_id)));
			$data = array_merge($data, array('thread_store' => $this->getThreadStores($thread_id)));

			$this->addThread($data);
		}
	}

	public function deleteThread($thread_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "thread WHERE thread_id = '" . (int)$thread_id . "'");
//		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_attribute WHERE thread_id = '" . (int)$thread_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_description WHERE thread_id = '" . (int)$thread_id . "'");
//		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_discount WHERE thread_id = '" . (int)$thread_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_image WHERE thread_id = '" . (int)$thread_id . "'");
//		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_option WHERE thread_id = '" . (int)$thread_id . "'");
//		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_option_value WHERE thread_id = '" . (int)$thread_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_related WHERE thread_id = '" . (int)$thread_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_related WHERE related_id = '" . (int)$thread_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_reward WHERE thread_id = '" . (int)$thread_id . "'");
//		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_special WHERE thread_id = '" . (int)$thread_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_tag WHERE thread_id='" . (int)$thread_id. "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_to_category WHERE thread_id = '" . (int)$thread_id . "'");
//		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_to_download WHERE thread_id = '" . (int)$thread_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_to_layout WHERE thread_id = '" . (int)$thread_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "thread_to_store WHERE thread_id = '" . (int)$thread_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "review WHERE thread_id = '" . (int)$thread_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'thread_id=" . (int)$thread_id. "'");

		$this->cache->delete('thread');
	}

	public function getThread($thread_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'thread_id=" . (int)$thread_id . "') AS keyword FROM " . DB_PREFIX . "thread p LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id) WHERE p.thread_id = '" . (int)$thread_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getThreads($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "thread p LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id)";
			if (!empty($data['filter_category_id'])) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "thread_to_category p2c ON (p.thread_id = p2c.thread_id)";
			}

			$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
			if (!empty($data['filter_title'])) {
				$sql .= " AND LCASE(pd.title) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_title'])) . "%'";
			}

			if (!empty($data['filter_model'])) {
				$sql .= " AND LCASE(p.model) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_model'])) . "%'";
			}
/*
			if (!empty($data['filter_price'])) {
				$sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
			}

			if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) {
				$sql .= " AND p.quantity = '" . $this->db->escape($data['filter_quantity']) . "'";
			}
*/
			if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
				$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
			}

			if (!empty($data['filter_category_id'])) {
				if (!empty($data['filter_sub_category'])) {
					$implode_data = array();

					$implode_data[] = "category_id = '" . (int)$data['filter_category_id'] . "'";

					$this->load->model('catalog/category');

					$categories = $this->model_catalog_category->getCategories($data['filter_category_id']);

					foreach ($categories as $category) {
						$implode_data[] = "p2c.category_id = '" . (int)$category['category_id'] . "'";
					}

					$sql .= " AND (" . implode(' OR ', $implode_data) . ")";
				} else {
					$sql .= " AND p2c.category_id = '" . (int)$data['filter_category_id'] . "'";
				}
			}
			$sql .= " GROUP BY p.thread_id";

			$sort_data = array(
				'pd.title',
				'p.model',
//				'p.price',
//				'p.quantity',
				'p.status',
				'p.sort_order'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY pd.title";
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
			$thread_data = $this->cache->get('thread.' . (int)$this->config->get('config_language_id'));
			if (!$thread_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread p LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY pd.title ASC");

				$thread_data = $query->rows;
				$this->cache->set('thread.' . (int)$this->config->get('config_language_id'), $thread_data);
			}
			return $thread_data;
		}
	}

	public function getThreadsByCategoryId($category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread p LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id) LEFT JOIN " . DB_PREFIX . "thread_to_category p2c ON (p.thread_id = p2c.thread_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p2c.category_id = '" . (int)$category_id . "' ORDER BY pd.title ASC");

		return $query->rows;
	}

	public function getThreadDescriptions($thread_id) {
		$thread_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_description WHERE thread_id = '" . (int)$thread_id . "'");

		foreach ($query->rows as $result) {
			$thread_description_data[$result['language_id']] = array(
				'title'             => $result['title'],
				'description'      => $result['description'],
				'meta_keyword'     => $result['meta_keyword'],
				'meta_description' => $result['meta_description']
			);
		}

		return $thread_description_data;
	}
/*
	public function getThreadAttributes($thread_id) {
		$thread_attribute_data = array();

		$thread_attribute_query = $this->db->query("SELECT pa.attribute_id, ad.title FROM " . DB_PREFIX . "thread_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (a.attribute_id = ad.attribute_id) WHERE pa.thread_id = '" . (int)$thread_id . "' AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY pa.attribute_id");

		foreach ($thread_attribute_query->rows as $thread_attribute) {
			$thread_attribute_description_data = array();

			$thread_attribute_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_attribute WHERE thread_id = '" . (int)$thread_id . "' AND attribute_id = '" . (int)$thread_attribute['attribute_id'] . "'");

			foreach ($thread_attribute_description_query->rows as $thread_attribute_description) {
				$thread_attribute_description_data[$thread_attribute_description['language_id']] = array('text' => $thread_attribute_description['text']);
			}

			$thread_attribute_data[] = array(
				'attribute_id'                  => $thread_attribute['attribute_id'],
				'title'                          => $thread_attribute['title'],
				'thread_attribute_description' => $thread_attribute_description_data
			);
		}

		return $thread_attribute_data;
	}

	public function getThreadOptions($thread_id) {
		$thread_option_data = array();
		$thread_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.thread_id = '" . (int)$thread_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY o.sort_order");
		foreach ($thread_option_query->rows as $thread_option) {
			if ($thread_option['type'] == 'select' || $thread_option['type'] == 'radio' || $thread_option['type'] == 'checkbox' || $thread_option['type'] == 'image') {
				$thread_option_value_data = array();
				$thread_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.thread_option_id = '" . (int)$thread_option['thread_option_id'] . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY ov.sort_order");

				foreach ($thread_option_value_query->rows as $thread_option_value) {
					$thread_option_value_data[] = array(
						'thread_option_value_id' => $thread_option_value['thread_option_value_id'],
						'option_value_id'         => $thread_option_value['option_value_id'],
						'title'                    => $thread_option_value['title'],
						'image'                   => $thread_option_value['image'],
						'quantity'                => $thread_option_value['quantity'],
						'subtract'                => $thread_option_value['subtract'],
						'price'                   => $thread_option_value['price'],
						'price_prefix'            => $thread_option_value['price_prefix'],
						'points'                  => $thread_option_value['points'],
						'points_prefix'           => $thread_option_value['points_prefix'],
						'weight'                  => $thread_option_value['weight'],
						'weight_prefix'           => $thread_option_value['weight_prefix']
					);
				}

				$thread_option_data[] = array(
					'thread_option_id'    => $thread_option['thread_option_id'],
					'option_id'            => $thread_option['option_id'],
					'title'                 => $thread_option['title'],
					'type'                 => $thread_option['type'],
					'thread_option_value' => $thread_option_value_data,
					'required'             => $thread_option['required']
				);
			} else {
				$thread_option_data[] = array(
					'thread_option_id' => $thread_option['thread_option_id'],
					'option_id'         => $thread_option['option_id'],
					'title'              => $thread_option['title'],
					'type'              => $thread_option['type'],
					'option_value'      => $thread_option['option_value'],
					'required'          => $thread_option['required']
				);
			}
		}

		return $thread_option_data;
	}
*/
	public function getThreadImages($thread_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_image WHERE thread_id = '" . (int)$thread_id . "'");

		return $query->rows;
	}
/*
	public function getThreadDiscounts($thread_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_discount WHERE thread_id = '" . (int)$thread_id . "' ORDER BY quantity, priority, price");

		return $query->rows;
	}

	public function getThreadSpecials($thread_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_special WHERE thread_id = '" . (int)$thread_id . "' ORDER BY priority, price");

		return $query->rows;
	}
*/
	public function getThreadRewards($thread_id) {
		$thread_reward_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_reward WHERE thread_id = '" . (int)$thread_id . "'");

		foreach ($query->rows as $result) {
			$thread_reward_data[$result['customer_group_id']] = array('points' => $result['points']);
		}

		return $thread_reward_data;
	}
/*
	public function getThreadDownloads($thread_id) {
		$thread_download_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_to_download WHERE thread_id = '" . (int)$thread_id . "'");

		foreach ($query->rows as $result) {
			$thread_download_data[] = $result['download_id'],
		}

		return $thread_download_data;
	}
*/
	public function getThreadStores($thread_id) {
		$thread_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_to_store WHERE thread_id = '" . (int)$thread_id . "'");

		foreach ($query->rows as $result) {
			$thread_store_data[] = $result['store_id'];
		}

		return $thread_store_data;
	}

	public function getThreadLayouts($thread_id) {
		$thread_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_to_layout WHERE thread_id = '" . (int)$thread_id . "'");

		foreach ($query->rows as $result) {
			$thread_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $thread_layout_data;
	}

	public function getThreadCategories($thread_id) {
		$thread_category_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_to_category WHERE thread_id = '" . (int)$thread_id . "'");

		foreach ($query->rows as $result) {
			$thread_category_data[] = $result['category_id'];
		}

		return $thread_category_data;
	}

	public function getThreadRelated($thread_id) {
		$thread_related_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_related WHERE thread_id = '" . (int)$thread_id . "'");

		foreach ($query->rows as $result) {
			$thread_related_data[] = $result['related_id'];
		}

		return $thread_related_data;
	}

	public function getThreadTags($thread_id) {
		$thread_tag_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "thread_tag WHERE thread_id = '" . (int)$thread_id . "'");

		$tag_data = array();

		foreach ($query->rows as $result) {
			$tag_data[$result['language_id']][] = $result['tag'];
		}

		foreach ($tag_data as $language => $tags) {
			$thread_tag_data[$language] = implode(',', $tags);
		}

		return $thread_tag_data;
	}

	public function getTotalThreads($data = array()) {
		$sql = "SELECT COUNT(DISTINCT p.thread_id) AS total FROM " . DB_PREFIX . "thread p LEFT JOIN " . DB_PREFIX . "thread_description pd ON (p.thread_id = pd.thread_id)";

		if (!empty($data['filter_category_id'])) {
			$sql .= " LEFT JOIN " . DB_PREFIX . "thread_to_category p2c ON (p.thread_id = p2c.thread_id)";
		}

		$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
				if (!empty($data['filter_title'])) {
			$sql .= " AND LCASE(pd.title) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_title'])) . "%'";
		}

		if (!empty($data['filter_model'])) {
			$sql .= " AND LCASE(p.model) LIKE '" . $this->db->escape(utf8_strtolower($data['filter_model'])) . "%'";
		}
/*
		if (!empty($data['filter_price'])) {
			$sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
		}

		if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) {
			$sql .= " AND p.quantity = '" . $this->db->escape($data['filter_quantity']) . "'";
		}
*/
		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}

		if (!empty($data['filter_category_id'])) {
			if (!empty($data['filter_sub_category'])) {
				$implode_data = array();

				$implode_data[] = "p2c.category_id = '" . (int)$data['filter_category_id'] . "'";

				$this->load->model('catalog/category');

				$categories = $this->model_catalog_category->getCategories($data['filter_category_id']);

				foreach ($categories as $category) {
					$implode_data[] = "p2c.category_id = '" . (int)$category['category_id'] . "'";
				}

				$sql .= " AND (" . implode(' OR ', $implode_data) . ")";
			} else {
				$sql .= " AND p2c.category_id = '" . (int)$data['filter_category_id'] . "'";
			}
		}
		$query = $this->db->query($sql);
		return $query->row['total'];
	}
	public function getTotalThreadsByTaxClassId($tax_class_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "thread WHERE tax_class_id = '" . (int)$tax_class_id . "'");

		return $query->row['total'];
	}

	public function getTotalThreadsByStockStatusId($stock_status_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "thread WHERE stock_status_id = '" . (int)$stock_status_id . "'");

		return $query->row['total'];
	}

	public function getTotalThreadsByWeightClassId($weight_class_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "thread WHERE weight_class_id = '" . (int)$weight_class_id . "'");

		return $query->row['total'];
	}

	public function getTotalThreadsByLengthClassId($length_class_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "thread WHERE length_class_id = '" . (int)$length_class_id . "'");

		return $query->row['total'];
	}
/*
	public function getTotalThreadsByDownloadId($download_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "thread_to_download WHERE download_id = '" . (int)$download_id . "'");

		return $query->row['total'];
	}
*/
	public function getTotalThreadsByManufacturerId($user_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "thread WHERE user_id = '" . (int)$user_id . "'");

		return $query->row['total'];
	}

	public function getTotalThreadsByAttributeId($attribute_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "thread_attribute WHERE attribute_id = '" . (int)$attribute_id . "'");

		return $query->row['total'];
	}

	public function getTotalThreadsByOptionId($option_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "thread_option WHERE option_id = '" . (int)$option_id . "'");

		return $query->row['total'];
	}

	public function getTotalThreadsByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "thread_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}

}
