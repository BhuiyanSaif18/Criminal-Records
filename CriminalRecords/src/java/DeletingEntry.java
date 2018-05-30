
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/DeletingEntry"})
public class DeletingEntry extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String t_able = request.getParameter("type");
        String i_d = request.getParameter("criminal_id");
        int table = Integer.valueOf(t_able);
        int id = Integer.valueOf(i_d);
        if (table == 2) {
            try {
                String connectionURL = "jdbc:mysql://localhost:3306/criminalrecords";

                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                Statement  stmt = null;
                conn = DriverManager.getConnection(connectionURL, "root", "123456");

                stmt = conn.createStatement();
//                String sql = "DELETE FROM criminal WHERE criminal_id='" + id + "'";
//                stmt.executeUpdate(sql);
                System.out.println("Deleted.");
            } catch (Exception ep) {

            }

        }

    }

}
