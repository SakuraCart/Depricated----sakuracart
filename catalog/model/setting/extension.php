<?php
class ModelSettingExtension extends Model {
	public function getExtensions($type) {
// ----------------------------------------------------------------------------------------------------
		$extension_data = $this->cache->get('extensions.' . $type . '.' . $this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id'));
		if (!$extension_data) {
// ----------------------------------------------------------------------------------------------------
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "extension WHERE `type` = '" . $this->db->escape($type) . "'");
// ----------------------------------------------------------------------------------------------------
			$extension_data = $query->rows;
			$this->cache->set('extensions', $extension_data);
		}
		return $extension_data;
// ----------------------------------------------------------------------------------------------------
//		return $query->rows;
	}
}
?>