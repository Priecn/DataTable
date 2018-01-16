package org.learn.dataTable.daoImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.learn.dataTable.dao.ProductDAO;
import org.learn.dataTable.dto.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Product get(int productId) {
		try {
			return sessionFactory.getCurrentSession().get(Product.class, Integer.valueOf(productId));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Product> list() {
		try {
			String queryToGetListOfProduct = "from Product";
			Query<Product> query = sessionFactory.getCurrentSession().createQuery(queryToGetListOfProduct,
					Product.class);
			return query.getResultList();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean add(Product product) {
		try {
			sessionFactory.getCurrentSession().persist(product);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean update(int productId, Product product) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Product fetchedProduct = get(productId);
			fetchedProduct.setCode(product.getCode());
			fetchedProduct.setBrand(product.getBrand());
			fetchedProduct.setName(product.getName());
			fetchedProduct.setUnitPrice(product.getUnitPrice());
			fetchedProduct.setQuantity(product.getQuantity());
			session.flush();
			return true;
		} catch (Exception ex) {
			System.out.println("dao: " + ex.getMessage());
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(Product product) {
		try {
			sessionFactory.getCurrentSession().delete(product);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return false;
	}
}
