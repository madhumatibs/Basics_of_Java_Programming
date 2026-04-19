package lab8a;

/*
8a. Build a servlet program to create a cookie to get your name through text box and press submit button
(through HTML) to display the message by greeting Welcome back your name!, you have visited this page
n times (n = number of your visit) along with the list of cookies and demonstrate the expiry of cookie also.
*/

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/visit")
public class VisitServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("username");

        int visitCount = 0;

        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("visitCount")) {
                    visitCount = Integer.parseInt(c.getValue());
                }
            }
        }

        visitCount++;

        // Create cookies
        Cookie nameCookie = new Cookie("username", name);
        Cookie countCookie = new Cookie("visitCount", String.valueOf(visitCount));

        // Set expiry time (1 minute)
        nameCookie.setMaxAge(60);
        countCookie.setMaxAge(60);

        response.addCookie(nameCookie);
        response.addCookie(countCookie);

        // Output
        out.println("<html><body>");
        out.println("<h2>Welcome back " + name + "!</h2>");
        out.println("<p>You have visited this page " + visitCount + " times.</p>");

        out.println("<h3>List of Cookies:</h3>");

        if (cookies != null) {
            for (Cookie c : cookies) {
                out.println("Cookie Name: " + c.getName() + "<br>");
            }
        }

        out.println("<br><p><b>Note:</b> Cookies will expire in 60 seconds.</p>");
        out.println("</body></html>");
    }
}