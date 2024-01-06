package deim.urv.cat.homework2.service;

import deim.urv.cat.homework2.model.Console;
import deim.urv.cat.homework2.model.Game;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.GenericType;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.MediaType;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class GameService {
    private final WebTarget webTarget;
    private final jakarta.ws.rs.client.Client client;
    private static final String BASE_URI = "http://localhost:8080/projecte/webresources";
    
    public GameService() {
        client = jakarta.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("game");
    }
    
    public Game findGame(String id){
        Response response = webTarget.path(id)
                .request(MediaType.APPLICATION_JSON)
                .get();
        if (response.getStatus() == 200) {
            return response.readEntity(Game.class);
        }
        return null;
    }
    
    public List<Game> getAllgames(){
        Response response = webTarget.request(MediaType.APPLICATION_JSON)
                .get();
        if (response.getStatus() == 200) {
            return response.readEntity(new GenericType<List<Game>>() {});
        }
        return null;
    }
}
