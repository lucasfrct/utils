package com.environment.aplication;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
public class Health {

    private static final Logger log = LoggerFactory.getLogger(Health.class);
    
    @RequestMapping("/health")
    public String index() {
        log.warn("Health");
        log.info("Health");
        log.error("Health {}", "type error");
        
        return "UP";
    }
    
}
