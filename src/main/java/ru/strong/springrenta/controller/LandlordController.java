package ru.strong.springrenta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.strong.springrenta.model.Landlord;
import ru.strong.springrenta.repository.LandlordRepository;

@Controller
@RequestMapping("/lords")

public class LandlordController {
    private final LandlordRepository landlordRepository;

    public LandlordController(LandlordRepository landlordRepository) {
        this.landlordRepository = landlordRepository;
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("landlords", landlordRepository.findAll());
        return "lords/list";
    }

    @GetMapping("/new")
    public String newForm(Model model) {
        model.addAttribute("landlord", new Landlord());
        return "lords/form";
    }

    @PostMapping
    public String create(@ModelAttribute Landlord landlord) {
        landlordRepository.save(landlord);
        return "redirect:/lords";
    }

    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable Integer id, Model model) {
        Landlord landlord = landlordRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Арендодатель не найден: " + id));
        model.addAttribute("landlord", landlord);
        return "lords/form";
    }

    @PostMapping("/{id}")
    public String update(@PathVariable Integer id, @ModelAttribute Landlord landlord) {
        Landlord existing = landlordRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Арендодатель не найден"));
        existing.setName(landlord.getName());
        existing.setPhone(landlord.getPhone());
        landlordRepository.save(existing);
        return "redirect:/lords";
    }

    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Integer id) {
        landlordRepository.deleteById(id);
        return "redirect:/lords";
    }
}
