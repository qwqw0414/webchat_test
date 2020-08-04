package com.pro.wc.config;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomErrorController implements ErrorController {

	private String VIEW_PATH = "error/";
	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "error")
	public String handleError(HttpServletRequest request) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		if (status != null) {
			int statusCode = Integer.valueOf(status.toString());
			if (statusCode == HttpStatus.NOT_FOUND.value()) {
				return VIEW_PATH + "404";
			}
			if (statusCode == HttpStatus.FORBIDDEN.value()) {
				return VIEW_PATH + "500";
			}
		}
		return "error";
	}

	@Override
	public String getErrorPath() {
		return "/error";
	}

}
