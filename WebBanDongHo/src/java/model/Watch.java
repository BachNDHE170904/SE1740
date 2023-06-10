/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Watch {
    private int id;
    private float price;
    private String sku;
    private String name;

    public Watch() {
    }

    public Watch(int id, float price, String sku, String name) {
        this.id = id;
        this.price = price;
        this.sku = sku;
        this.name = name;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    

    @Override
    public String toString() {
        return "Watch{" + "id=" + id + ", price=" + price + ", name=" + name + '}';
    }
    
}
