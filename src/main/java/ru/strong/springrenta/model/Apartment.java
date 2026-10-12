package ru.strong.springrenta.model;

import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Entity
@Table(name = "apartments")
public class Apartment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "landlords_id", nullable = false)
    Landlord landlord;



    @Column(nullable = false)
    Integer roomCount;

    @Column(nullable = false)
    Integer price;

    @Column(name = "address", columnDefinition = "TEXT")
    String address;

    @Column(name = "description", columnDefinition = "TEXT")
    String description;


}
