package com.environment.aplication;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class Hooks {
    
    @RequestMapping("/hooks")
    public String index() {
        return "UP";
    }

}
