package org.example.model.controller;

import org.example.Game;
import org.example.controller.WelcomeController;
import org.junit.jupiter.api.Test;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import static org.mockito.Mockito.*;

class WelcomeControllerTest {

    @Test
    void testDoPostValidName() throws ServletException, IOException {
        // Создание фиктивных объектов запроса и ответа
        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
        Game game = mock(Game.class);

        // Подделка входных данных
        when(request.getParameter("name")).thenReturn("Alice");
        when(request.getRemoteAddr()).thenReturn("192.168.1.1");
        when(request.getSession()).thenReturn(session);
        when(session.getAttribute("game")).thenReturn(game);
        when(game.getPlayer()).thenReturn(new org.example.model.Player("Alice", "192.168.1.1"));

        // Создание экземпляра WelcomeController
        WelcomeController controller = new WelcomeController();

        // Вызов метода doPost
        controller.doPost(request, response);

        // Проверка, что был выполнен переход на страницу "/village"
        verify(response).sendRedirect(request.getContextPath() + "/village");
    }
}
