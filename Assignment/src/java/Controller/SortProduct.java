/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import entity.Category;
import entity.Inventory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Loo Hong Kheng
 */
@WebServlet(name = "SortProduct", urlPatterns = {"/SortProduct"})
public class SortProduct extends HttpServlet {
@PersistenceContext
        EntityManager em;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SortProduct</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String tag = request.getParameter("tag");
        HttpSession session = request.getSession();
        Boolean found =false;
        List<Inventory> product=null;
        List<Inventory> allproduct=null;
        //Find product by all or category
        session.removeAttribute("Product");
        allproduct=em.createNamedQuery("Inventory.findAll").getResultList();
        session.setAttribute("AllProduct", allproduct);
        if(tag.equalsIgnoreCase("all"))
        {
            product=em.createNamedQuery("Inventory.findAll").getResultList();
            found=true;
        }
        if(found==false)
        {
            Category findInventory=new Category(tag);
            product=em.createNamedQuery("Inventory.findByCategory").setParameter("catid", findInventory).getResultList();
            if(!product.isEmpty())
                found=true;
        }
         
         session.setAttribute("Product", product);
         if(tag.equalsIgnoreCase("allR"))//Initialize all product if manager enter report first
        {
            response.sendRedirect("Report.jsp");
        }
         else
            response.sendRedirect("DisplayProduct.jsp");
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
        String tag = request.getParameter("ProductName");
        String location= request.getParameter("location");
        HttpSession session = request.getSession();
        Boolean found =false;
        List<Inventory> product=null;
        session.removeAttribute("Product");
        List<Category> list = em.createNamedQuery("Category.findAll").getResultList();
        session.setAttribute("Category", list);
        List<Inventory> allproduct=null;
        allproduct=em.createNamedQuery("Inventory.findAll").getResultList();
        if(found==false)
        {//Find product by inventory id
            product=em.createNamedQuery("Inventory.findByInvenid").setParameter("invenid", tag).getResultList();
            if(!product.isEmpty())
                found=true;
        }
         if(found==false)
        {//Find product by name
            product=em.createNamedQuery("Inventory.findByName").setParameter("name", tag).getResultList();
            if(!product.isEmpty())
                found=true;
        }
         
         session.setAttribute("Product", product);
         session.setAttribute("AllProduct", allproduct);
         
         if(location.equals("modify")&&!product.isEmpty())
         {//Send the result to modify page
             response.sendRedirect("ChooseProductMod.jsp?chosen=1");
         }
         else if(location.equals("delete")&&!product.isEmpty())
         {//Send the result to delete page
               response.sendRedirect("DeleteProduct.jsp?chosen=1");  
         }
         else if(location.equals("search")&&!product.isEmpty())
         {//Send the result to display page
               response.sendRedirect("DisplayProduct.jsp");  
         }
         else
         {//Error if cannot find the item
             response.sendRedirect("ProductNotFound.jsp");
         }
         
         
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
