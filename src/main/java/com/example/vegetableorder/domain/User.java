package com.example.vegetableorder.domain;


public  class User {
    private int id;
    private String name="";
    private String password="";
    private String phone="";
    private String address="";
    private int ismember=0;
    private String tooltips="";
    private String answer="";

    public User(){}

    public User(String name, String password, String phone, String address, String tooltips, String answer) {
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.ismember = 0;
        this.tooltips = tooltips;
        this.answer = answer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getIsmember() {
        return ismember;
    }

    public void setIsmember(int ismember) {
        this.ismember = ismember;
    }

    public String getTooltips() {
        return tooltips;
    }

    public void setTooltips(String tooltips) {
        this.tooltips = tooltips;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", ismember='" + ismember + '\'' +
                ", tooltips='" + tooltips + '\'' +
                ", answer='" + answer + '\'' +
                '}';
    }
}