package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.slim.dao.*;

public class StudentsList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DaoUser DaoUser;
    
    public void init() throws ServletException {
        DaoFactory daoFactory = DaoFactory.getInstance();
        this.DaoUser = daoFactory.getDaoUser();
    }
    
    public StudentsList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("students", DaoUser.getStudents());
		request.getRequestDispatcher("/studentsList.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String section =request.getParameter("section");
		if(section.equals("all"))
		{
			request.setAttribute("students", DaoUser.getStudents());
		}
		else
		{
			request.setAttribute("students", DaoUser.getStudentsByPromoID(section));
		}
		request.getRequestDispatcher("/studentsList.jsp").forward(request, response);
	}
}
