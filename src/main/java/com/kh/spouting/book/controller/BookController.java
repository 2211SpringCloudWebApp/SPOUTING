package com.kh.spouting.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {

	@RequestMapping(value="/book/bookView")
	public String bookView() {
		return "book/bookView";
	}
}
