package deim.urv.cat.homework2.service;

import deim.urv.cat.homework2.model.Console;
import deim.urv.cat.homework2.model.Game;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.GenericType;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.MediaType;
import java.util.Collection;
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
    
    public int countGames(Long consoleId, List<Long> gameTypeIds){
        
        System.out.println("Estoy en serviciooo");
        String gameCount = buildQuery(consoleId, gameTypeIds)
                .path("count")
                .request(MediaType.TEXT_PLAIN)
                .get(String.class);
        return Integer.parseInt(gameCount);
    }
    
    public List<Game> getAllgames(int page, int pageSize, Long consoleId, List<Long> gameTypeIds){
        Response response = buildQuery(consoleId, gameTypeIds)
                .queryParam("page", page)
                .queryParam("pageSize", pageSize)
                .request(MediaType.APPLICATION_JSON)
                .get();
        if (response.getStatus() == 200) {
            return response.readEntity(new GenericType<List<Game>>() {});
        }
        return null;
    }
    
    private WebTarget buildQuery(Long consoleId, List<Long> gameTypeIds){
        WebTarget queryTarget = webTarget;

        if (consoleId !=null) {
            queryTarget = queryTarget.queryParam("console", consoleId);
        }

        if (gameTypeIds != null && !gameTypeIds.isEmpty()) {
            for (Long typeId : gameTypeIds) {
                queryTarget = queryTarget.queryParam("types", typeId);
            }
        }

        return queryTarget;
    }
}
