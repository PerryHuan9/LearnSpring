package com.learn.aspectJ;

import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class Audience {

    @Pointcut("execution(* com.learn.aspectJ.Performance.perform(String)) && args(type)")
    public void performance(String type) {
    }

    @Before("performance(type)")
    public void silenceCellPhones(String type) {
        System.out.println("调整手机为静音模式:" + type);
    }

    @Before("performance(type)")
    public void takeSites(String type) {
        System.out.println("在座位上坐好:" + type);
    }

    @AfterReturning("execution(* com.learn.aspectJ.Performance.perform(..))")
//    @AfterReturning("performance()") 与上一行写法效果一致
    public void applause() {
        System.out.println("喝彩");
    }

    @AfterThrowing("performance(type)")
    public void demandRefund(String type) {
        System.out.println("给我退票:" + type);
    }

}
