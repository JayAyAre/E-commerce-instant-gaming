package deim.urv.cat.homework2.controller;

import deim.urv.cat.homework2.model.AlertMessage;
import deim.urv.cat.homework2.model.Console;
import deim.urv.cat.homework2.model.Game;
import deim.urv.cat.homework2.model.GameType;
import deim.urv.cat.homework2.model.SignUpAttempts;
import deim.urv.cat.homework2.service.UserService;
import deim.urv.cat.homework2.model.User;
import deim.urv.cat.homework2.service.ConsoleService;
import deim.urv.cat.homework2.service.GameService;
import deim.urv.cat.homework2.service.GameTypeService;

import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.Models;
import jakarta.mvc.UriRef;
import jakarta.mvc.binding.BindingResult;
import jakarta.mvc.binding.ParamError;
import jakarta.mvc.security.CsrfProtected;
import jakarta.validation.Valid;
import jakarta.ws.rs.BeanParam;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Context;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.DefaultValue;
import jakarta.ws.rs.QueryParam;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;

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
        @QueryParam("console") int consoleId,
        @QueryParam("gameType") List<Long> gameTypeIds) {
        
        Collection<Console> consoles = consoleService.getAllConsoles();
        models.put("consoles", consoles); 
        Map<Long, String> consolesMap = consoles.stream()
        .collect(Collectors.toMap(Console::getId, Console::getName));
        models.put("consolesMap", consolesMap);
        Collection<GameType> gameTypes = gameTypeService.getAllGameTypes();
        models.put("gameTypes", gameTypes);
        Map<Long, String> gameTypesMap = gameTypes.stream()
        .collect(Collectors.toMap(GameType::getId, GameType::getName));
        models.put("gameTypesMap", gameTypesMap);
        Collection<Game> games;
        games = gameService.getAllgames(page, pageSize, consoleId, gameTypeIds);
        models.put("games", games); 
        models.put("currentPage", page);
        
        int gameCount = games != null ? games.size() : 0;
        System.out.println("Tamano; "+ gameCount);
        int totalPages = (int) Math.ceil((double) gameCount / 8);

        models.put("totalPages", totalPages);

        return "index.jsp";
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
