package org.example.controller;

import org.example.Game;
import org.example.model.Player;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileReader;
import java.io.IOException;

public abstract class GameServlet extends HttpServlet {
    protected void setPlayerAttributes(HttpServletRequest request) {
        Game game = (Game) request.getSession().getAttribute("game");
        if (game != null) {
            Player player = game.getPlayer();
            if (player != null) {
                request.setAttribute("playerName", player.getName());
                request.setAttribute("ipAddress", player.getIpAddress());
                request.setAttribute("gamesPlayed", player.getGamesPlayed());
            }
        }
    }
    protected JSONArray loadStory(String storyPage) throws IOException, ParseException {
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(new FileReader(getServletContext().getRealPath("/questText.json")));
        JSONObject jsonObject = (JSONObject) obj;
        return (JSONArray) jsonObject.get(storyPage);
    }

    protected void loadStoryPage(String storyPage, String jspPage, HttpServletRequest request, HttpServletResponse response) {
        System.out.println("storyPage: " + storyPage); // отладочное сообщение
        System.out.println("jspPage: " + jspPage); // отладочное сообщение

        try {
            JSONArray storyArray = loadStory(storyPage);
            request.setAttribute("storyArray", storyArray.toJSONString());
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }

        try {
            request.getRequestDispatcher(jspPage).forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}


