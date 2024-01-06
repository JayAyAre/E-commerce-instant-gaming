package deim.urv.cat.homework2.controller;

import deim.urv.cat.homework2.model.AlertMessage;
import deim.urv.cat.homework2.model.Console;
import deim.urv.cat.homework2.model.Game;
import deim.urv.cat.homework2.model.GameType;
import deim.urv.cat.homework2.model.SignUpAttempts;
import deim.urv.cat.homework2.service.ConsoleService;
import deim.urv.cat.homework2.service.GameService;
import deim.urv.cat.homework2.service.GameTypeService;

import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.Models;
import jakarta.mvc.binding.BindingResult;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;

@Controller
@Path("game-details")
public class GameDetailsController {
    @Inject BindingResult bindingResult;
    @Inject Logger log;
    @Inject GameService gameService;
    @Inject ConsoleService consoleService;
    @Inject GameTypeService typeService;
    @Inject Models models;
    @Inject AlertMessage flashMessage;
    @Inject SignUpAttempts attempts;

    @GET
    @Path("{id}")
    public String GameDetails(@PathParam("id") String id) {
        
        Game game = gameService.findGame(id);
        Console console = consoleService.findConsole(game.getConsoleId());
        Collection<GameType> types = typeService.findGameTypes((List<Long>) game.getTypeIds());
        System.out.println(game);
        if(game != null && console != null && types != null){
            String[] typeNames = new String[types.size()];
            int i = 0;
            for (GameType type : types) {
                typeNames[i++] = type.getName();
            }
            
            models.put("game", game);
            models.put("console", console);
            models.put("types", typeNames);
            return "game/show.jsp";
        }else{
            return "error404.jsp";
        }
    }
}
