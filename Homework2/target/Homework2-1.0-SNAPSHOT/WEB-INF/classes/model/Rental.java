/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package deim.urv.cat.homework2.model;
import java.io.Serializable;
import java.util.Date;
import java.util.Collection;


/**
 *
 * @author jotdi
 */


public class Rental implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private float price;
    private Date startDate;
    private Date finalDate;
    private Collection<Long> gameId;
    private Long customerId;
    private Collection<Game> rentedGames;
    private Customer tenant;
        
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public Collection<Long> getGameId() {
        return gameId;
    }

    public void setGameId(Collection<Long> gameId) {
        this.gameId = gameId;
    }

    public Collection<Game> getRentedGames() {
        return rentedGames;
    }

    public void setRentedGames(Collection<Game> rentedGames) {
        this.rentedGames = rentedGames;
    }
    
    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    
    public Date getFinalDate() {
        return finalDate;
    }
    
    public void setFinalDate(Date finalDate) {
        this.finalDate = finalDate;
    }

    public Collection<Game> getGames() {
        return rentedGames;
    }

    public void setGames(Collection<Game> games) {
        this.rentedGames = games;
    }

    public Customer getTenant() {
        return tenant;
    }

    public void setTenant(Customer tenant) {
        this.tenant = tenant;
    }
    
    @Override
    public String toString() {
        return "Rental[ id=" + id + " ]";
    }
    
}
