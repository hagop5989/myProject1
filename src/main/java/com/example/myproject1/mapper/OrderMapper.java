package com.example.myproject1.mapper;

import com.example.myproject1.domain.order.Order;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface OrderMapper {

    @Select("""
            SELECT * FROM orders
            """)
    List<Order> findAllOrders();

    @Select("""
            SELECT * FROM orders
            WHERE orderId = #{search}
            """)
    Order selectOrder(String search);

    @Insert("""
            INSERT INTO orders(orderItem, orderProductPrice, orderQuantity,
                               orderTotalPrice, orderCustomerName)
            VALUES (
                    #{orderItem},#{orderProductPrice},#{orderQuantity},
                    #{orderTotalPrice},#{orderCustomerName}
            )
            """)
    int insert(Order order);

    @Update("""
            UPDATE orders SET
            orderItem = #{order.orderItem},
            orderProductPrice = #{order.orderProductPrice},
            orderQuantity = #{order.orderQuantity},
            orderTotalPrice = #{order.orderTotalPrice},
            orderCustomerName = #{order.orderCustomerName}
            WHERE orderId = #{prevId}
            """)
    int update(Order order, int prevId);

    @Delete("""
            DELETE FROM orders
            WHERE orderId = #{orderId}
            """)
    int delete(Order order);

    @Select("""
            SELECT i.itemPrice 
            FROM item i 
            WHERE i.itemName = #{orderItem}
            """)
    Integer findItemPrice(Order order);
}
