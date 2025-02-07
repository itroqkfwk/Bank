package com.bank.security;

import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		//csrf 비활성화
        http.csrf(AbstractHttpConfigurer::disable);
        http.formLogin(AbstractHttpConfigurer::disable);
        http.logout(AbstractHttpConfigurer::disable);
        http.sessionManagement((sessionManagement) ->
        sessionManagement.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
);
		
		//요청맵핑값 허용
		http.authorizeHttpRequests(auth->
		                           auth.requestMatchers("/","/").permitAll()  
//		                               .requestMatchers("/**").permitAll()
		                               .anyRequest()
		                               .permitAll()
				                  );
		
		
		return http.build();
	}
	
	// 정적 리소스 spring security 대상에서 제외
	@Bean
	public WebSecurityCustomizer webSecurityCustomizer() {
	  return (web) ->
	                  web
	                      .ignoring()
	                      .requestMatchers(
	                        PathRequest.toStaticResources().atCommonLocations()
	                      );
	}
}

