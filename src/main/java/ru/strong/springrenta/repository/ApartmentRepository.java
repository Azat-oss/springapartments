package ru.strong.springrenta.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.strong.springrenta.model.Apartment;
import ru.strong.springrenta.model.Landlord;

import java.util.List;
import java.util.Optional;
@Repository
public interface ApartmentRepository extends JpaRepository<Apartment, Integer>  {
    List<Apartment> findByRoomCount(Integer roomCount);
    List<Apartment> findByPriceLessThan(Integer maxPrice);

}
