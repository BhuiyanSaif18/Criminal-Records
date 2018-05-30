/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author razza
 */
@WebServlet(urlPatterns = {"/SearchResult"})
public class SearchResult extends HttpServlet {
    public static ResultSet rs = null;
   // public  String topic = "";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("a;sldkfja;lsn;vlskdnd");
        response.setContentType("text/html;charset=UTF-8");
        String topic = request.getParameter("topic");
        DefultMethods dm = new DefultMethods(topic);
        PrintWriter out = response.getWriter();
        Connection connection = null;

                        Statement statement = null;

                        
        try {
//           
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet SearchResult</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet SearchResult at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
             boolean ckhInt=  DefultMethods.isInteger(topic);
                       
                       System.out.println(topic +"    "+ckhInt);
                        String connectionURL = "jdbc:mysql://localhost:3306/criminalrecords";
                        

                        System.out.println("line 1");
                        Class.forName("com.mysql.jdbc.Driver").newInstance();

                        System.out.println("line 2");
                        connection = DriverManager.getConnection(connectionURL, "root", "123456");
                        System.out.println("line 3");
                        statement = connection.createStatement();
                        
                        
                        
                        
                        String QueryString = "SELECT * FROM criminal WHERE name LIKE '%"+topic+"%' ORDER BY marking DESC;";
       
                        rs = statement.executeQuery(QueryString);
                        
                        System.out.println("Query done ");
                        
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SearchResult.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(SearchResult.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(SearchResult.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SearchResult.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ServletContext context = getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/searchResult.jsp");
            dispatcher.forward(request, response);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
