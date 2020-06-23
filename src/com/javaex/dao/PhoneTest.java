package com.javaex.dao;

import com.javaex.vo.PersonVo;

import java.util.List;

public class PhoneTest {
    public static void main(String[] args) {
        PhoneDao phoneDao = new PhoneDao();
        List<PersonVo> personList = phoneDao.getPersonList();

        System.out.println(personList.toString());
    }
}
