package com.servlet;

import java.io.IOException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.entities.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



public class TitleSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String titleSearch = request.getParameter("titleSearch");

        if (titleSearch != null && !titleSearch.trim().isEmpty()) {
            titleSearch = "%" + titleSearch.trim() + "%"; // Enable partial search

            try (Session session = FactoryProvider.getFactory().openSession()) {
                Query<Note> query = session.createQuery("from Note where lower(title) like lower(:title)", Note.class);
                query.setParameter("title", titleSearch);
                
                List<Note> noteList = query.list();
                request.setAttribute("noteList", noteList);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // Forward results to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("TitleSearch.jsp");
        dispatcher.forward(request, response);
	}

}
