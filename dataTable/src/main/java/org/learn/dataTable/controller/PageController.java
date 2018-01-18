package org.learn.dataTable.controller;

import org.learn.dataTable.dto.Product;
import org.learn.dataTable.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class PageController {

	@Autowired
	private ProductService service;

	@ModelAttribute
	public Product newProduct() {
		return new Product();
	}

	@RequestMapping(method = RequestMethod.GET)
	public String index(Model model) {
		return "home";
	}

	@RequestMapping(value = "/delete/{productId}/product", method = RequestMethod.POST)
	public String delete(@PathVariable int productId) {
		service.delete(productId);
		return "home";
	}

	@RequestMapping(value = "/product/{productId}", method = RequestMethod.GET)
	public @ResponseBody Product getAProduct(@PathVariable int productId) {
		return service.get(productId);
	}

	@RequestMapping(value = "/add/product", method = RequestMethod.POST)
	public String addProduct(@RequestBody Product product) {
		System.out.println(product.getBrand()+" "+product.getName());
		service.add(product);
		return "home";
	}

	@RequestMapping(value = "/update/{productId}/product", method = RequestMethod.POST)
	public String updateProduct(@RequestBody Product product, @PathVariable int productId) {
		try {
			service.update(productId, product);
		} catch (Exception e) {
			System.out.println("Controller: " + e.getMessage());
			e.printStackTrace();
		}
		return "home";
	}

	/*
	 * @RequestMapping(value="/update/product", method = RequestMethod.POST) public
	 * String updateAProduct(@ModelAttribute @Valid Product product) {
	 * System.out.println(product.getBrand()); try { service.update(product); }
	 * catch(Exception e) { System.out.println("Controller: "+e.getMessage());
	 * e.printStackTrace(); } return "home"; }
	 */

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update() {

		return "update";
	}
}
