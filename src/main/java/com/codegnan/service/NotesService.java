package com.codegnan.service;

import java.util.List;

import com.codegnan.model.Notes;


public interface NotesService {
	List<Notes> getAllNotes();
    Notes getNotesById(Long id);
    Notes createNotes(Notes note);
    Notes updateNotes(Long id, Notes note);
    void deleteNotes(Long id);
}



