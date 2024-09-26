package dev.myodan.polycafe.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductImage {

    private Long id;
    private Long productId;
    private String filename;
    private String uuid;

}
