package com.example.vegetableorder.domain;

public class Recommendation {
    private int vegetableid;
    private String vegetablename;
    private String image;
    private double price;

    public int getVegetableid() {
        return vegetableid;
    }

    public void setVegetableid(int vegetableid) {
        this.vegetableid = vegetableid;
    }

    public String getVegetablename() {
        return vegetablename;
    }

    public void setVegetablename(String vegetablename) {
        this.vegetablename = vegetablename;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Recommendation{" +
                "vegetableid=" + vegetableid +
                ", vegetablename='" + vegetablename + '\'' +
                ", image='" + image + '\'' +
                ", price=" + price +
                '}';
    }
}
