package com.university.honors_backend.controller;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.university.honors_backend.entity.Selection;
import com.university.honors_backend.repository.SelectionRepository;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:3000")
public class SelectionController {

    private final SelectionRepository selectionRepository;

    public SelectionController(SelectionRepository selectionRepository) {
        this.selectionRepository = selectionRepository;
    }

    @GetMapping("/selections")
    public List<Selection> getSelections() {
        return selectionRepository.findAll();
    }

    @PostMapping("/selections")
    public Selection createSelection(@RequestBody Selection selection) {
        selection.setSelectionId(null);
        return selectionRepository.save(selection);
    }
}
