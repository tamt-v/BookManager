/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.users;

/**
 *
 * @author tamtv
 */
public class OrderDTO {
    private String producID;
    private String oName;
    private String oImage;
    private int oQuantity;
    private float oPrice;
    private int oQuantityProduct;
    private float totalMoney;

    public OrderDTO() {
    }

    public OrderDTO(String producID, String oName, String oImage, int oQuantity, float oPrice, int oQuantityProduct, float totalMoney) {
        this.producID = producID;
        this.oName = oName;
        this.oImage = oImage;
        this.oQuantity = oQuantity;
        this.oPrice = oPrice;
        this.oQuantityProduct = oQuantityProduct;
        this.totalMoney = totalMoney;
    }

    public String getProducID() {
        return producID;
    }

    public void setProducID(String producID) {
        this.producID = producID;
    }

    

    public float getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(float totalMoney) {
        this.totalMoney = totalMoney;
    }

    

    public String getoName() {
        return oName;
    }

    public void setoName(String oName) {
        this.oName = oName;
    }

    public String getoImage() {
        return oImage;
    }

    public void setoImage(String oImage) {
        this.oImage = oImage;
    }

    public int getoQuantity() {
        return oQuantity;
    }

    public void setoQuantity(int oQuantity) {
        this.oQuantity = oQuantity;
    }

    public float getoPrice() {
        return oPrice;
    }

    public void setoPrice(float oPrice) {
        this.oPrice = oPrice;
    }

    public int getoQuantityProduct() {
        return oQuantityProduct;
    }

    public void setoQuantityProduct(int oQuantityProduct) {
        this.oQuantityProduct = oQuantityProduct;
    }
    
    
}
