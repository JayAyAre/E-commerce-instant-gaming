package deim.urv.cat.homework2.controller;

import deim.urv.cat.homework2.model.AlertMessage;
import deim.urv.cat.homework2.model.SignUpAttempts;
import deim.urv.cat.homework2.service.UserService;
import deim.urv.cat.homework2.model.User;

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

import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
@Path("ShowGame")
public class ShowGameController {
    @Inject BindingResult bindingResult;
    @Inject Logger log;
    @Inject UserService service;
    @Inject Models models;
    @Inject AlertMessage flashMessage;
    @Inject SignUpAttempts attempts;

    @GET
    public String showGame() {
        return "game/show.jsp";
    }
}
