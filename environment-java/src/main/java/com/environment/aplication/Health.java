package com.environment.aplication;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;

import java.util.Date;

// import com.environment.infrastructure.utils.Response;

@RestController
public class Health {
    
    @RequestMapping("/health")
    public ResponseEntity<Object> index() {
        
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        String currentdate = formatter.format(date);


        return ResponseEntity.status(200).body("UP: "+currentdate);

        // return Response.json(Response.result("200", "UP: "+currentdate));
    }
    
}
