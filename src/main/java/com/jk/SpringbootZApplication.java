package com.jk;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.amqp.core.Queue;


@SpringBootApplication
public class SpringbootZApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootZApplication.class, args);
	}
/**
 * 定义一个队列
 */
   @Bean
	public Queue getQueue(){
   	return new Queue("1710") ;
   }

}
