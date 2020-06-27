package com.example.vegetableorder.domain;

public class Orders {
    private int orderid;
    private String username;
    private String vegetablename;
    private double weight;
    private double price;
    private double totalprice;
    private int ismember;
    private int state;
    private String time;

    public Orders(){}

    public Orders(String username, String vegetablename, double weight, double price, double totalprice, int ismember, int state, String time) {
        this.username = username;
        this.vegetablename = vegetablename;
        this.weight = weight;
        this.price = price;
        this.totalprice = totalprice;
        this.ismember = ismember;
        this.state = state;
        this.time = time;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
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

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }

    public int getIsmember() {
        return ismember;
    }

    public void setIsmember(int ismember) {
        this.ismember = ismember;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "orderid=" + orderid +
                ", username='" + username + '\'' +
                ", vegetablename='" + vegetablename + '\'' +
                ", weight=" + weight +
                ", price=" + price +
                ", totalprice=" + totalprice +
                ", ismember=" + ismember +
                ", state=" + state +
                ", time='" + time + '\'' +
                '}';
    }
}
