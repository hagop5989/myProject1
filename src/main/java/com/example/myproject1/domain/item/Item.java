package com.example.myproject1.domain.item;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import org.hibernate.validator.constraints.Range;

@Data
//@NoArgsConstructor
public class Item {

    private Long itemId;
    @NotNull
    @NotBlank(message = "itemName 은 공백일 수 없습니다")
    private String itemName;

    @Range(min = 0, max = 10000,message = "itemPrice 는 0~10000 사이입니다")
    @NotNull(message = "itemPrice 은 Null 일 수 없습니다.")
    private Integer itemPrice;
//
//    public Item(String itemName, Integer itemPrice) {
//        this.itemName = itemName;
//        this.itemPrice = itemPrice;
//    }
}
