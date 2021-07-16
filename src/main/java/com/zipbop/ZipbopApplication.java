package com.zipbop;

import com.zipbop.purchase.domain.mapper.CartMapper;
import com.zipbop.purchase.domain.mapper.OrderMapper;
import com.zipbop.purchase.domain.mapper.ProductMapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@MapperScan(basePackageClasses = { CartMapper.class, ProductMapper.class, OrderMapper.class })
@SpringBootApplication
public class ZipbopApplication {

	public static void main(String[] args) {
		SpringApplication.run(ZipbopApplication.class, args);
	}
}
