package org.example.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ForestController extends GameServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        setPlayerAttributes(request);
        String page = request.getParameter("page");

        if (page != null && page.equals("exploringTheDarkForest")) {
            request.getRequestDispatcher("/exploringTheDarkForest.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/forest.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        setPlayerAttributes(request);

        switch (action) {
            case "Return Home":
                response.sendRedirect(request.getContextPath() + "/end?ending=home");
                break;
            case "Enter Forest":
                response.sendRedirect(request.getContextPath() + "/forest?page=exploringTheDarkForest");
                break;
            case "Return to the Village":
                response.sendRedirect(request.getContextPath() + "/village");
                break;
        }
    }
}


