package deim.urv.cat.homework2.controller;

import deim.urv.cat.homework2.model.AlertMessage;
import deim.urv.cat.homework2.service.UserService;
import deim.urv.cat.homework2.model.User;
import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.Models;
import jakarta.mvc.UriRef;
import jakarta.mvc.binding.BindingResult;
import jakarta.mvc.binding.ParamError;
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
@Path("profile")
public class ProfileController {    
    // CDI
    @Inject Logger log;
    @Inject Models models;
    @Inject BindingResult bindingResult;
    @Inject UserService service;


    
    @GET
    public String showProfile(@Context HttpServletRequest request) {
        return "profile.jsp";
    }
    
    @POST
    @UriRef("profile")
    public String updateProfile(@Context HttpServletRequest request, @Valid @BeanParam UserUpdateForm userUpdateForm){
        models.put("user", userUpdateForm);
        if (bindingResult.isFailed()) {
            AlertMessage alert = AlertMessage.danger("Validation failed!");
            bindingResult.getAllErrors()
                    .stream()
                    .forEach((ParamError t) -> {
                        alert.addError(t.getParamName(), "", t.getMessage());
                    });
            log.log(Level.WARNING, "Data binding for signupFormController failed.");
            models.put("errors", alert);
            return "profile.jsp";
        }
       
        HttpSession session = request.getSession(false);
        User authUser = (User) session.getAttribute("authUser");
        
        User user = service.findUserByEmail(userUpdateForm.getEmail());
        if (user != null && !userUpdateForm.getEmail().equalsIgnoreCase(authUser.getEmail())) {
            log.log(Level.WARNING, "A user with this e-mail address {0} already exists.", userUpdateForm.getEmail());
            models.put("message", "A user with this e-mail address already exists!");
            return "profile.jsp";
        }
        
        System.out.println(user.getPassword());
        
        service.updateUser(userUpdateForm, authUser);
        log.log(Level.INFO, "Redirecting to the success page.");
        
        user = service.findUserByEmail(userUpdateForm.getEmail());
        session.setAttribute("authUser", user);
        return "redirect:shop"; 
    }
}
