package ru.strong.springrenta.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.strong.springrenta.model.Landlord;

import java.util.Optional;
@Repository
public interface LandlordRepository extends JpaRepository<Landlord, Integer> {
    Optional<Landlord> findByName(String name);
}
