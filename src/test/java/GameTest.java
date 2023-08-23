import org.example.Game;
import org.junit.jupiter.api.Test;
import javax.servlet.http.HttpSession;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.Mockito.*;

class GameTest {

    @Test
    void testGameInitialization() {
        HttpSession session = mock(HttpSession.class);
        Game game = new Game(session);

        assertNotNull(game.getPlayer());
    }

    @Test
    void testStartNewGame() {
        HttpSession session = mock(HttpSession.class);
        Game game = new Game(session);
        game.startNewGame("Alice", "192.168.1.1");

        assertEquals("Alice", game.getPlayer().getName());
        assertEquals("192.168.1.1", game.getPlayer().getIpAddress());
        assertEquals(1, game.getPlayer().getGamesPlayed());
    }
}
