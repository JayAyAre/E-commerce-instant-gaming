package deim.urv.cat.homework2.controller;

import deim.urv.cat.homework2.model.Console;
import deim.urv.cat.homework2.model.Game;
import deim.urv.cat.homework2.model.GameType;
import deim.urv.cat.homework2.service.ConsoleService;
import deim.urv.cat.homework2.service.GameService;
import deim.urv.cat.homework2.service.GameTypeService;

import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.Models;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Context;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.ws.rs.DefaultValue;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.core.UriBuilder;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;

@Controller
@Path("/shop")
public class IndexController {    
    // CDI
    @Inject Logger log;
    @Inject ConsoleService consoleService;
    @Inject GameTypeService gameTypeService;
    @Inject GameService gameService;
    @Inject Models models;
    
    @GET
    public String showIndex(@Context HttpServletRequest request, 
        @QueryParam("page") @DefaultValue("1") int page,
        @QueryParam("pageSize") @DefaultValue("9") int pageSize,
        @QueryParam("console") Long consoleId,
        @QueryParam("gameType") List<Long> gameTypeIds) {
        
        List<Console> consoles = consoleService.getAllConsoles();
        models.put("consoles", consoles);
        Collection<GameType> gameTypes = gameTypeService.getAllGameTypes();
        models.put("gameTypes", gameTypes);
        
        boolean consoleParameter = consoles.stream()
        .anyMatch(console -> console.getId().equals(consoleId));

        if (!consoleParameter && consoleId!=null) {
            return removeConsoleParameter(gameTypeIds);
        }
        
        int totalGameCount = gameService.countGames(consoleId, gameTypeIds);
        int totalPages = (int) Math.ceil((double) totalGameCount / pageSize);
        
        if (page > totalPages) {
            String params = consoleId != null && consoleId > 0 ? "&console=" + consoleId : "";
            for (Long typeId : gameTypeIds) {
                params = params + "&gameType=" + typeId;
            }
            return "redirect:/shop?page="+ totalPages + params;
        }
        
        boolean gameTypeParameter;
        for(Long gameTypeId : gameTypeIds){
            gameTypeParameter = gameTypes.stream()
                .anyMatch(gameType -> gameType.getId().equals(gameTypeId)); 
            if (!gameTypeParameter) {
                return removeGameType(consoleId, gameTypeIds, gameTypeId);
            }
        }
        
        Collection<Game> games;
        games = gameService.getAllgames(page, pageSize, consoleId, gameTypeIds);
        models.put("games", games); 
        
        models.put("currentPage", page);
               
        models.put("totalPages", totalPages);

        return "index.jsp";
    }  
    
    @GET
    @Path("remove-gametype")
    public String removeGameType(@QueryParam("console") Long consoleId,
                                 @QueryParam("gameTypes") List<Long> gameTypeIds,
                                 @QueryParam("gameType") Long gameTypeToRemove) {

        UriBuilder uriBuilder = UriBuilder.fromPath("/shop");

        if (consoleId != null) {
            uriBuilder.queryParam("console", consoleId);
        }

        if (gameTypeIds != null) {
            gameTypeIds.stream()
                .filter(gameTypeId -> !gameTypeId.equals(gameTypeToRemove))
                .forEach(gameTypeId -> uriBuilder.queryParam("gameType", gameTypeId));
        }

        String newUrl = uriBuilder.build().toString();
        return "redirect:" + newUrl;
    }
    
    @GET
    @Path("remove-console")
    public String removeConsoleParameter(@QueryParam("gameType") List<Long> typesIds){
        String params = "";
        for (Long typeId : typesIds) {
            params = params + "&gameType=" + typeId;
        }
        return "redirect:/shop?page=" + params;
    }
    
    @GET
    @Path("remove-gametypes")
    public String removeGameTypes(@QueryParam("console") int consoleId){
        String params = consoleId > 0 ? "&console=" + consoleId : "";
        return "redirect:/shop?page=" + params;
    }
    
    @GET
    @Path("remove-gametypes-/{id}")
    public String removeGameType(@QueryParam("console") int consoleId){
        String params = consoleId > 0 ? "&console=" + consoleId : "";
        return "redirect:/shop?page=" + params;
    }
    
    @GET
    @Path("/next-page")
    public String nextPage(@QueryParam("currentPage") int currentPage, @QueryParam("console") int consoleId, @QueryParam("gameType") List<Long> typesIds){
        int nextPage = currentPage + 1;
        String params = consoleId > 0 ? "&console=" + consoleId : "";
        for (Long typeId : typesIds) {
            params = params + "&gameType=" + typeId;
        }
        return "redirect:/shop?page=" + nextPage + params;
    }
    
    @GET
    @Path("/previous-page")
    public String previous(@QueryParam("currentPage") int currentPage, @QueryParam("console") int consoleId, @QueryParam("gameType") List<Long> typesIds){
        int nextPage = currentPage - 1;
        String params = consoleId > 0 ? "&console=" + consoleId : "";
        for (Long typeId : typesIds) {
            params = params + "&gameType=" + typeId;
        }
        return "redirect:/shop?page=" + nextPage + params;
    }
}
