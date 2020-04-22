package com.learn.beanConfig;

import com.learn.di.DragonQuest;
import com.learn.di.Knight;
import com.learn.di.PatrolQuest;
import com.learn.di.Quest;
import org.springframework.context.annotation.Bean;

public class KnightConfig {
    // 默认的bean id为方法名，但可以通过注解参数指定
    @Bean(name = "a-patrolQuest")
    public Quest patrolQuest() {
        return new PatrolQuest();
    }

    @Bean
    public Quest dragonQuest() {
        return new DragonQuest(System.out);
    }

    @Bean
    public Knight knight() {
        int choice = (int)Math.floor(Math.random()*2);
        Quest quest;
        if (choice == 0) {
           quest = patrolQuest();
        } else {
           quest = dragonQuest();
        }
        return  new Knight(quest);
    }
}
