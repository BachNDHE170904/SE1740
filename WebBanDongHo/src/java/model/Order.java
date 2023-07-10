/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Order {
    private Watch watch;
    private int id,quantity;
    private boolean status;

    public Order() {
    }

    public Order(Watch watch, int id, int quantity, boolean status) {
        this.watch = watch;
        this.id = id;
        this.quantity = quantity;
        this.status = status;
    }
    

    public Order(Watch watch, int id, int quantity) {
        this.watch = watch;
        this.id = id;
        this.quantity = quantity;
    }

    public Watch getWatch() {
        return watch;
    }

    public void setWatch(Watch watch) {
        this.watch = watch;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
