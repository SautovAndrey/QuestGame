package org.example.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EndController extends GameServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ending = request.getParameter("ending");
        String storyPage, jspPage;

        switch (ending) {
            case "home":
                storyPage = "endHome";
                jspPage = "/endHome.jsp";
                break;
            case "jail":
                storyPage = "endJail";
                jspPage = "/endJail.jsp";
                break;
            case "victory":
                storyPage = "endVictory";
                jspPage = "/endVictory.jsp";
                break;
            case "death":
                storyPage = "endDeath";
                jspPage = "/endDeath.jsp";
                break;
            default:
                throw new ServletException("Unknown ending: " + ending);
        }

        setPlayerAttributes(request);
        loadStoryPage(storyPage, jspPage, request, response);
    }
}

