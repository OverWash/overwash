package com.meta.overwash.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.meta.overwash.domain.UserDTO;
import com.meta.overwash.mapper.UserMapper;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailService implements UserDetailsService {

	@Autowired
	private UserMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("CustomUserDetailService 유저네임 정보: " + username);
		UserDTO user = mapper.getUser(username);
		
		return user;
	}

}
