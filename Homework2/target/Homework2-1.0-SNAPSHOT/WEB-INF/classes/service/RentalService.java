/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package deim.urv.cat.homework2.service;

import deim.urv.cat.homework2.model.Game;
import deim.urv.cat.homework2.model.Rental;
import deim.urv.cat.homework2.model.RentalDTO;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.GenericType;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jordi
 */
public class RentalService {
    private final WebTarget webTarget;
    private final jakarta.ws.rs.client.Client client;
    private static final String BASE_URI = "http://localhost:8080/projecte/webresources";
    
    public RentalService() {
        client = jakarta.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("rental");
    }
    
    public Rental findRental(String id){
        Response response = webTarget.path(id)
                .request(MediaType.APPLICATION_JSON)
                .get();
        if (response.getStatus() == 200) {
            return response.readEntity(Rental.class);
        }
        return null;
    }


    public ArrayList<Rental> getAllRentals(){
        Response response = webTarget.request(MediaType.APPLICATION_JSON)
                .get();
        if (response.getStatus() == 200) {
            return response.readEntity(new GenericType<ArrayList<Rental>>() {});
        }
        return null;
    }   
    
    public ArrayList<Rental> getAllRentalsFromUser(Long authUserId){
        String userIdString = String.valueOf(authUserId);
        Response response = webTarget.queryParam("userId", authUserId).request(MediaType.APPLICATION_JSON)
                .get();
        if (response.getStatus() == 200) {
            return response.readEntity(new GenericType<ArrayList<Rental>>() {});
        }
        return null;
    }  
    
    public Rental postRental(Rental rental){
       Response response = webTarget.request(MediaType.APPLICATION_JSON)
               .post(Entity.entity(
                    rental, 
                    MediaType.APPLICATION_JSON
                ));
       if (response.getStatus() == 200) {
           return response.readEntity(Rental.class);
       }
       return null;
    }   
}
