package com.university.honors_backend.controller;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.university.honors_backend.entity.EligibilityCriteria;
import com.university.honors_backend.repository.EligibilityCriteriaRepository;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:3000")
public class EligibilityCriteriaController {

    private final EligibilityCriteriaRepository eligibilityCriteriaRepository;

    public EligibilityCriteriaController(EligibilityCriteriaRepository eligibilityCriteriaRepository) {
        this.eligibilityCriteriaRepository = eligibilityCriteriaRepository;
    }

    @GetMapping("/eligibility-criteria")
    public List<EligibilityCriteria> getEligibilityCriteria() {
        return eligibilityCriteriaRepository.findAll();
    }

    @PostMapping("/eligibility-criteria")
    public EligibilityCriteria createEligibilityCriteria(@RequestBody EligibilityCriteria criteria) {
        criteria.setCriteriaId(null);
        return eligibilityCriteriaRepository.save(criteria);
    }
}
