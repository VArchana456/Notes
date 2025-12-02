package com.codegnan.service;
import java.util.List;

import org.springframework.stereotype.Service;

import com.codegnan.Repository.NotesRepository;
import com.codegnan.model.Notes;
@Service
public class NotesServiceImpl implements NotesService{
	//private final NotesRepository notesRepository;
	private NotesRepository notesRepository;

    public NotesServiceImpl(NotesRepository notesRepository) {
        this.notesRepository = notesRepository;
    }
	@Override
	public List<Notes> getAllNotes() {
		return notesRepository.findAll();
	}
	@Override
	public Notes getNotesById(Long id) {
		return notesRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Notes not found"));
	}
	@Override
	public Notes createNotes(Notes note) {
		return notesRepository.save(note);
	}
	@Override
	public Notes updateNotes(Long id, Notes note) {
		Notes existing = getNotesById(id);
        existing.setTitle(note.getTitle());
        existing.setContent(note.getContent());
        return notesRepository.save(existing);
	}
	@Override
	public void deleteNotes(Long id) {
		notesRepository.deleteById(id);
		
	}
}
