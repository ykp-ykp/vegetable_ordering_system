package com.example.vegetableorder.domain;

public class Remark {
    private int id;
    private String username;
    private String vegetablename;
    private String remark_time;
    private String order_time;
    private String content;

    public Remark(){}

    public Remark(String username, String vegetablename, String remark_time, String order_time, String content) {
        this.username = username;
        this.vegetablename = vegetablename;
        this.remark_time = remark_time;
        this.order_time = order_time;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getVegetablename() {
        return vegetablename;
    }

    public void setVegetablename(String vegetablename) {
        this.vegetablename = vegetablename;
    }

    public String getRemark_time() {
        return remark_time;
    }

    public void setRemark_time(String remark_time) {
        this.remark_time = remark_time;
    }

    public String getOrder_time() {
        return order_time;
    }

    public void setOrder_time(String order_time) {
        this.order_time = order_time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Remark{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", vegetablename='" + vegetablename + '\'' +
                ", remark_time='" + remark_time + '\'' +
                ", order_time='" + order_time + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
