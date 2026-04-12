package com.university.honors_backend.entity;

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
@Table(name = "application")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Application {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Application_ID")
    private Integer applicationId;

    @Column(name = "Student_ID")
    private Integer studentId;

    @Column(name = "Program_ID")
    private Integer programId;

    @Column(name = "Application_Date")
    private LocalDate applicationDate;

    @Column(name = "Status")
    private String status;
}
