package com.learn.aspectJ;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
public class PerformanceTest {
    @Autowired
    Performance performance;

    @Test
    void testSingPerformance() {
        performance.perform("0");
//        performance.perform("1");
        Assertions.assertNotNull(performance);

    }
}
