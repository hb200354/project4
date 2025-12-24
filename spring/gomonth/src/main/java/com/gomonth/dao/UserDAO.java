package com.gomonth.dao;

import com.gomonth.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserDAO {
    UserDTO loginCheck(@Param("userId") String userId, @Param("userPw") String userPw);
    int insertUser(UserDTO user);
}