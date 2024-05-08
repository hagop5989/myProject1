package com.example.myproject1.domain.order;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class Order {
    private Long orderId;

    @NotBlank(message = "orderItem : 빈칸일 수 없습니다!")
    private String orderItem;

    @NotNull(message = "orderProductPrice : Null 일 수 없습니다!")
    private Integer orderProductPrice;

    @NotNull(message = "orderQuantity : Null 일 수 없습니다!")
    private Integer orderQuantity;

    @NotNull(message = "orderTotalPrice : Null 일 수 없습니다!")
    private Integer orderTotalPrice;

    @NotBlank(message = "orderCustomerName : Null 일 수 없습니다!")
    private String orderCustomerName;
}
