package com.learn.aop;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
public class StudentTest {
    @Autowired
    Student student;

    @Test
    void testLearn() {
        student.doLearning();
        assertNotNull(student);
    }
}
