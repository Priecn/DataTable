package org.learn.dataTable.controller;

import java.util.List;

import org.learn.dataTable.dto.Product;
import org.learn.dataTable.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/json/data")
public class DataController {

	@Autowired
	private ProductService service;
	
	@RequestMapping(value= {"/all/products"}, method=RequestMethod.GET)
	@ResponseBody
	public List<Product> listAllProducts() {
		return service.list();
	}
}
