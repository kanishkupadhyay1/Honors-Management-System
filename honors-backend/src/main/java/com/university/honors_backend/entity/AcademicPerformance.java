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
@Table(name = "academic_performance")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AcademicPerformance {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Performance_ID")
    private Integer performanceId;

    @Column(name = "Student_ID")
    private Integer studentId;

    @Column(name = "Semester_ID")
    private Integer semesterId;

    @Column(name = "Semester_GPA")
    private BigDecimal semesterGpa;

    @Column(name = "Credits_earned")
    private Integer creditsEarned;

    @Column(name = "Backlogs")
    private Integer backlogs;
}
