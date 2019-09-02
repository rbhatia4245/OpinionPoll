import dao.UserDao;
import models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/getUser")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user=new User();
        user.setName(request.getParameter("name"));
        user.setEmail(request.getParameter("email"));
        UserDao userDao = new UserDao();
        int id=userDao.getUserId(user);
        request.setAttribute("userId",id);
        request.getRequestDispatcher("/addAnswer").forward(request,response);
    }
}
