package org.example;

import org.example.model.Player;
import javax.servlet.http.HttpSession;
import java.util.Objects;

public class Game {
    private Player player;
    private HttpSession session;

    public Game(HttpSession session) {
        this.session = session;
        Player playerFromSession = (Player) session.getAttribute("player");
        this.player = Objects.requireNonNullElseGet(playerFromSession, () -> new Player("Default name", "Default IP"));
    }

    public Player getPlayer() {
        return player;
    }

    public void startNewGame(String name, String ipAddress) {
        player = new Player(name, ipAddress);
        player.incrementGamesPlayed();
        session.setAttribute("player", player);
    }

}

