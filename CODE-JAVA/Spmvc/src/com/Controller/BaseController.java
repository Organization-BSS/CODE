package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/basedo")
public class BaseController {

	@RequestMapping(value = "ok", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public void ok(HttpServletRequest reqeust, HttpServletResponse response) {

		Object keysArrayList = reqeust.getAttributeNames();
		System.out.println(keysArrayList.toString());
		System.out.print("hello");
		// response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String jsonStr = "{\"name\":\"fly\",\"type\":\"³æ×Ó\"}";
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.write(jsonStr);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
		}

	}

}
