package com.university.honors_backend.entity;

import java.math.BigDecimal;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "eligibility_criteria")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class EligibilityCriteria {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Criteria_ID")
    private Integer criteriaId;

    @Column(name = "Program_ID")
    private Integer programId;

    @Column(name = "Min_CGPA")
    private BigDecimal minCgpa;

    @Column(name = "Min_Credits")
    private Integer minCredits;

    @Column(name = "Max_Backlogs")
    private Integer maxBacklogs;
}
