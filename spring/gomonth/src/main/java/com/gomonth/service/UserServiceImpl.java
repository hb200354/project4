package com.gomonth.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gomonth.dao.UserDAO;
import com.gomonth.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDAO userDAO;

    @Override
    public UserDTO login(String userId, String userPw) {
        return userDAO.loginCheck(userId, userPw);
    }
    
    @Override
    public void register(UserDTO user) {
        userDAO.insertUser(user);
    }
}