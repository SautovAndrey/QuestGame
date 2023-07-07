package org.example.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class TavernController extends GameServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        setPlayerAttributes(request);

        String pageParam = request.getParameter("page");
        String storyPage, jspPage;

        System.out.println("pageParam: " + pageParam); // отладочное сообщение


        if (pageParam != null && pageParam.equals("dDmap")) {
            storyPage = "dDmap";
            jspPage = "/dDmap.jsp";
        } else if (pageParam != null && pageParam.equals("aboutForest")) {
            storyPage = "aboutForest";
            jspPage = "/aboutForest.jsp";
        } else if (pageParam != null && pageParam.equals("drinkAndFight")) {
            storyPage = "drinkAndFight";
            jspPage = "/drinkAndFight.jsp";
        } else  {
            storyPage = "tavern";
            jspPage = "/tavern.jsp";
        }
        loadStoryPage(storyPage, jspPage, request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        setPlayerAttributes(request);

        System.out.println("action: " + action); // отладочное сообщение

        switch (action) {
            case "Buy Map":
                response.sendRedirect(request.getContextPath() + "/tavern?page=dDmap");
                break;
            case "Leave Tavern":
                response.sendRedirect(request.getContextPath() + "/village");
                break;
            case "Ask about Forest":
                response.sendRedirect(request.getContextPath() + "/tavern?page=aboutForest");
                break;
            case "Leave in Tavern":
                response.sendRedirect(request.getContextPath() + "/tavern");
                break;
            case "Drink and Gossip":
                response.sendRedirect(request.getContextPath() + "/tavern?page=drinkAndFight");
                break;
        }
    }
}








