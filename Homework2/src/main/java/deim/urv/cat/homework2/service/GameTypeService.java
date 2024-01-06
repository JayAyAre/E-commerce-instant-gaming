package deim.urv.cat.homework2.service;

import deim.urv.cat.homework2.model.GameType;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.GenericType;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.MediaType;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class GameTypeService {
    private final WebTarget webTarget;
    private final jakarta.ws.rs.client.Client client;
    private static final String BASE_URI = "http://localhost:8080/projecte/webresources";
    
    public GameTypeService() {
        client = jakarta.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("gametype");
    }
    
    public Collection<GameType> findGameTypes(List<Long> ids) {

        List<Long> idsList = new ArrayList<>(ids);

        Response response = webTarget
                .path("findByIds")
                .queryParam("ids", idsList.toArray())
                .request(MediaType.APPLICATION_JSON)
                .get();

        System.out.println("Received types: " + response.toString());

        if (response.getStatus() == 200) {
            return response.readEntity(new GenericType<List<GameType>>() {});
        }

        return null;
    }

}
