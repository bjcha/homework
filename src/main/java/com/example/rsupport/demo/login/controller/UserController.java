package com.example.rsupport.demo.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.rsupport.demo.login.vo.LoginVo;

@Controller
public class UserController {
	@GetMapping("/login")
	public String login(@ModelAttribute("loginForm") LoginVo loginForm, Model model) {
		return "login";
	}

	@GetMapping("/home")
	public String home(@ModelAttribute("loginForm") LoginVo loginForm, Model model) {
		return "login";
	}
}
