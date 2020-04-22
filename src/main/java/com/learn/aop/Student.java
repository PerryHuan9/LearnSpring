package com.learn.aop;


public class Student {

    // 1表示小学生，2、中学生 3、大学生
    private int grade;
    private Learning l;

    public Student(int grade, Learning learning) {
        this.grade = grade;
        this.l = learning;
    }

    public void doLearning() {
        try {
            Thread.currentThread().sleep(3000);
            this.l.learning();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
