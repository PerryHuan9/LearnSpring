package com.learn;

import com.learn.beanConfig.KnightConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@SpringBootApplication
@EnableAspectJAutoProxy
@Import(KnightConfig.class)
@ImportResource({"/student.xml"})
@EnableWebMvc
public class LearnSpringApplication {

    public static void main(String[] args) {
        SpringApplication.run(LearnSpringApplication.class, args);
    }

}
