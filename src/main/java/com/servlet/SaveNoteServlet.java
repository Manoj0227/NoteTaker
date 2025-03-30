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




public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SaveNoteServlet() {
        super();
        
    }

	
	
	@Override
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{
			//fetching title,content from "AddNote.jsp" file
			
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			//creating object of entity class "Note"
			Note note=new Note(title,content,new Date());
			
			System.out.println(note.getId()+":"+note.getTitle()+":"+note.getContent());
			
			
			//calling getfactory method of factory provider class
			Session session=FactoryProvider.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			
			//SAVING DATA TO THE DATA BASE 
			session.save(note);
			
			
			
			
			tx.commit();
			session.close();
			
			response.sendRedirect("SaveNote.jsp");
/**			
			//TELLING BROWSER THAT DATA TO BE SENT WILL BE HTML TYPE
			
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			
			request.getRequestDispatcher("Navbar.jsp").include(request, response);
			
			
			out.println("<h1 style='text-align:center'>Note is added Successfully..!</h1>");
			out.println("<h1 style='text-align:center'><a href='all_notes.jsp'>View All Notes</a></h1>");
			
			*/
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}

}



