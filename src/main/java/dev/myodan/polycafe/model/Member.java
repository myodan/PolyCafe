package dev.myodan.polycafe.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member {

    private Long id;
    private String username;
    private String password;
    private String name;
    private String tel;
    private Long role;

}
