package cookies;



import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

/* 6b. Cookie Servlet Program */

@WebServlet("/cookie")
public class CookieServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("username");

        int visitCount = 1;
        boolean found = false;

        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("visitCount")) {
                    visitCount = Integer.parseInt(c.getValue());
                    visitCount++;
                    found = true;
                }
                if (c.getName().equals("username")) {
                    name = c.getValue();
                }
            }
        }

        // Create / Update cookies
        Cookie nameCookie = new Cookie("username", name);
        Cookie countCookie = new Cookie("visitCount", String.valueOf(visitCount));

        // Set expiry time (in seconds)
        nameCookie.setMaxAge(60);   // expires in 60 seconds
        countCookie.setMaxAge(60);

        response.addCookie(nameCookie);
        response.addCookie(countCookie);

        out.println("<html><body>");

        if (found) {
            out.println("<h2>Welcome back " + name + "!</h2>");
            out.println("<p>You have visited this page " + visitCount + " times</p>");
        } else {
            out.println("<h2>Welcome " + name + "!</h2>");
            out.println("<p>This is your first visit</p>");
        }

        out.println("<p><i>(Cookie will expire in 60 seconds)</i></p>");

        out.println("</body></html>");
    }
}