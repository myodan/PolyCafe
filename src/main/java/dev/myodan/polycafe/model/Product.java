package dev.myodan.polycafe.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Clob;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {
    private Long id;
    private String name;
    private Long price;
    private String grade;
    private Clob description;
    private Date createdAt;
    private Date updatedAt;

    private List<ProductImage> productImages = new ArrayList<>();
    private Member creator;
    private Member updater;
}
