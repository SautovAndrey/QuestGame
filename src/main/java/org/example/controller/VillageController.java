package org.example.controller;

import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class VillageController extends GameServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        setPlayerAttributes(request);

        String storyPage = "village";
        try {
            JSONArray storyArray = loadStory(storyPage);
            request.setAttribute("storyArray", storyArray.toJSONString());
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/village.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        setPlayerAttributes(request);

        switch (action) {
            case "Visit Tavern":
                response.sendRedirect(request.getContextPath() + "/tavern");
                break;
            case "Talk to Elder":
                response.sendRedirect(request.getContextPath() + "/elder");
                break;
            case "Leave Village":
                response.sendRedirect(request.getContextPath() + "/forest");
                break;
        }
    }
}


