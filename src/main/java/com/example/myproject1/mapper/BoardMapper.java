package com.example.myproject1.mapper;

import com.example.myproject1.domain.board.Board;
import com.example.myproject1.domain.board.BoardInsertDto;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BoardMapper {
    @Insert("""
            INSERT INTO board
            (title, content, writer)
            VALUES(#{title}, #{content}, #{writer})
            """)
    int insertBoard(BoardInsertDto dto);


    @Select("""
            SELECT * FROM board
            """)
    List<Board> findAll();

    @Select("""
            SELECT * FROM board
            WHERE board_Id = #{boardId}
            """)
    Board findById(String boardId);

    @Update("""
            UPDATE board SET
            title = #{board.title},
            content = #{board.content}
            WHERE board_Id = #{searchId}
            """)
    int update(Board board,Long searchId);

    @Delete("""
            DELETE FROM board
            WHERE board_Id = #{boardId}
            """)
    int delete(String boardId);

    @Select("""
            SELECT COUNT(board_Id) FROM board;
            """)
    int count();

    @Select("""
            SELECT * FROM board
            WHERE board_Id
            LIMIT #{offset},10
            """)
    List<Board>pagingSelect(int offset);
}
