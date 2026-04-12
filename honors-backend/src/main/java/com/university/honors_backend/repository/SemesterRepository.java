package com.university.honors_backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.university.honors_backend.entity.Semester;

public interface SemesterRepository extends JpaRepository<Semester, Integer> {
}
