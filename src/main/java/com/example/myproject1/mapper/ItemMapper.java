package com.example.myproject1.mapper;


import com.example.myproject1.domain.item.Item;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ItemMapper {

    @Insert("""
    INSERT INTO item(itemName, itemPrice)
    VALUES (#{itemName}, #{itemPrice})
    """)
    int insert(Item item);

    @Select("""
            SELECT *
            FROM item;
            """)
    List<Item> findAllItems();

    @Select("""
    SELECT * FROM item
    WHERE itemName = #{search}
    """)
    Item select(String search);

    @Update("""
    UPDATE item
    SET
        itemName = #{item.itemName},
        itemPrice = #{item.itemPrice}
    WHERE itemId = #{prevName}
    """)
    int update(Item item,String prevName);

    @Delete("""
    DELETE FROM item WHERE itemId = #{itemId};
    """)
    int delete (Item item);

}

