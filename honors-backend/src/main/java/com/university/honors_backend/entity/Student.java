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
@Table(name = "student")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Student_ID")
    private Integer studentId;

    @Column(name = "Name")
    private String name;

    @Column(name = "Phone_Number")
    private String phoneNumber;

    @Column(name = "Email_ID")
    private String emailId;

    @Column(name = "Year")
    private Integer year;

    @Column(name = "Dept_ID")
    private Integer deptId;

    @Column(name = "Status")
    private String status;
}
