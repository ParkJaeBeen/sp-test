package com.sp.bdi.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/views/**",method=RequestMethod.GET)
public class URIController {
	
	@RequestMapping
	public String goPage(HttpServletRequest request) {
		String uri = request.getRequestURI();
		return uri.substring(7);
	}
}
