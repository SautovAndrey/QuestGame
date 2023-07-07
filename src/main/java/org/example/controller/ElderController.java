package org.example.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ElderController extends GameServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        setPlayerAttributes(request);
        String pageParam = request.getParameter("page");
        String storyPage, jspPage;

        System.out.println("pageParam: " + pageParam); // отладочное сообщение

        // Проверяем переданный параметр "page"
        if (pageParam != null && pageParam.equals("askAboutVillage")) {
            storyPage = "askAboutVillage";
            jspPage = "/askAboutVillage.jsp";
        } else if (pageParam != null && pageParam.equals("elderAboutForest")) {
            storyPage = "elderAboutForest";
            jspPage = "/elderAboutForest.jsp";
        } else if (pageParam != null && pageParam.equals("talkingToAnElder")) {
            storyPage = "talkingToAnElder";
            jspPage = "/talkingToAnElder.jsp";
        } else {
            storyPage = "elder";
            jspPage = "/elder.jsp";
        }
        loadStoryPage(storyPage, jspPage, request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        setPlayerAttributes(request);

        switch (action) {
            case "Ask about Village":
                response.sendRedirect(request.getContextPath() + "/elder?page=askAboutVillage");
                break;
            case "Ask about Forest":
                response.sendRedirect(request.getContextPath() + "/elder?page=elderAboutForest");
                break;
            case "Talking to an Elder":
                response.sendRedirect(request.getContextPath() + "/elder?page=talkingToAnElder");
                break;
            case "Leave Elder":
                response.sendRedirect(request.getContextPath() + "/village");
                break;
            case "Tell Elder you're not afraid":
                response.sendRedirect(request.getContextPath() + "/end?ending=jail");
                break;
            case "Agree and Leave":
                response.sendRedirect(request.getContextPath() + "/end?ending=home");
                break;
        }
    }
}
