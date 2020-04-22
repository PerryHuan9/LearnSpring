package com.learn.mvc;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.learn.mvc.bean.User;

/**
 * 学习Get请求获取请求参数
 * 
 */
@RestController
@RequestMapping(value = "/test-get")
public class GetController {

    /**
     * 直接通过servletRequest对象获取参数 响应 /test-get/servlet?name={}&age={}
     * 
     * @param request
     * @return
     */
    @GetMapping("/servlet")
    public String getByHttpServlet(HttpServletRequest request) {
        String name = request.getParameter("name");
        int age = Integer.valueOf(request.getParameter("age"));
        return "name:" + name + ",age:" + age;
    }

    /**
     * 通过同名参数 响应 /test-get/param?name={}&id={}
     * 
     * @param id
     * @param name
     * @return
     */
    @RequestMapping(value = "/param", method = RequestMethod.GET)
    public Map home(long id, String name) {
        return Map.of("id", id, "name", name);
    }

    /**
     * 通过ResponseEntity指定HTTP响应的状态
     * 
     * @return
     */
    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public ResponseEntity test() {
        return new ResponseEntity("HELLO WORLD", HttpStatus.NOT_FOUND);
    }

    /**
     * 通过@PathVariable获取url参数
     * 
     * @param petId
     * @param ownerId
     * @return
     */
    @GetMapping("/owners/{ownerId}/pets/{petId}")
    public Map findPet(@PathVariable Long petId, @PathVariable Long ownerId) {
        return Map.of("ownerId", ownerId, "petId", petId);
    }

    /**
     * 通过bean获取请求参数，未匹配的属性为null
     * 
     * @param user
     * @return
     */
    @GetMapping(path = "/user")
    public User getUser(User user) {
        return user;
    }

    /**
     * 只能响应/pets/{petId}?myParam=myValue
     * 
     * @param petId
     */
    @GetMapping(path = "/pets/{petId}", params = "myParam=myValue")
    public void findPet(@PathVariable String petId) {
        System.out.println("petId:" + petId);
    }

    @GetMapping(value = "/users")
    public List<User> getUsers() {
        List<User> users = new ArrayList<>(10);
        for (int i = 0; i < 10; i++) {
            User user = new User("Perry" + i, (int)(100 * Math.random()), "man", String.valueOf(i));
            users.add(user);
        }
        return users;
    }
}
