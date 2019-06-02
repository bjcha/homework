package com.example.rsupport.demo.configuration;

import org.h2.server.web.WebServlet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.example.rsupport.demo.component.UserAuthenticationProvider;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig  extends WebSecurityConfigurerAdapter {
	

    @Autowired
    private UserAuthenticationProvider authenticationProvider;
    
	
	
	

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
        		.antMatchers("/rsupport").permitAll()
        		.antMatchers("/rsupport/h2_console/**").permitAll()
                .antMatchers("/rsupport/css/**", "/rsupport/js/**", "/rsupport/img/**").permitAll()
                .antMatchers("/rsupport/auth/admin/**").hasRole("ADMIN") // 내부적으로 접두어 "ROLE_"가 붙는다.
                .antMatchers("/rsupport/auth/**").hasAnyRole("ADMIN", "USER") // 내부적으로 접두어 "ROLE_"가 붙는다.
                .anyRequest().authenticated();
        http.csrf().disable();
     //   http.csrf();
        http.headers().frameOptions().disable();

        http.formLogin()
                .loginPage("/") // default
                .loginProcessingUrl("/login-processing")
                .failureUrl("/rsupport/login?error") // default
                .defaultSuccessUrl("/home")
                .usernameParameter("email")
                .passwordParameter("password")
                .permitAll();
 
        http.logout()
                .logoutUrl("/rsupport/logout") // default
                .logoutSuccessUrl("/rsupport/")
                .permitAll();
    }
 
    @Override
    protected void configure(AuthenticationManagerBuilder auth) {
        auth.authenticationProvider(authenticationProvider);
    }
	
}
