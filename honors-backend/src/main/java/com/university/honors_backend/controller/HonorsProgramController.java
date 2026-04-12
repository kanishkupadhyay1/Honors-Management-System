package com.university.honors_backend.controller;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.university.honors_backend.entity.HonorsProgram;
import com.university.honors_backend.repository.HonorsProgramRepository;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:3000")
public class HonorsProgramController {

    private final HonorsProgramRepository honorsProgramRepository;

    public HonorsProgramController(HonorsProgramRepository honorsProgramRepository) {
        this.honorsProgramRepository = honorsProgramRepository;
    }

    @GetMapping("/programs")
    public List<HonorsProgram> getPrograms() {
        return honorsProgramRepository.findAll();
    }

    @PostMapping("/programs")
    public HonorsProgram createProgram(@RequestBody HonorsProgram program) {
        program.setProgramId(null);
        return honorsProgramRepository.save(program);
    }
}
