package com.example.vegetableorder.domain;

import org.springframework.stereotype.Component;

@Component
public class Vegetables {
    private int id;
    private String name;
    private double price;
    private double discount;
    private String image;
    private double surplus;
    private String introduction;

    public Vegetables(){}

    public Vegetables(String name, double price, double discount, String image, double surplus, String introduction) {
        this.name = name;
        this.price = price;
        this.discount = discount;
        this.image = image;
        this.surplus = surplus;
        this.introduction = introduction;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getSurplus() {
        return surplus;
    }

    public void setSurplus(double surplus) {
        this.surplus = surplus;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    @Override
    public String toString() {
        return "Vegetables{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", discount=" + discount +
                ", image='" + image + '\'' +
                ", surplus=" + surplus +
                ", introduction='" + introduction + '\'' +
                '}';
    }

}
