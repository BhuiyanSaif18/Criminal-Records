
import com.sun.mail.imap.IMAPFolder;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.URLName;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/homePage"})
public class homePage extends HttpServlet {

    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/criminalrecords?autoReconnect=true&useSSL=false";
    static final String USER = "root";
    static final String PASS = "123456";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String user = request.getParameter("user");
        String pass = request.getParameter("password");
        String auth = request.getParameter("authLevel");

        try {
            if (user == "" || pass == "") {
                throw new NullPointerException();

            } else if (auth == "" || auth == null) {
                System.out.println("hello auth");
                throw new ArithmeticException();

            }
            URLName url = new URLName("imap", "imap.gmail.com", -1, "INBOX", user, pass);
            System.out.println("line 1");

            Properties props = new Properties();
            props.setProperty("mail.imap.ssl.enable", "true");
            props.setProperty("mail.store.protocol", "imaps");
            Session ssn = Session.getDefaultInstance(props, null);
            ssn.setDebug(false);

            System.out.println("line 2");

            Store store;

            store = ssn.getStore(url);
            store.connect("imap.gmail.com", user, pass);

            System.out.println(" line 3");

            IMAPFolder inbox = (IMAPFolder) store.getFolder("INBOX");
            inbox.open(Folder.READ_WRITE);
            System.out.println("line 4");

            Connection conn = null;
            Statement stmt = null;

            Class.forName("com.mysql.jdbc.Driver");

            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            System.out.println("Creating statement...");
            stmt = conn.createStatement();
            System.out.println(auth);

            String sql;
            if (auth.contains("Administration")) {
                sql = "SELECT email FROM administration_login WHERE email='" + user + "'";
            } else if (auth.contains("Analytics")) {
                sql = "SELECT email FROM analytic_login WHERE email='" + user + "'";
            } else {
                sql = "SELECT email FROM inputter_login WHERE email='" + user + "'";
            }
            System.out.println(sql);
            ResultSet rs = stmt.executeQuery(sql);
            boolean ck = rs.next();
            if (ck == false) {
                System.out.println("not there");

                try {
                    if (stmt != null) {
                        stmt.close();
                    }
                } catch (SQLException se2) {
                }
                try {
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException se) {
                    se.printStackTrace();
                }
                throw new ArrayIndexOutOfBoundsException();
            } else {
                System.out.println("Got it");
            }

            rs.close();
            stmt.close();
            conn.close();

            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se2) {
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }

            String loggedIn = "1";
            String userType = "";
            if (auth.contains("Administration")) {
                userType = "1";
            } else if (auth.contains("Analytics")) {
                userType = "2";
            } else {
                userType = "3";
            }

            HttpSession tempSession = request.getSession();
            tempSession.setAttribute("loggedInOrNot", loggedIn);
            tempSession.setAttribute("accountType", userType);
            tempSession.setAttribute("viewId", "1");
            tempSession.setAttribute("viewTable", "1");

            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/homePage.jsp");
            dispatcher.forward(request, response);

        } catch (MessagingException ex) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Gmail ID or password is incorrect');");
            out.println("location='index.jsp';");
            out.println("</script>");

            Logger.getLogger(homePage.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NullPointerException np) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Gmail ID and password can not be null');");
            out.println("location='index.jsp';");
            out.println("</script>");
        } catch (ArithmeticException ap) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Authentication Label must be defined.');");
            out.println("location='index.jsp';");
            out.println("</script>");

        } catch (SQLException se) {

        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Unknown Error occure. Please try again.');");
            out.println("location='index.jsp';");
            out.println("</script>");
        } catch (ArrayIndexOutOfBoundsException ae) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('You are not allowed to log in here.');");
            out.println("location='index.jsp';");
            out.println("</script>");

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
