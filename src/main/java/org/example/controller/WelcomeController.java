package org.example.controller;

import org.example.Game;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class WelcomeController extends GameServlet {
    private static final String WELCOME_JSP_PATH = "/WEB-INF/jsp/welcome.jsp";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        setPlayerAttributes(request);
        String name = request.getParameter("name");
        String ipAddress = request.getRemoteAddr();

        HttpSession session = request.getSession();
        Game currentGame = (Game) session.getAttribute("game");

        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Please enter a name.");
            request.getRequestDispatcher("/WEB-INF/jsp/welcome.jsp").forward(request, response);
        } else {
            if (currentGame != null && name.equals(currentGame.getPlayer().getName())) {
                currentGame.getPlayer().incrementGamesPlayed();
            } else {
                Game newGame = new Game(session);
                newGame.startNewGame(name, ipAddress);
                session.setAttribute("game", newGame);
            }
            response.sendRedirect(request.getContextPath() + "/village");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        setPlayerAttributes(req);
        RequestDispatcher dispatcher = req.getRequestDispatcher(WELCOME_JSP_PATH);
        dispatcher.forward(req, resp);
    }
}






