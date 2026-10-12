package ru.strong.springrenta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.strong.springrenta.model.Apartment;
import ru.strong.springrenta.model.Landlord;
import ru.strong.springrenta.repository.ApartmentRepository;
import ru.strong.springrenta.repository.LandlordRepository;

import java.util.List;

@Controller
@RequestMapping("/apartments/all")

public class ApartmentController {

    private final ApartmentRepository apartmentRepository;
    private final LandlordRepository landlordRepository;

    public ApartmentController(ApartmentRepository apartmentRepository,
                               LandlordRepository landlordRepository) {
        this.apartmentRepository = apartmentRepository;
        this.landlordRepository = landlordRepository;
    }

    @GetMapping
    public String list(Model model) {
        List<Apartment> apartments = apartmentRepository.findAll();
        model.addAttribute("apartments", apartments);
        model.addAttribute("landlords", landlordRepository.findAll()); // для выпадающего списка
        return "apartments/list";
    }

    @GetMapping("/new")
    public String newForm(Model model) {
        model.addAttribute("apartment", new Apartment());
        model.addAttribute("landlords", landlordRepository.findAll());
        return "apartments/form";
    }

    @PostMapping
    public String create(@ModelAttribute Apartment apartment) {
        apartmentRepository.save(apartment);
        return "redirect:/apartments/all";
    }

    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable Integer id, Model model) {
        Apartment apartment = apartmentRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Квартира не найдена: " + id));
        model.addAttribute("apartment", apartment);
        model.addAttribute("landlords", landlordRepository.findAll());
        return "apartments/form";
    }

    @PostMapping("/{id}")
    public String update(@PathVariable Integer id, @ModelAttribute Apartment apartment) {
        Apartment existing = apartmentRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Квартира не найдена"));
        existing.setRoomCount(apartment.getRoomCount());
        existing.setPrice(apartment.getPrice());
        existing.setAddress(apartment.getAddress());
        existing.setDescription(apartment.getDescription());
        existing.setLandlord(apartment.getLandlord()); // связь
        apartmentRepository.save(existing);
        return "redirect:/apartments/all";
    }

    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Integer id) {
        apartmentRepository.deleteById(id);
        return "redirect:/apartments/all";
    }
}
