package com.university.honors_backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.university.honors_backend.entity.Student;

public interface StudentRepository extends JpaRepository<Student, Integer> {
}
