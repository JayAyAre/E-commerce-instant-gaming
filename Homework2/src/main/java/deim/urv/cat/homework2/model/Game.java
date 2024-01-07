/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package deim.urv.cat.homework2.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Objects;


/**
 *
 * @author edgar y jordi
 */

public class Game implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;
    private String name;
    private int stock;
    private String description;
    private float price;
    private Address address;

    private Console console;
    private Long consoleId; 
    private Collection<GameType> types;
    private Collection<Long> typeIds;
    private Collection<Long> rentals;
    
    private long image;

    // Getter y Setter para el campo image
    public long getImage() {
        return image;
    }

    public void setImage(long image) {
        this.image = image; 
    }
    
    public Collection<Long> getRentals() {
        return rentals;
    }

    public void setRentals(Collection<Long> rentals) {
        this.rentals = rentals;
    }
    
    public Game(){
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
     public Long getConsoleId() {
        return consoleId;
    }

    public void setConsoleId(Long consoleId) {
        this.consoleId = consoleId;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }
    
    public Collection<Long> getTypeIds() {
        return typeIds;
    }

    public void setTypeIds(Collection<Long> typeIds) {
        this.typeIds = typeIds;
    }

    public Console getConsole() {
        return console;
    }

    public void setConsole(Console console) {
        this.console = console;
    }

    public Collection<GameType> getTypes() {
        return types;
    }

    public void setTypes(Collection<GameType> types) {
        this.types = types;
    }
    
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Game other = (Game) obj;
        return Objects.equals(id, other.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
    
    @Override
    public String toString() {
        return "Game{" + "id=" + id + ", name=" + name + ", image=" + image + '}';
    }
}

