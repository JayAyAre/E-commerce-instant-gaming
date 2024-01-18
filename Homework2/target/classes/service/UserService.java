package deim.urv.cat.homework2.service;

import deim.urv.cat.homework2.model.User;
import deim.urv.cat.homework2.controller.UserForm;
import deim.urv.cat.homework2.controller.UserUpdateForm;

public interface UserService {
    
    public User findUserByEmail(String email);
    public void addUser(UserForm user);
    public User validateUser(UserForm user);
    public boolean updateUser(UserUpdateForm user, User authUser);
}
