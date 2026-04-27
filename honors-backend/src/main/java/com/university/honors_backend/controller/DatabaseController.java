package com.university.honors_backend.controller;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:3000")
public class DatabaseController {

    private final JdbcTemplate jdbcTemplate;

    public DatabaseController(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @GetMapping("/db-status")
    public Map<String, Object> getDatabaseStatus() {
        Map<String, Object> status = new LinkedHashMap<>();
        status.put("database", jdbcTemplate.queryForObject("select database()", String.class));
        status.put("students", count("student"));
        status.put("departments", count("department"));
        status.put("programs", count("honors_program"));
        status.put("applications", count("application"));
        status.put("semesters", count("semester"));
        status.put("academicPerformance", count("academic_performance"));
        status.put("eligibilityCriteria", count("eligibility_criteria"));
        status.put("selections", count("selection"));
        return status;
    }

    private Integer count(String tableName) {
        return jdbcTemplate.queryForObject("select count(*) from `" + tableName + "`", Integer.class);
    }
}
