package controller;

import domains.User;
import service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by Nikita on 8/19/16.
 */
@WebServlet(name = "UserServlet")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String page = request.getParameter("page");
        if(page.equalsIgnoreCase("login")){
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            User user = new UserService().getUser(username, password);
            if(user != null) {
                if(user.getRole().equalsIgnoreCase("ROLE_ADMIN")){
                    request.setAttribute("message", "Login Success!");
//                request.setAttribute("user", user);
                    session.setAttribute("user", user);
                    RequestDispatcher rd = request.getRequestDispatcher("user/homeAdmin.jsp");
                    rd.forward(request, response);
                }
                else if(user.getRole().equalsIgnoreCase("ROLE_USER")) {
                    request.setAttribute("message", "Login Success!");
//                request.setAttribute("user", user);
                    session.setAttribute("user", user);
                    RequestDispatcher rd = request.getRequestDispatcher("user/homeUser.jsp");
                    rd.forward(request, response);
                }

            }
             else{
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }

        }
        else if(page.equalsIgnoreCase("logout")){

            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            session.removeAttribute("user");
            session.invalidate();
            rd.forward(request, response);


        }
        else if(page.equalsIgnoreCase("userList")){
            if(session.getAttribute("user") != null){
                redirectList(request,response);
            }
            else {
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }

        }
        else if(page.equalsIgnoreCase("home")){
            if(session.getAttribute("user") != null){
                RequestDispatcher rd = request.getRequestDispatcher("user/homeAdmin.jsp");
                rd.forward(request, response);
            }
            else {
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }

        }

        else if(page.equalsIgnoreCase("editUser")){

            if(session.getAttribute("user") != null){
                int id = Integer.parseInt(request.getParameter("userID"));
                User user = new UserService().editUser(id);
                request.setAttribute("user", user);
                RequestDispatcher rd = request.getRequestDispatcher("user/userEdit.jsp");
                rd.forward(request, response);
            }
            else {
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }

        }
        else if(page.equalsIgnoreCase("deleteUser")){

            if(session.getAttribute("user") != null){
                int id = Integer.parseInt(request.getParameter("userID"));
                boolean res = new UserService().deleteUser(id);
                if(res){
                    redirectList(request,response);
                }
            }
            else {
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }

        }
        else if(page.equalsIgnoreCase("update")){
            if (session.getAttribute("user") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String role = request.getParameter("role");
                boolean res = new UserService().updateUser(id, username, password, role);
                if (res) {
                    redirectList(request, response);
                }
            }
            else {
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
        }
        else if(page.equalsIgnoreCase("userAddPage")){
            if(session.getAttribute("user") != null) {
                RequestDispatcher rd = request.getRequestDispatcher("user/addUser.jsp");
                rd.forward(request, response);
            }
            else {
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
        }

        else if(page.equalsIgnoreCase("addUser")){
            if(session.getAttribute("user") != null) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String role = request.getParameter("role");
                boolean res = new UserService().createUser(username, password, role);
                if (res) {
                    redirectList(request, response);
                }
            }
            else {
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }

        }


    }

    public void redirectList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<User> userList = new UserService().getUserList();
        if (userList !=null){
            request.setAttribute("userList", userList);
            RequestDispatcher rd = request.getRequestDispatcher("user/userlist.jsp");
            rd.forward(request, response);
        }
    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          doPost(request,response);
    }
}
