package com.jk.controller;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
public class TestController {
    @Autowired
    private AmqpTemplate amqpTemplate;
    @RequestMapping("test")
    public void say(){
        amqpTemplate.convertAndSend("1710", UUID.randomUUID().toString());
    }
}
