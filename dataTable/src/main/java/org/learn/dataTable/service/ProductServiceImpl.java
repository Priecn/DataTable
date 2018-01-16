package org.learn.dataTable.service;

import java.util.List;

import org.learn.dataTable.dao.ProductDAO;
import org.learn.dataTable.dto.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO dao;

	@Override
	@Transactional
	public Product get(int productId) {
		return dao.get(productId);
	}

	@Override
	@Transactional
	public List<Product> list() {
		return dao.list();
	}

	@Override
	@Transactional
	public boolean add(Product product) {
		return dao.add(product);
	}

	@Override
	@Transactional
	public boolean update(int productId, Product product) {
		try {
			return dao.update(productId, product);
		} catch (Exception e) {
			System.out.println("service: " + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	@Override
	@Transactional
	public boolean delete(int productId) {
		try {
			Product product = dao.get(productId);
			return dao.delete(product);
		} catch (Exception e) {
			System.out.println("delete: " + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

}
