package com.university.honors_backend.controller;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.university.honors_backend.entity.Semester;
import com.university.honors_backend.repository.SemesterRepository;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:3000")
public class SemesterController {

    private final SemesterRepository semesterRepository;

    public SemesterController(SemesterRepository semesterRepository) {
        this.semesterRepository = semesterRepository;
    }

    @GetMapping("/semesters")
    public List<Semester> getSemesters() {
        return semesterRepository.findAll();
    }

    @PostMapping("/semesters")
    public Semester createSemester(@RequestBody Semester semester) {
        semester.setSemesterId(null);
        return semesterRepository.save(semester);
    }
}
