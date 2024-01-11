/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package deim.urv.cat.homework2.service;

import deim.urv.cat.homework2.model.Rental;
import deim.urv.cat.homework2.model.User;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.GenericType;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.Base64;

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
    
    public Rental findRental(String id, User user){
        String credentials = user.getUsername()+ ":" + user.getEmail();
        String encodedCredentials = Base64.getEncoder().encodeToString(credentials.getBytes());
        Response response = webTarget.path(id)
                .request(MediaType.APPLICATION_JSON)
                .header("Authorization", "Basic " + encodedCredentials)
                .get();
        if (response.getStatus() == 200) {
            return response.readEntity(Rental.class);
        }
        return null;
    }

    public ArrayList<Rental> findAllRental(Long idUser, User user){
        String credentials = user.getUsername()+ ":" + user.getEmail();
        String encodedCredentials = Base64.getEncoder().encodeToString(credentials.getBytes());
        Response response = webTarget.queryParam("idUser",Long.toString(idUser))
                .request(MediaType.APPLICATION_JSON)
                .header("Authorization", "Basic " + encodedCredentials)
                .get();
        if (response.getStatus() == 200) {
            return response.readEntity(new GenericType<ArrayList<Rental>>() {});
        }
        return null;
    }
  
    

    public Response postRental(Rental rental, User user) {
        String credentials = user.getUsername()+ ":" + user.getEmail();
        String encodedCredentials = Base64.getEncoder().encodeToString(credentials.getBytes());

        Response response = webTarget.request(MediaType.APPLICATION_JSON)
                .header("Authorization", "Basic " + encodedCredentials)
                .post(Entity.entity(
                        rental,
                        MediaType.APPLICATION_JSON
                ));

        return response;
    }
}
