package org.learn.dataTable.service;

import java.util.List;

import org.learn.dataTable.dto.Product;

public interface ProductService {
	Product get(int productId);
	List<Product> list();
	boolean add(Product product);
	boolean update(int productId, Product product);
	boolean delete(int product);
}
