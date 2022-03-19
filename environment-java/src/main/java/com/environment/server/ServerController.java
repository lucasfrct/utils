package com.environment.server;


import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class ServerController {
    
    @RequestMapping("/")
    public String index() {
        return "server 8080\n";
    }
    
}
