package deim.urv.cat.homework2.service;

import deim.urv.cat.homework2.model.Console;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.GenericType;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.MediaType;
import java.util.List;


/**
 *
 * @author Usuario
 */
public class ConsoleService {
    private final WebTarget webTarget;
    private final jakarta.ws.rs.client.Client client;
    private static final String BASE_URI = "http://localhost:8080/projecte/webresources";
    
    public ConsoleService() {
        client = jakarta.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("console");
    }
    
    public Console findConsole(Long id) {
        Response response = webTarget.path(String.valueOf(id))
                .request(MediaType.APPLICATION_JSON)
                .get();

        if (response.getStatus() == 200) {
            Console console = response.readEntity(Console.class);
            return console;
        } else {
             System.out.println("Failed to retrieve console. HTTP Status: " + response.getStatus());
            return null;
        }
    }
    
    public List<Console> getAllConsoles() {
        Response response = webTarget.request(MediaType.APPLICATION_JSON)
                .get();
        if (response.getStatus() == 200) {
            return response.readEntity(new GenericType<List<Console>>() {});
        }
        return null;
    }
}

