package com.servlet;

import java.io.IOException;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EditNoteServlet() {
        // TODO Auto-generated constructor stub
    }

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {
			
			//GETTING PARAMETERS FROM JSP FILR ("EditNote.jsp")
			
			int noteId = Integer.parseInt(request.getParameter("noteId").trim());
			String noteTitle = request.getParameter("noteTitle");
			String noteContent = request.getParameter("noteContent");
			
			//calling getfactory method of class ("FactoryProvider")
			
			Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			
			
			//LOADING NOTE ID FROM DATA BASE AND TYPE CAST IT TO "NOTE" CLASS TYPE
			Note note=session.get(Note.class, noteId);
			
			note.setTitle(noteTitle);
			note.setContent(noteContent);
			note.setAddedDate(new Date());
			
		
			response.sendRedirect("all_notes.jsp");
			
			tx.commit();
			session.close();
			
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
	}

}
