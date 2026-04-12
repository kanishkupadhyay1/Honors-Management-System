package com.university.honors_backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.university.honors_backend.entity.Department;

public interface DepartmentRepository extends JpaRepository<Department, Integer> {
}
