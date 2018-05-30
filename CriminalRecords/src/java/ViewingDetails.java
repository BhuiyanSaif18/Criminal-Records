
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/ViewingDetails"})
public class ViewingDetails extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String type = request.getParameter("type");
        String id = request.getParameter("criminal_id");

        HttpSession tempSession = request.getSession();
        tempSession.setAttribute("viewId", id);
        tempSession.setAttribute("viewTable", type);
        System.out.println("Before dispatching from ViewingDetails");
        ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/details.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }


}
