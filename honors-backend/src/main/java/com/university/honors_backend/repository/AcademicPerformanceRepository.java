package com.university.honors_backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.university.honors_backend.entity.AcademicPerformance;

public interface AcademicPerformanceRepository extends JpaRepository<AcademicPerformance, Integer> {
}
