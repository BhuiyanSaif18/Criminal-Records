
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/DeletingUser"})
public class DeletingUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String identity = request.getParameter("key");
        char code = identity.charAt(0);
        String email = "";
        for (int i = 0; i < identity.length(); i++) {
            if (i == 0) {
            } else {
                email += identity.charAt(i);
            }
        }

        if (code == '1') {
            System.out.println("Admin");
            Connection conn = null;
            Statement stmt = null;

            try {
                String connectionURL = "jdbc:mysql://localhost:3306/criminalrecords";

                Class.forName("com.mysql.jdbc.Driver");

                conn = DriverManager.getConnection(connectionURL, "root", "123456");


                stmt = conn.createStatement();
                String sql = "DELETE FROM administration_login WHERE email = '" + email + "'";
                stmt.executeUpdate(sql);
                System.out.println("Deleted an admin.");
            } catch (SQLException se) {

                se.printStackTrace();
            } catch (Exception e) {

                e.printStackTrace();
            } finally {

                try {
                    if (stmt != null) {
                        conn.close();
                    }
                } catch (SQLException se) {
                }
                try {
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }


        } else if (code == '2') {
            System.out.println("Analytic");
            Connection conn = null;
            Statement stmt = null;

            try {
                String connectionURL = "jdbc:mysql://localhost:3306/criminalrecords";

                Class.forName("com.mysql.jdbc.Driver");

                conn = DriverManager.getConnection(connectionURL, "root", "123456");

                stmt = conn.createStatement();
                String sql = "DELETE FROM analytic_login WHERE email = '" + email + "'";
                stmt.executeUpdate(sql);
                System.out.println("Deleted an anaylic.");
            } catch (SQLException se) {
              
                se.printStackTrace();
            } catch (Exception e) {
                
                e.printStackTrace();
            } finally {
             
                try {
                    if (stmt != null) {
                        conn.close();
                    }
                } catch (SQLException se) {
                }
                try {
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }


        } else if (code == '3') {
            System.out.println("inputter");
            Connection conn = null;
            Statement stmt = null;

            try {
                String connectionURL = "jdbc:mysql://localhost:3306/criminalrecords";

                Class.forName("com.mysql.jdbc.Driver");

                System.out.println("Connecting to a selected database...");
                conn = DriverManager.getConnection(connectionURL, "root", "123456");
                System.out.println("Connected database successfully...");

                System.out.println("Creating statement...");
                stmt = conn.createStatement();
                String sql = "DELETE FROM inputter_login WHERE email = '" + email + "'";
                stmt.executeUpdate(sql);
                System.out.println("Deleted an inputter.");
            } catch (SQLException se) {

                se.printStackTrace();
            } catch (Exception e) {

                e.printStackTrace();
            } finally {

                try {
                    if (stmt != null) {
                        conn.close();
                    }
                } catch (SQLException se) {
                }
                try {
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
            System.out.println("Goodbye!");

        }
        PrintWriter out = response.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Successfully deleted an Items.');");
        out.println("location='accessHandle.jsp';");
        out.println("</script>");

        System.out.println(email);

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
