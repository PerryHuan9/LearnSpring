package com.learn.aspectJ;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class Worker {

    @Pointcut("execution(* com.learn.aspectJ.Performance.perform(..))")
    public void performance() {
    }

    @Around("performance()")
    public void doEverything(ProceedingJoinPoint joinPoint) {
        try {
            System.out.println("工作人员进行检票");
            System.out.println("维持秩序");
            System.out.println("准备灯光");
            joinPoint.proceed();
            System.out.println("引导气氛");
            System.out.println("安排离场");
        }catch (Throwable e) {
            System.out.println("处理意外");
        }
    }
}
