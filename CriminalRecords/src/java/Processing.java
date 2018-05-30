
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/Processing"})
public class Processing extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {

            String name = request.getParameter("newName");
            String email = request.getParameter("newEmail");
            String post = request.getParameter("newPost");
            String thana = request.getParameter("newThana");
            String district = request.getParameter("newDistrict");
            String auth = request.getParameter("newAuth");

            if (name == "" || email == "" || post == "" || thana == "" || district == "") {
                throw new NullPointerException();

            } else {
                Connection connection = null;
                Statement statement = null, stm = null;
                try {
                    System.out.println("in the else statement");
                    String connectionURL = "jdbc:mysql://localhost:3306/criminalrecords";

                    Class.forName("com.mysql.jdbc.Driver").newInstance();

                    connection = DriverManager.getConnection(connectionURL, "root", "123456");

                    stm = connection.createStatement();
                    String QueryString = "";
                    if (auth.contains("admin")) {
                        QueryString = "SELECT email FROM administration_login WHERE email='" + email + "'";
                    } else if (auth.contains("analytic")) {
                        QueryString = "SELECT email FROM analytic_login WHERE email='" + email + "'";
                    } else {
                        QueryString = "SELECT email FROM inputter_login WHERE email='" + email + "'";
                    }
                    ResultSet rs = null;
                    rs = stm.executeQuery(QueryString);
                    boolean ck = rs.next();
                    if (ck == false) {

                        try {
                            if (stm != null) {
                                stm.close();
                            }
                        } catch (SQLException se2) {
                        }

                    } else {
                        throw new ArithmeticException();
                    }
                    statement = connection.createStatement();
                    if (auth.contains("admin")) {

                        QueryString = "INSERT INTO administration_login (name, position, thana, district, email) VALUES('" + name + "','" + post + "','" + thana + "','" + district + "','" + email + "')";
                    } else if (auth.contains("analytic")) {

                        QueryString = "INSERT INTO analytic_login (name, position, thana, district, email) VALUES(' " + name + "','" + post + "','" + thana + "','" + district + "','" + email + "')";
                    } else {
                        QueryString = "INSERT INTO inputter_login (name, position, thana, district, email) VALUES('" + name + "','" + post + "','" + thana + "','" + district + "','" + email + "')";
                    }

                    statement.executeUpdate(QueryString);
                    System.out.println("chacking 1 ");

                    ServletContext context = getServletContext();
                    RequestDispatcher dispatcher = context.getRequestDispatcher("/accessHandle.jsp");
                    dispatcher.forward(request, response);

                } catch (ArithmeticException ui) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Already have an Account.');");
                    out.println("location='accessHandle.jsp';");
                    out.println("</script>");
                }

            }
        } catch (Exception ti) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Fields are not fullfield properly, Try again.');");
            out.println("location='accessHandle.jsp';");
            out.println("</script>");
            System.out.println("Insert hoy nai");
            ti.printStackTrace();

        } finally {
            out.close();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
