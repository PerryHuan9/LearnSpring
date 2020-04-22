package com.learn.mvc;

import com.learn.mvc.bean.User;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController
@RequestMapping("/test-post")
public class PostController {

    /**
     * 直接通过servletRequest对象获取参数
     * 响应 /test-get/servlet?name={}&age={} 或将参数放在请求体中，
     * 当query参数和body参数的key一致时，query参数覆盖body参数
     *
     * @param request
     * @return
     */
    @PostMapping("/servlet")
    public Map getByHttpServlet(HttpServletRequest request) {
        String name = request.getParameter("name");
        int age = Integer.valueOf(request.getParameter("age"));
        return Map.of("path", "/test-post/servlet", "name", name, "age", age);
    }

    /**
     * 通过同名参数 响应 /test-get/param?name={}&id={}
     * 当query参数和body参数的key一致时，query参数覆盖body参数，对于字符串会以逗号连接
     *
     * @param age
     * @param name
     * @return
     */
    @RequestMapping(value = "/param", method = RequestMethod.POST)
    public Map home(long age, String name) {
        return Map.of("path", "/test-post/param", "age", age, "name", name);
    }


    /**
     * 使用@RequestParam为参数重命名
     * 当query参数和body参数的key一致时，query参数覆盖body参数，对于字符串会以逗号连接
     *
     * @param name
     * @param countValue
     * @return
     */
    @PostMapping("/obj")
    public Map getObj(
            @RequestParam("name") String name,
            @RequestParam("age") int countValue) {
        return Map.of("path", "/test-post/obj", "name", name, "age", countValue);
    }


    /**
     * bean参数方式
     * 当query参数和body参数的key一致时，query参数覆盖body参数，对于字符串会以逗号连接
     *
     * @param user
     * @return
     */
    @PostMapping("/user/add")
    public User addUser(User user) {
        return user;
    }
}
