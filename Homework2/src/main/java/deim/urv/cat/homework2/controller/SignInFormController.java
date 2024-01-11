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
import jakarta.ws.rs.core.Context;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
@Path("sign-in")
public class SignInFormController {    
    // CDI
    @Inject BindingResult bindingResult;
    @Inject Logger log;
    @Inject UserService service;
    @Inject Models models;
    @Inject AlertMessage flashMessage;
    
    @GET
    public String showForm(@Context HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("username") != null) {
            return "signup-success.jsp";
        }

        return "signin-form.jsp"; // Injects CRSF token
    }    
    
    @POST
    @UriRef("submit")
    @CsrfProtected
    public String signIn(@Valid @BeanParam UserForm userForm, @Context HttpServletRequest request) {
        models.put("user", userForm);
        if (bindingResult.isFailed()) {
            AlertMessage alert = AlertMessage.danger("Validation failed!");
            bindingResult.getAllErrors()
                    .stream()
                    .forEach((ParamError t) -> {
                        alert.addError(t.getParamName(), "", t.getMessage());
                    });
            log.log(Level.WARNING, "Data binding for signinFormController failed.");
            models.put("errors", alert);
            return "signin-form.jsp";
        }
       
        User user = service.validateUser(userForm);
        if (user != null) {
            log.log(Level.INFO, "Redirecting to the success page.");
            HttpSession session = request.getSession(true);
            session.setAttribute("authUser", user);
            return "redirect:shop";
        }
        log.log(Level.WARNING, "A user with this e-mail address {0} already exists.", userForm.getEmail());
        models.put("message", "A user with this e-mail address already exists!");
        return "signin-form.jsp";
    } 
}
