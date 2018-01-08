package org.learn.dataTable.dao;

import java.util.List;

import org.learn.dataTable.dto.Product;


public interface ProductDAO {
	Product get(int productId);
	List<Product> list();
	boolean add(Product product);
	boolean update(Product product);
	boolean delete(Product product);
}
