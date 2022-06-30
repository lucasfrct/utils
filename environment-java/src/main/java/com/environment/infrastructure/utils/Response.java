package com.environment.infrastructure.utils;

import java.util.Map;
import java.util.HashMap;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.FieldNamingPolicy;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Response{

    private static final Logger logger = LoggerFactory.getLogger(Response.class);

    Gson gson = new GsonBuilder().setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES).create();
    
    int statusNum;
    Map<String, String> response;
    
    public Response(Map<String, String> response) {
        try {            
            if (!response.containsKey("status")) {
                throw new Exception("erro ao converter status");
            }

            this.statusNum = Integer.parseInt(response.get("status"));
            this.response = response;
            
        } catch (Exception e) {
            
            logger.error("Response Error", e);

            this.statusNum = 500;
            this.response = Response.error(500, "ONUXXX", "Serviço indisponível no momento, tente mais tarde!");
        }
    }
    public HttpStatus handleStatus(int statusNum) {
        
        if (statusNum == 200) {
            return HttpStatus.OK;
        }
        
        if (statusNum == 201) {
            return HttpStatus.CREATED;
        }
        
        if (statusNum == 204) {
            return HttpStatus.NO_CONTENT;
        }
        
        if (statusNum == 400) {
            return HttpStatus.BAD_REQUEST;
        }
        
        if (statusNum == 403) {
            return HttpStatus.FORBIDDEN;
        }
        
        if (statusNum == 404) {
            return HttpStatus.NOT_FOUND;
        }
        
        if (statusNum == 408) {
            return HttpStatus.REQUEST_TIMEOUT;
        }
        
        if (statusNum >= 100 && statusNum < 200) {
            return HttpStatus.CONTINUE;
        }
        
        if (statusNum >= 200 && statusNum < 300) {
            return HttpStatus.CREATED;
        }
        
        if (statusNum >= 300 && statusNum < 400) {
            return HttpStatus.PERMANENT_REDIRECT;
        }
        
        if (statusNum >= 400 && statusNum < 500) {
            return HttpStatus.BAD_REQUEST;
        }
        
        return HttpStatus.INTERNAL_SERVER_ERROR;
    }

    public Object handleMessage(Map<String, String> response) {
        
        Object message = "";

        if (this.statusNum == 200) {

            if (response.containsKey("data")) {
                message = response.get("data");
            }
            return message;
        }

        if (this.statusNum == 201 || this.statusNum == 204) {
            return message;
        }

        if (this.statusNum >= 400) {

            Map<String, String> messageError = new HashMap<String, String>();

            if (response.containsKey("code")) {
                messageError.put("code", response.get("code"));
            }

            if (response.containsKey("message")) {
                messageError.put("message", response.get("message"));                
            }

            return messageError;
        }

        return message;
    }

    public static ResponseEntity<String> json(Map<String, String> responsen) {
        
        try {
            Response response = new Response(responsen);
            
            String body = response.handleMessage(response.response).toString();            
            
            if (!body.isEmpty() && !response.isJson(body)) {            
                body = response.gson.toJson(response.handleMessage(response.response));
            }

            return ResponseEntity.status(response.handleStatus(response.statusNum)).body(body);

        } catch (Exception e) {            
            logger.error("erro ao converter para json", e);
            
            Response response = new Response(Response.error("ONU016"));
            String body = response.gson.toJson(response.handleMessage(response.response));        
            return ResponseEntity.status(response.handleStatus(response.statusNum)).body(body);
        }
        
    }

    public static Map<String, String> error(int status, String code, String message) {

        Map<String, String> newMap = new HashMap<String, String>();
        newMap.put("status", status);
        newMap.put("code", code);
        newMap.put("message", message);

        return newMap;

    }

    public static Map<String, String> errorDefault(String code) {

        String status = "500";
        String message = "Serviço indisponível no momento, tente mais tarde!";
        return Response.map(status, code, message);

    }

    public static Map<String, String> result(String status, String data) {

        Map<String, String> newMap = new HashMap<String, String>();
        newMap.put("status", status);

        if (!data.isEmpty()) {
            newMap.put("data", data);            
        }

        return newMap;
    }

    public boolean isJson(String Json) {
        try {
            this.gson.fromJson(Json, Object.class);
            Object jsonObjType = this.gson.fromJson(Json, Object.class).getClass();
            if(jsonObjType.equals(String.class)){
                return false;
            }
            return true;
        } catch (com.google.gson.JsonSyntaxException ex) {
            return false;
        }
    }
}