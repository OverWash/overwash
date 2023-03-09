package com.meta.overwash.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.meta.overwash.domain.CrewDTO;
import com.meta.overwash.domain.UserDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class CrewServiceTests {
	
	@Autowired
	private CrewService crewService;
	
	@Test
	public void insertTest() throws Exception{
		
		CrewDTO crew = new CrewDTO();
		UserDTO user = new UserDTO();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		Date birth = date.parse("1996-04-09");
		
		user.setEmail("crew03@gmail.com");
		user.setPassword("1q2w3e4r");
		
		
//		crew.setCrewContact("010-1111-1111");
//		crew.setCrewName("홍길동");
//		crew.setCrewBirth(birth);
//		crew.setCarType("소나타");
//		crew.setCarNumber("1234");
		
		crew.setCrewContact("010-2222-2222");
		crew.setCrewName("여성빈");
		crew.setCrewBirth(birth);
		crew.setCarType("아반떼");
		crew.setCarNumber("1111");
		
		crewService.insert(user, crew);
		
		log.info(",," + user + ",," + crew);
		
	}
//	@Test
//	public void deleteTest() throws Exception{
//		log.info(",,,,,,,,,,,,,,,,,,,,,," + crewService.remove(2L));
//	}
//	@Test
//	public void getTest() throws Exception {
//		log.info(",,,,,,,,,,,,,,,," + crewService.get(3L));
//	}
//	@Test
//	public void modifytest() throws Exception {
//		CrewDTO crewDTO = new CrewDTO();
//		
//		crewDTO.setCrewId(3L);
//		crewDTO.setCrewContact("010-3333-4444");
//		crewDTO.setPassword("aaaa1111");
//		crewDTO.setCarType("벤츠");
//		crewDTO.setCarNumber("7777");
//		
//		log.info("............." + crewService.modify(crewDTO));
//	}
	
	
//	@Test
//	public void getTest() throws Exception{
//		
//		Map<String, Object> crewInfo = crewService.get(1L);
//		
//		System.out.println(crewInfo);
//	}

	
}

























