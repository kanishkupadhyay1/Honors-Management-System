package com.university.honors_backend.entity;

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
@Table(name = "honors_program")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class HonorsProgram {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Program_ID")
    private Integer programId;

    @Column(name = "Program_Name")
    private String programName;

    @Column(name = "Department_ID")
    private Integer departmentId;

    @Column(name = "Max_Seats")
    private Integer maxSeats;

    @Column(name = "Start_year")
    private Integer startYear;

    @Column(name = "Status")
    private String status;
}
