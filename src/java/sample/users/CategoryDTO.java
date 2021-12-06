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
public class CategoryDTO {
    private String cID;
    private String cName;

    public CategoryDTO() {
    }

    public CategoryDTO(String cID, String cName) {
        this.cID = cID;
        this.cName = cName;
    }

    public String getcID() {
        return cID;
    }

    public void setcID(String cID) {
        this.cID = cID;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }
    
}
