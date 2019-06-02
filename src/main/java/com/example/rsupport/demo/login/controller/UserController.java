package com.example.rsupport.demo.login.controller;


import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.example.rsupport.demo.login.vo.LoginVo;

@Controller
@EnableAutoConfiguration
public class UserController {
	
    
	@GetMapping("/")
	public String login(@ModelAttribute("loginForm") LoginVo loginForm, Model model) {

		return "login";
	}

	@GetMapping("/home")
	public String home(@ModelAttribute("loginForm") LoginVo loginForm, Model model) {

		return "home/grid";
	}
}
