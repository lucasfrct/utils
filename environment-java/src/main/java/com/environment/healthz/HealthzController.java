package com.environment.healthz;


import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class HealthzController {
    
    @RequestMapping("/healthz")
    public String index() {
        return "Health: UP 01";
    }
    
}
