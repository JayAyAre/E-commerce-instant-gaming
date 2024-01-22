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
import jakarta.ws.rs.PathParam;
import java.util.Collection;
import java.util.List;

@Controller
@Path("game-details")
public class GameDetailsController {
    @Inject GameService gameService;
    @Inject ConsoleService consoleService;
    @Inject GameTypeService typeService;
    @Inject Models models;

    @GET
    @Path("{id}")
    public String GameDetails(@PathParam("id") String id) {
        Game game = gameService.findGame(id);
        Collection<Console> consoles = consoleService.getAllConsoles();
        Console console = consoleService.findConsole(game.getConsoleId());
        Collection<GameType> types = typeService.findGameTypes((List<Long>) game.getTypeIds());
        
        if(game == null || console == null || types == null || Long.parseLong(id) < 1 || id.isEmpty()){
            return "redirect:/shop";
        }else{
            String[] typeNames = new String[types.size()];
            int i = 0;
            for (GameType type : types) {
                typeNames[i++] = type.getName();
            }
            models.put("consoles", consoles);
            models.put("game", game);
            models.put("console", console);
            models.put("types", typeNames);
            return "game/show.jsp";
        }
    }
}
