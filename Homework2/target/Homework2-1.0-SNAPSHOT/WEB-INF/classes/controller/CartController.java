/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package deim.urv.cat.homework2.controller;

import deim.urv.cat.homework2.model.Cart;
import deim.urv.cat.homework2.model.Console;
import deim.urv.cat.homework2.service.ConsoleService;
import deim.urv.cat.homework2.service.GameService;
import jakarta.enterprise.inject.Model;
import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.Models;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.core.Context;
import java.io.IOException;
import java.util.Collection;

/**
 *
 * @author Usuario
 */

@Controller
@Path("cart")
public class CartController {
    
    @Inject GameService gameService;
    @Inject ConsoleService consoleService;
    @Inject Models models;

    @GET
    public String viewCart(@Context HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Collection<Console> consoles = consoleService.getAllConsoles();
        models.put("consoles", consoles);
        if (session != null) {
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart != null) {
                // Obtener y mostrar los elementos del carrito
                session.setAttribute("cart", cart);
            }
        }
        return "game/cart.jsp";
    }

    @POST
    public String addToCart(@Context HttpServletRequest request) {
        String gameId = request.getParameter("gameId");
        if(Long.parseLong(gameId) < 1){
             return "error404.jsp";
        }
        HttpSession session = request.getSession(false);
        Cart cart = (Cart) session.getAttribute("cart");
        
        if (cart == null) {
             cart = new Cart();
             session.setAttribute("cart", cart);
        }

        cart.addGame(gameService.findGame(gameId));
        session.setAttribute("cart", cart);

        Collection<Console> consoles = consoleService.getAllConsoles();
        models.put("consoles", consoles);
        return "game/cart.jsp";
    }
    
    @GET
    @Path("{id}")
    public void removeFromCart(@PathParam("id") Long id, @Context HttpServletRequest request, @Context HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        
        cart.removeGame(id);
        session.setAttribute("cart", cart);

        Collection<Console> consoles = consoleService.getAllConsoles();
        models.put("consoles", consoles);

        response.sendRedirect(request.getContextPath() + "/Web/cart");

    }
}
