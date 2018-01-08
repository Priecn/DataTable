package org.learn.dataTable.controller;

import java.util.List;

import org.learn.dataTable.dao.ProductDAO;
import org.learn.dataTable.dto.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/json/data")
public class DataController {

	@Autowired
	private ProductDAO dao;
	
	@RequestMapping(value= {"/all/products"}, method=RequestMethod.GET)
	@ResponseBody
	public List<Product> listAllProducts() {
		return dao.list();
	}
}
