package UserServlet;

/*
10.a Build an Application to get Username, Email and Designation through JSP called index.jsp with
client sided validation and submit to the servlet called UserDataServlet and process all the fields with
server sided validation and display all the data through result.jsp with a link to move to the client side
*/

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/user")
public class UserDataServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("username");
        String email = request.getParameter("email");
        String desig = request.getParameter("designation");

        if (name == null || email == null || desig == null ||
            name.isEmpty() || email.isEmpty() || desig.isEmpty()) {

            response.getWriter().println("Invalid Input!");
            return;
        }

        // pass data to JSP
        request.setAttribute("username", name);
        request.setAttribute("email", email);
        request.setAttribute("designation", desig);

        RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
        rd.forward(request, response);
    }
}
