package com.university.honors_backend.controller;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.university.honors_backend.entity.AcademicPerformance;
import com.university.honors_backend.repository.AcademicPerformanceRepository;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:3000")
public class AcademicPerformanceController {

    private final AcademicPerformanceRepository academicPerformanceRepository;

    public AcademicPerformanceController(AcademicPerformanceRepository academicPerformanceRepository) {
        this.academicPerformanceRepository = academicPerformanceRepository;
    }

    @GetMapping("/academic-performance")
    public List<AcademicPerformance> getAcademicPerformance() {
        return academicPerformanceRepository.findAll();
    }

    @PostMapping("/academic-performance")
    public AcademicPerformance createAcademicPerformance(@RequestBody AcademicPerformance performance) {
        performance.setPerformanceId(null);
        return academicPerformanceRepository.save(performance);
    }
}
