---
language: java
framework: springboot
author: yunjj
---

# Springboot + java + mybatis + maven + oracle 
## 1. Mapper class 이용방식
### 1. spring starter project 생성
- project 생성시 입력해야 할 부분
    - Group: src/main/java 패키지에 속하게 될 패키지를 입력
        e.g) com.sideP
    - Type maven, package War, Java Version 8, 
    - package com.sideP.laws
    - Dependencies: 
        H2 Database, Lombok, MybatisFramework
        Oracle Driver, Spring Batch, Spring Boot DevTools
        Spring Web, Spirng for RabbitMQ
### 2. root 디렉토리에 다음과 같은 파일 생성
- application.yml, mybatis-config.xml 생성
    - application.yml의 경우 properties의 문법에서의 .이 개행으로 변환된다. 
        ```
            spring:
                datasource:
                    hikari1: 
                         jdbc-url: 
                         driver-class-name: 
                         username:
                         password:
                         minimumIdle: 
                         maximumPoolSize: 
                         idelTimeout: 
                         maxLifeTime:
                         connectionTimeout:        
        ```
    - mybatis-config.xml은 다음과 같이 작성한다. 
         ```
             <configuration>
                 <settings>
                     <setting name="mapUnderscoreToCamelCase" value="true" />
                     <setting name="jdbcTypeForNull" value="NULL" />
                 </settings>
                 </configuration>
         ```
### 3. pom.xml에 원하는 라이브러리 의존성 추가
- 대표적으로 추가해야 할 부분
    - HikariCP, oracle ojdbc, org.json, org.mybatis
    - com.google.code.gson, 
### 4. mvc 패턴에 맞춰서 디렉토리 형성
- com.sideP.laws 하위에 아래와 같이 6개의 폴더를 형성
    -  common, config, controller, mapper, model, service
- resources 폴더 밑에 아래와 같이 4개의 폴더가 있는지 확인
    - lib, mapper, static, templates
- root 디렉토리에 webapp있는지 확인
    - WEB-INF/views/index.jsp를 그 webapp 폴더 안에 형성
### 5. db연결을 위한 java 파일 및 xml 파일 작성
- config/CommonConfiguration1 자바파일 작성
```
@EnableAsync
@MapperScan(basePackages="com.sideP.laws.mapper.**")
@PropertySource("classpath:/application.yml")
@Configuration
public class CommonConfiguration1 {

	@Primary
	@Bean(name = "dataSource1") 
	@ConfigurationProperties(prefix ="spring.datasource.hikari1") 
	public DataSource dataSource1() { // javax.sql package에 포함

		HikariDataSource hikariDataSource = new HikariDataSource();
		return hikariDataSource;

	}

	@Autowired
	private ApplicationContext applicationContext; // apache.catalina 패키지 아니고, org.springframework 패키지여야 한다.

	@Bean(name = "sqlSessionFactory1")
	@Primary
	public SqlSessionFactory sqlSessionFactory1(@Autowired @Qualifier("dataSource1") DataSource dataSource)
			throws Exception {

		System.out.println("sqlSessionFactory1: " + dataSource.getConnection().getMetaData().toString());
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource);
		sqlSessionFactoryBean.setTypeAliasesPackage("com.sideP.laws.model");
		sqlSessionFactoryBean.setConfigLocation(applicationContext.getResource("classpath:mybatis-config.xml"));
		sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:mapper/laws/*.xml"));

		return sqlSessionFactoryBean.getObject();

	}

	@Bean(name = "template1")
	@Primary
	public SqlSessionTemplate sqlSessionTemplate1(
			@Autowired @Qualifier("sqlSessionFactory1") SqlSessionFactory sqlSessionFactory) {
		System.out.println("sqlSessionTemplate1"+sqlSessionFactory.getConfiguration().getDatabaseId());
		return new SqlSessionTemplate(sqlSessionFactory);
	}

}
```
_ _ 
- controller 디렉토리에, LawsController.java 파일 작성
```
@RestController
public class LawsController {
	
	  @Autowired
	  LawsService lawsService;
		
	  private final CommonConfiguration1 comnConfig = new CommonConfiguration1();
	  
		@RequestMapping("/")
		public String getTime1() {
			
			System.out.println("comnConfig: " + comnConfig.toString());
            //String configStr = comnConfig.toString() 이것도 가능(Variables 창에서 확인 가능)
			System.out.println("lawsService.getDefaultVal() : + lawsService.getDefaultVal()");
			return lawsService.getDefaultVal();
		}
		
}
```
_ _ 
- Service 클래스에 LawsService.java  작성
```
@Service
public class LawsService {

	@Autowired
	LawsMapper lawsMapper;
	
	public String getDefaultVal() {
		try {
			return lawsMapper.getDefaultVal();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return lawsMapper.getDefaultVal();
	}
```
- Mapper 디렉토리에 LawsMapper.java 작성
```
  package com.skplanet.dcmf.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public class TimeMapper {
	
	@Autowired
	@Qualifier("template1")
	private SqlSessionTemplate template1;
	
	
	public String getDefaultVal() {
		
		try {
			
			System.out.println(template1.getConfiguration().getDatabaseId()); //null
			System.out.println(template1.getConfiguration().toString());
			return template1.selectOne("getDefaultVal");
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return null;
		}
		
	}
	
}
 
```
_ _ 
- resoures/mapper/laws 디렉토리에 LawsMapper.xml 작성
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.sideP.laws.mapper.LawsMapper">
	<select id="getDefaultVal" resultType="String">
		SELECT CREATOR_NAME FROM LAWS_CREATE_LIST WHERE WAIT_NUM = '2192' AND CREATE_TIME = '20230224'
	</select>	
</mapper> 
```