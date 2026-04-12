package com.university.honors_backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.university.honors_backend.entity.Selection;

public interface SelectionRepository extends JpaRepository<Selection, Integer> {
}
