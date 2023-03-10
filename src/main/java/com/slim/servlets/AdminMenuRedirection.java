package com.slim.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminMenuRedirection extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminMenuRedirection() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/menuAdmin.jsp").forward(request, response);
	}
}
