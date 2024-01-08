/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package deim.urv.cat.homework2.controller;

import deim.urv.cat.homework2.model.Cart;
import deim.urv.cat.homework2.model.Console;
import deim.urv.cat.homework2.model.Customer;
import deim.urv.cat.homework2.model.Game;
import deim.urv.cat.homework2.model.Rental;
import deim.urv.cat.homework2.model.User;
import deim.urv.cat.homework2.service.ConsoleService;
import deim.urv.cat.homework2.service.GameService;
import deim.urv.cat.homework2.service.GameTypeService;
import deim.urv.cat.homework2.service.RentalService;
import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.Models;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Context;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 *
 * @author jordi
 */
@Controller
@Path("history")
public class RentalController {
    @Inject GameService gameService;
    @Inject ConsoleService consoleService;
    @Inject GameTypeService typeService;
    @Inject RentalService rentalService;
    @Inject Models models;

    @GET
    public String showHistory(@Context HttpServletRequest request, @Context HttpServletResponse response) throws IOException {
        ArrayList<Rental> rentals= new ArrayList();
        Collection<Console> consoles = consoleService.getAllConsoles();
        rentals = rentalService.getAllRentals();
        models.put("consoles", consoles);
        models.put("rentals", rentals);
        return "game/history.jsp";
    }
    
    
    @POST
    public void newRental(@Context HttpServletRequest request, @Context HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);

        List<Game> games = new ArrayList<>();
        Cart cart = (Cart) session.getAttribute("cart");
        games = cart.getGames();

        User user = (User) session.getAttribute("authUser");
                
        if(user==null){
            response.sendRedirect(request.getContextPath() + "error");
        }
        
        Customer customer = new Customer();
        customer.setEmail(user.getEmail());
        customer.setName(user.getUsername());
        
        String total = request.getParameter("total");
 
        List<Long> gamesId = new ArrayList();
        for(Game game: games){
            gamesId.add(game.getId());
        }
        
        Rental newRental = new Rental();
        newRental.setCustomerId("5");
        newRental.setPrice(Long.parseLong(total));
        newRental.setGameId(gamesId);
        Date startDate = new Date();
        newRental.setStartDate(startDate);
  
        rentalService.postRental(newRental);
        response.sendRedirect(request.getContextPath() + "/Web/history");
    }   
}
