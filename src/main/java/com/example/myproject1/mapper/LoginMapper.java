package com.example.myproject1.mapper;

import com.example.myproject1.domain.member.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface LoginMapper {

    @Select("""
SELECT * FROM member WHERE userId = #{userID} AND password = #{password}
""")
    Member loginCheckDb(String userID, String password);
}
