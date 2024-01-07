package deim.urv.cat.homework2.controller;

import deim.urv.cat.homework2.model.AlertMessage;
import deim.urv.cat.homework2.model.Console;
import deim.urv.cat.homework2.model.Game;
import deim.urv.cat.homework2.model.SignUpAttempts;
import deim.urv.cat.homework2.service.UserService;
import deim.urv.cat.homework2.model.User;
import deim.urv.cat.homework2.service.ConsoleService;
import deim.urv.cat.homework2.service.GameService;

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
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;



import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
@Path("/shop")
public class IndexController {    
    // CDI
    @Inject Logger log;
    @Inject ConsoleService consoleService;
    @Inject GameService gameService;
    @Inject Models models;
    
    @GET
    public String showIndex(@Context HttpServletRequest request) {
        Collection<Console> consoles = consoleService.getAllConsoles();
        models.put("consoles", consoles); 
        Collection<Game> games = gameService.getAllgames();
        models.put("games", games); 
        return "index.jsp";
    }    
 
}
