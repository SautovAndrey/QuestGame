package org.example.model;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class PlayerTest {

    @Test
    void testPlayerAttributes() {
        Player player = new Player("John Doe", "127.0.0.1");

        assertEquals("John Doe", player.getName());
        assertEquals("127.0.0.1", player.getIpAddress());
        assertEquals(0, player.getGamesPlayed());
    }

    @Test
    void testIncrementGamesPlayed() {
        Player player = new Player("John Doe", "127.0.0.1");
        player.incrementGamesPlayed();

        assertEquals(1, player.getGamesPlayed());
    }
}
