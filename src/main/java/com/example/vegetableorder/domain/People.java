package com.example.vegetableorder.domain;

import org.springframework.stereotype.Component;

@Component
public  class People{
    String name;
    String password;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "People{" +
                "name='" + name + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}