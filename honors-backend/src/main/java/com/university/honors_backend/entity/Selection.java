package com.university.honors_backend.entity;

import java.math.BigDecimal;
import java.time.LocalDate;

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
@Table(name = "selection")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Selection {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Selection_ID")
    private Integer selectionId;

    @Column(name = "Application_ID")
    private Integer applicationId;

    @Column(name = "Rank_No")
    private Integer rankNo;

    @Column(name = "Final_Score")
    private BigDecimal finalScore;

    @Column(name = "Selection_Date")
    private LocalDate selectionDate;
}
