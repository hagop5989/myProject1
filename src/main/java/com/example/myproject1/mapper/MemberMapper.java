package com.example.myproject1.mapper;

import com.example.myproject1.domain.member.Member;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface MemberMapper {

    @Insert("""
            INSERT INTO member(userId, password) 
            VALUES (#{userId}, #{password})
            """)
    int insert(Member member);

    @Select("""
    SELECT *
    FROM member
    """)
    List<Member> findAllMembers();

    @Select("""
    SELECT *
    FROM member
    WHERE userId = #{selectMember}
    """)
    Member select(String selectMember);

    @Update("""
    UPDATE member SET
                      userId = #{member.userId},
                      password = #{member.password}
                WHERE userId = #{prevName};
    """)
    int update(Member member,String prevName);

    @Delete("""
    DELETE FROM member WHERE userId = #{userId};
    """)
    int delete (Member member);


}
