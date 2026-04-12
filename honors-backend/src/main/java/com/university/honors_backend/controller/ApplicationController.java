package com.university.honors_backend.controller;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.university.honors_backend.entity.Application;
import com.university.honors_backend.repository.ApplicationRepository;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:3000")
public class ApplicationController {

    private final ApplicationRepository applicationRepository;

    public ApplicationController(ApplicationRepository applicationRepository) {
        this.applicationRepository = applicationRepository;
    }

    @GetMapping("/applications")
    public List<Application> getApplications() {
        return applicationRepository.findAll();
    }

    @PostMapping("/applications")
    public Application createApplication(@RequestBody Application application) {
        application.setApplicationId(null);
        return applicationRepository.save(application);
    }
}
