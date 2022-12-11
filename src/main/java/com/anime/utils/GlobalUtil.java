package com.anime.utils;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.anime.jpa.entity.Category;
import com.anime.jpa.service.CategoryService;

@Service("Utils")
public class GlobalUtil {

	@Autowired
	private CategoryService categoryService;

	public List<Category> getCategories() {
		List<Category> categories = categoryService.findByIsActive();
		return !categories.isEmpty() ? categories : null;
	}

	public ModelAndView getOutOfStock() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("msgOutOfStock", "Hết Hàng");
		return modelAndView;
	}
}
