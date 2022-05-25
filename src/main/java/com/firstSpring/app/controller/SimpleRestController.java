package com.firstSpring.app.controller;

import com.firstSpring.app.domain.Person;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class SimpleRestController {
    @GetMapping("/ajax")
    public String ajax() {
        return "ajax";
    }

    @PostMapping("/send")
    @ResponseBody
    public Person test(@RequestBody Person p) {
        System.out.println("p = " + p);
        p.setName("ABC");
        p.setAge(p.getAge() + 10);
        return p;
    }

    @GetMapping("/openEx")
    public String openEx() {
        return "ajaxGet";
    }

    @GetMapping("/openPost")
    public String openPost() {
        return "ajaxPost";
    }

    @GetMapping("/getAgeByName")
    @ResponseBody
    public Map<String, Object> getAgeByName(@RequestParam String inputName) {
        System.out.println(inputName);

        Map<String, Integer> ageMap = new HashMap<>();
        ageMap.put("tom", 10);
        ageMap.put("bob", 20);
        ageMap.put("kim", 30);

        Map<String, Object> returnMap = new HashMap<>();
        returnMap.put("name", inputName);
        returnMap.put("age", ageMap.get(inputName));

        return returnMap;
    }

    @PostMapping("/postAgeByName")
    @ResponseBody
    public Map<String, Object> postAgeByName(@RequestBody Map<String, Object> inputMap) {
        Map<String, Integer> ageMap = new HashMap<>();
        ageMap.put("tom", 10);
        ageMap.put("bob", 20);
        ageMap.put("kim", 30);

        Map<String, Object> returnMap = new HashMap<>();
        returnMap.put("name", inputMap.get("name"));
        returnMap.put("age", ageMap.get(inputMap.get("name")));

        return returnMap;
    }
}
