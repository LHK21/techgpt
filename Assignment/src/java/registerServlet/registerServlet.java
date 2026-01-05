/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 * asus
 */
package registerServlet;

import entity.Account;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

/**
 *
 * @author Asus
 */
@WebServlet(name = "registerServlet", urlPatterns = {"/registerServlet"})
public class registerServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registerServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registerServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //register staff
        try{
            List<Account> accList= em.createNamedQuery("Account.findAll").getResultList();
            String accountID=null;
            String username=null;
            int count=0;
        if(accList.size() < 10)
        {
            accountID="ACC0"+(accList.size()+ 1);
        }
        else
        {
            accountID="ACC"+(accList.size()+ 1);
        }
           for(int i=0;i<accList.size();i++)
           {
               if(accList.get(i).getUsername().contains("stf"))
               {
                   count+=1;
               }
           }
           if(count<10)
           {
               username="stf0"+(count+1);
           }
           else
           {
               username="stf"+(count+1);
           }
           utx.begin();
           Account account = new Account(accountID,username,"staff","staff");
           em.persist(account);
           utx.commit();
           response.sendRedirect("Profile.jsp");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
@PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        List<Account> ac= em.createNamedQuery("Account.findAll").getResultList();
        String accountID;
        if(ac.size()<10)
        {
            accountID="ACC0"+(ac.size()+1);
        }
        else
        {
             accountID="ACC"+(ac.size()+1);
        }
        String name = request.getParameter("fullName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneNumber = request.getParameter("phoneNumber");
        String role = request.getParameter("role");
        try{
           for(int i=0;i<ac.size();i++)
           {
               if(ac.get(i).getUsername().equals(username))
               {
                   throw new Exception("There is already a user with this name");
               }
           }
           utx.begin();
           Account account = new Account();
           account.setAccountid(accountID);
           account.setEmail(email);
           account.setName(name);
           account.setPassword(password);
           account.setRole(role);
           account.setUsername(username);
           account.setPhonenumber(phoneNumber);
           em.persist(account);
           utx.commit();
           response.sendRedirect("CustLog.jsp");
        }
        catch(Exception e)
        {
            try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registerServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>" + e.getMessage() +"</h1>");
            out.println("<button onclick=\"location.href='CustLog.jsp'\">Back</button>");
            out.println("</body>");
            out.println("</html>");
        }
        }
        
    }  

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
