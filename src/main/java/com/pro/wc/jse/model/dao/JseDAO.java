package com.pro.wc.jse.model.dao;

import java.util.List;
import java.util.Map;

public interface JseDAO {

	List<Map<String, String>> selectAllProduct() throws Exception;

}
