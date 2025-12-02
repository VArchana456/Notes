package com.codegnan.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.codegnan.model.Notes;
import com.codegnan.Repository.NotesRepository;

import java.util.List;

@Controller
@RequestMapping("/notes")
public class NotesController {

    private final NotesRepository noteRepository;

    public NotesController(NotesRepository notesRepository) {
        this.noteRepository = notesRepository;
    }

    @GetMapping
    public String listNotes(Model model) {
        List<Notes> notes = noteRepository.findAll();
        model.addAttribute("notes", notes);
        return "notes-list";
    }

    @GetMapping("/new")
    public String newForm(Model model) {
        model.addAttribute("note", new Notes());
        return "note-form";
    }

    @PostMapping("/save")
    public String saveNote(@ModelAttribute Notes note) {
        noteRepository.save(note);
        return "redirect:/notes";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Long id, Model model) {
        Notes n = noteRepository.findById(id).orElse(new Notes());
        model.addAttribute("note", n);
        return "note-form";
    }

    @PostMapping("/update/{id}")
    public String updateNote(@PathVariable Long id, @ModelAttribute Notes note) {
        Notes existing = noteRepository.findById(id).orElse(null);
        if (existing != null) {
            existing.setTitle(note.getTitle());
            existing.setContent(note.getContent());
            noteRepository.save(existing);
        }
        return "redirect:/notes";
    }

    @GetMapping("/delete/{id}")
    public String deleteNote(@PathVariable Long id) {
        noteRepository.deleteById(id);
        return "redirect:/notes";
    }

    // ⭐ FIXED CHECKBOX UPDATE METHOD
    @PostMapping("/updateStatus/{id}")
    public String updateStatus(@PathVariable Long id,
                               @RequestParam(required = false) boolean completed) {

        Notes note = noteRepository.findById(id).orElse(null);

        if (note != null) {
            note.setCompleted(completed);
            noteRepository.save(note);
        }

        return "redirect:/notes";
    }
}
