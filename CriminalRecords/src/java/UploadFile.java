
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(urlPatterns = {"/UploadFile"})
public class UploadFile extends HttpServlet {

    public static ArrayList<Integer> numbers = new ArrayList();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        if ("SearchEntry".equals(action)) {
            String name = request.getParameter("Criminal_Name");
            String nid = request.getParameter("Criminal_NID");
            String age = request.getParameter("Criminal_Age");
            String height = request.getParameter("Criminal_Height");
            String status = request.getParameter("Criminal_Status");
            String address = request.getParameter("Criminal_Address");

            String file = request.getParameter("criminal_photo");

            System.out.println(name + "   " + nid + "   " + name + "   " + age + "   " + height + "   " + status + "   " + address + "   " + file + "   ");
            ResultSet rssheet = null;
            Connection connection = null;

            Statement statement = null;

//                        String topic = DefultMethods.sub;
//                        boolean ckhInt = DefultMethods.ckhint;
//                        System.out.println(topic + "    " + ckhInt);
            String connectionURL = "jdbc:mysql://localhost:3306/criminalrecords";

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();

                System.out.println("line 2");
                connection = DriverManager.getConnection(connectionURL, "root", "123456");
                System.out.println("line 3");
                statement = connection.createStatement();
                int ag = Integer.valueOf(age);
                int high = Integer.valueOf(height);
                String QueryString = "SELECT * FROM criminal WHERE name LIKE '%" + name + "%' UNION SELECT * FROM criminal WHERE nid LIKE '%" + nid + "%'UNION SELECT * from criminal WHERE age = " + age + " UNION SELECT * from criminal WHERE height =" + high + ";";

                rssheet = statement.executeQuery(QueryString);
                out.print("<html>");
                out.print("<head>");
                out.print("<style> table { font-family: arial, sans-serif; border-collapse: collapse; width: 100%;} td, th { border: 1px solid #dddddd; text-align: left; padding: 8px;} tr:nth-child(even) { background-color: #dddddd;}</style>");
                out.print("</head><body><table>");
                out.print("<tr><th>Name</th><th>NID</th><th>Age</th><th>Height</th><th>Crimes</th></tr>");
                while (rssheet.next()) {
                    out.print(" <tr><td>" + rssheet.getString(2) + "</td><td>" + rssheet.getString(3) + "</td><td>" + rssheet.getString(4) + "</td><td>" + rssheet.getString(5) + "</td><td>" + rssheet.getString(8) + "</td></tr>");
                }
                out.print("</table>\n"
                        + "\n"
                        + "</body>\n"
                        + "</html>");

                System.out.println("Query done ");
            } catch (Exception io) {

            }
        } else if ("Create New Criminal".equals(action)) {

            String name = request.getParameter("Criminal_Name");
            String nid = request.getParameter("Criminal_NID");
            String age = request.getParameter("Criminal_Age");
            int ag = Integer.valueOf(age);
            String height = request.getParameter("Criminal_Height");
            int high = Integer.valueOf(height);
            String status = request.getParameter("Criminal_Status");
            int stat = Integer.valueOf(status);
            String address = request.getParameter("Criminal_Address");

            String path = request.getParameter("criminal_photo");

            ResultSet rs = null;
            Connection connection = null;

            Statement statement = null;

//                        String topic = DefultMethods.sub;
//                        boolean ckhInt = DefultMethods.ckhint;
//                        System.out.println(topic + "    " + ckhInt);
            String connectionURL = "jdbc:mysql://localhost:3306/criminalrecords";

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();

                System.out.println("line 2");
                connection = DriverManager.getConnection(connectionURL, "root", "123456");
                System.out.println("line 3");
                statement = connection.createStatement();

                String QueryString = "INSERT INTO criminal VALUES(NULL, '" + name + "', '" + nid + "','" + ag + "','" + high + "', '" + stat + "','50', '1', '100');";

                statement.executeUpdate(QueryString);
                statement.close();
                statement = connection.createStatement();

                QueryString = "SELECT criminal_id FROM criminal WHERE name = '" + name + "';";
                System.out.println("line 4");
                int id = 0;
                rs = statement.executeQuery(QueryString);

                while (rs.next()) {
                    id = rs.getInt(1);
                }
                numbers.add(id);
                rs.close();
                statement.close();
                System.out.println(id);

                statement = connection.createStatement();
                String Q = "INSERT INTO address VALUES(NULL, '" + id + "', '" + address + "', '', '','');";
                System.out.println(Q);
                System.out.println("line 4");
                statement.executeUpdate(Q);
                statement.close();

                statement = connection.createStatement();

                InputStream inStream = null;
                OutputStream outStream = null;
                
                try {
                    String temp = String.valueOf(id)+"001.jpg";
                    String namefile= "criminal_"+temp;
                    
                    File afile = new File("G:\\Pictures\\Memories of sust life\\random\\"+path);
                    File bfile = new File("E:\\Databasdee\\CriminalRecords\\web\\images\\"+namefile);

                    inStream = new FileInputStream(afile);
                    outStream = new FileOutputStream(bfile);

                    byte[] buffer = new byte[1024];

                    int length;
                    //copy the file content in bytes
                    while ((length = inStream.read(buffer)) > 0) {

                        outStream.write(buffer, 0, length);

                    }

                    inStream.close();
                    outStream.close();

                    //delete the original file
                    afile.delete();
                      
                    System.out.println("File is copied successful!");
                    statement.executeUpdate("INSERT into criminal_image Values(null, '"+id+"', '"+temp+"');");

                } catch (IOException e) {
                    e.printStackTrace();
                }

//                Files.copy();
                out.println("Successfully added.");

                System.out.println("line 5");
            } catch (Exception pt) {
                System.out.println("Hello error");

            }

            System.out.println("Done");

        } else if ("create".equals(action)) {
            System.out.println("create");

            String head = request.getParameter("crime_heding");
            String type = request.getParameter("crime_type");
            String detail = request.getParameter("crime_detail");
            String locaton = request.getParameter("crime_location");
            String time = request.getParameter("crime_time");
            String photo = request.getParameter("crime_photo");
            String victim = request.getParameter("crime_victim");
            String dead = request.getParameter("dead");
            String injured = request.getParameter("injured");
            String affected = request.getParameter("affected");
            int t = 1;

            if (type.contains("Antisocial Behavior")) {
                t = 1;
            } else if (type.contains("Arson")) {
                t = 2;
            } else if (type.contains("Burglary")) {
                t = 3;
            } else if (type.contains("Childhood Abuse")) {
                t = 4;
            } else if (type.contains("Crime Abroad")) {
                t = 5;
            } else if (type.contains("Domestic Abuse")) {
                t = 6;
            } else if (type.contains("Fraud")) {
                t = 7;
            } else if (type.contains("Hate Crime")) {
                t = 8;
            } else if (type.contains("Murder or Manslaughter")) {
                t = 9;
            } else if (type.contains("Organized Crime")) {
                t = 10;
            } else if (type.contains("Property Crime")) {
                t = 11;
            } else if (type.contains("Rape, Sexual Assault & Sexual Harassment")) {
                t = 12;
            } else if (type.contains("Robbery")) {
                t = 13;
            } else if (type.contains("Stalking, Offenses & Harassment")) {
                t = 14;
            } else if (type.contains("Terror Attack")) {
                t = 15;
            } else if (type.contains("Violent Crime")) {
                t = 16;
            } else if (type.contains("Others")) {
                t = 17;
            }

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection connection = null;
                System.out.println("line 2");
                String connectionURL = "jdbc:mysql://localhost:3306/criminalrecords";
                connection = DriverManager.getConnection(connectionURL, "root", "123456");
                System.out.println("line 3");

                Statement statement = connection.createStatement();

                String QueryString = "INSERT INTO crime VALUES(null, '" + head + "','" + t + "','" + detail + "','" + locaton + "', '" + time + "','" + Integer.valueOf(dead) + "','" + Integer.valueOf(injured) + "','" + Integer.valueOf(affected) + "','" + victim + "',1);";
//                        "INSERT INTO criminal VALUES(NULL, '" + head + "', '" + t + "','" + detail + "','" + locaton + "', '" + time + "','" + Integer.valueOf(dead) + "', '" + Integer.valueOf(injured)+ "','" + Integer.valueOf(affected) + ",'" + victim + "');";
                System.out.println(QueryString);
                statement.executeUpdate(QueryString);
                System.out.println("jsdknvjknsdvkjnsd");

                statement.close();
                int a = 0;
                statement = connection.createStatement();
                QueryString = "SELECT crime_id FROM crime where Heading = '" + head + "';";
                ResultSet rs = null;
                rs = statement.executeQuery(QueryString);
                while (rs.next()) {
                    a = rs.getInt(1);
                }
                System.out.println(a);
                rs.close();
                statement.close();
                statement = connection.createStatement();
                for (int i = 0; i < numbers.size(); i++) {
                    System.out.println(a + " " + numbers.get(i));
                    statement.executeUpdate("INSERT INTO join_table values(null,'" + a + "', '" + numbers.get(i) + "')");

                }
                statement.close();
                statement = connection.createStatement();
                statement.executeUpdate("UPDATE crime set criminals_number= '" + numbers.size() + "' where crime_id= '" + a + "' ;");
                System.out.println("uodate file 1 ");
                numbers.clear();

                
                statement = connection.createStatement();

                InputStream inStream = null;
                OutputStream outStream = null;
                
                try {
                    String temp = String.valueOf(a)+"001.jpg";
                    String namefile= "crime_"+temp;
                    
                    File afile = new File("G:\\Pictures\\Memories of sust life\\random\\"+photo);
                    File bfile = new File("E:\\Databasdee\\CriminalRecords\\web\\images\\"+namefile);

                    inStream = new FileInputStream(afile);
                    outStream = new FileOutputStream(bfile);

                    byte[] buffer = new byte[1024];

                    int length;
                    //copy the file content in bytes
                    while ((length = inStream.read(buffer)) > 0) {

                        outStream.write(buffer, 0, length);

                    }
                       System.out.println("uodate file 2 ");
                    inStream.close();
                    outStream.close();

                    //delete the original file
                    afile.delete();
                      
                    System.out.println("File is copied successful!");
                    System.out.println("uodate file 1 INSERT into crime_image Values(null, '"+a+"', '"+temp+"')");
                    statement.executeUpdate("INSERT into crime_image Values(null, '"+a+"', '"+temp+"');");
                        
                } catch (IOException e) {
                    e.printStackTrace();
                }

//                Files.copy();
                out.println("Successfully added.");
            } catch (Exception df) {
                System.out.println("a;ldskfj");
            }

        } else if ("cancel".equals(action)) {
            System.out.println("asdklfjpkdjfdsklf");

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
