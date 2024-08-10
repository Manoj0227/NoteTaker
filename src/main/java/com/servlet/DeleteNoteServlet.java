package com.servlet;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServlet;




public class DeleteNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    public DeleteNoteServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		try {
			
			//GETTING PARAMETER FROM JSP FILR ("all_notes.jsp")
			
			int noteId = Integer.parseInt(request.getParameter("noteId").trim());
			
			//calling getfactory method of class ("FactoryProvider")
			
			Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			
			
			//LOADING NOTE ID FROM DATA BASE AND TYPE CAST IT TO "NOTE" CLASS TYPE
			Note note=(Note)session.get(Note.class, noteId);
			session.delete(note);
			
			response.sendRedirect("all_notes.jsp");
			
			tx.commit();
			session.close();
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		
	}

	
	
}
