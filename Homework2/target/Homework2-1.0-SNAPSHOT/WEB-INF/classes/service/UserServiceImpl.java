package deim.urv.cat.homework2.service;

import deim.urv.cat.homework2.model.User;
import deim.urv.cat.homework2.controller.UserForm;
import deim.urv.cat.homework2.controller.UserUpdateForm;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.client.Entity;
import java.util.Base64;
import utilities.SecurityUtil;

public class UserServiceImpl implements UserService {
    private final WebTarget webTarget;
    private final jakarta.ws.rs.client.Client client;
    private static final String BASE_URI = "http://localhost:8080/projecte/webresources";
    
    public UserServiceImpl() {
        client = jakarta.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("customer");
    }
    
    @Override
    public User findUserByEmail(String email){
        Response response = webTarget.path("email/" + email)
                .request(MediaType.APPLICATION_JSON)
                .get();
        if (response.getStatus() == 200) {
            return response.readEntity(User.class);
        }
        return null;
    }
    
    @Override
    public User validateUser(UserForm user){
        User foundUser = findUserByEmail(user.getEmail());

        if (foundUser == null) {
            return null;
        }
        
        if (SecurityUtil.validatePassword(user.getPassword(), foundUser.getPassword())) {
            return foundUser;
        }
 
        return null;
    }

    @Override
    public boolean addUser(UserForm user) {
        user.setPassword(SecurityUtil.hashPassword(user.getPassword()));
        Response response = webTarget.request(MediaType.APPLICATION_JSON).post(
        Entity.entity(
            user, 
            MediaType.APPLICATION_JSON
        ), 
        Response.class);
     return response.getStatus() == 201;
    }

    @Override
    public boolean updateUser(UserUpdateForm user, User authUser) {
        System.out.println("Los gordos son personas");
        String credentials = authUser.getUsername()+ ":" + authUser.getEmail();
        String encodedCredentials = Base64.getEncoder().encodeToString(credentials.getBytes());
        
        user.setPassword(SecurityUtil.hashPassword(user.getPassword()));
        Response response = webTarget.path(String.valueOf(authUser.getId())).request(MediaType.APPLICATION_JSON)
            .header("Authorization", "Basic " + encodedCredentials)
            .put(Entity.entity(
            user, 
            MediaType.APPLICATION_JSON
        ), 
        Response.class);
        return response.getStatus() == 200;
    }

}
