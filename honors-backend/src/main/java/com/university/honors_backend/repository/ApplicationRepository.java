package com.university.honors_backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.university.honors_backend.entity.Application;

public interface ApplicationRepository extends JpaRepository<Application, Integer> {
}
