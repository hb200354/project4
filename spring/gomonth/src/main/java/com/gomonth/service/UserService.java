package com.gomonth.service;

import com.gomonth.dto.UserDTO;

public interface UserService {
    UserDTO login(String userId, String userPw);
    void register(UserDTO user);
}