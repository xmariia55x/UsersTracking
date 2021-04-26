/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package usersTracking.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import usersTracking.dao.PersonFacade;
import usersTracking.entities.Person;

/**
 *
 * @author maria
 */
@WebServlet(name = "ServletConnectUsers", urlPatterns = {"/ServletConnectUsers"})
public class ServletConnectUsers extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @EJB
    private PersonFacade personFacade;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user1 = request.getParameter("person1_name");
        String user2 = request.getParameter("person2_name");
        
        if(user1 != null && user2 != null && user1.length() > 0 && user2.length() > 0){
            Person person1 = this.personFacade.find(Integer.parseInt(user1));
            Person person2 = this.personFacade.find(Integer.parseInt(user2));
            List<Person> friends1 = person1.getPersonList();
            friends1.add(person2);
            List<Person> friends1Update = person1.getPersonList();
            person1.setPersonList(friends1Update);
            
            this.personFacade.edit(person1);
            
            List<Person> friends2 = person2.getPersonList();
            friends2.add(person1);
            List<Person> friends2Update = person2.getPersonList();
            person2.setPersonList(friends2Update);
            
            this.personFacade.edit(person2);
            
            List<Person> people = this.personFacade.findAll();
            request.setAttribute("people", people);

            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
