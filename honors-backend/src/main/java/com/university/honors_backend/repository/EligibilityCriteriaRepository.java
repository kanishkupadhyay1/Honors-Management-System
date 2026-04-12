package com.university.honors_backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.university.honors_backend.entity.EligibilityCriteria;

public interface EligibilityCriteriaRepository extends JpaRepository<EligibilityCriteria, Integer> {
}
