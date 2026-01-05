/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import entity.Category;
import entity.Inventory;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author Loo Hong Kheng
 */
@WebServlet(name = "ModProduct", urlPatterns = {"/ModProduct"})
public class ModProduct extends HttpServlet {
@PersistenceContext
    EntityManager em;
@Resource
    UserTransaction utx;
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
            out.println("<title>Servlet ModProduct</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModProduct at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        int mod = Integer.parseInt(request.getParameter("mod"));
        List<Inventory> inven=(List<Inventory>) session.getAttribute("Product");
        Inventory choice=inven.get(0);
        try{
            //Fins the modification user choose and make the modification
        switch(mod){
            case 1:
                choice.setName(request.getParameter("name"));
                utx.begin();
                em.merge(choice);
                utx.commit();
                break;
            case 2:
                double price = Double.parseDouble(request.getParameter("price"));
                BigDecimal bdPrice= BigDecimal.valueOf(price);
                choice.setPrice(bdPrice);
                utx.begin();
                em.merge(choice);
                utx.commit();
                break;
            case 3:
                choice.setDescription(request.getParameter("description"));
                utx.begin();
                em.merge(choice);
                utx.commit();
                break;
            case 4:
                    String picture=null;
                    byte[] selectedPic=null;
                    File pic = new File("C:\\Users\\Loo Hong Kheng\\Desktop\\GUI Assingnment\\Assignment\\src\\java\\picture");
                    String[] picName = pic.list();
                    File[] allPic = pic.listFiles();
                    for(int i=0;i< picName.length ;i++)
                    {
                        if(picName[i].equals(request.getParameter("picture")))
                        {
                           FileInputStream inputImage = new FileInputStream(allPic[i]);
                           selectedPic = new byte[(int) allPic[i].length()];
                           inputImage.read(selectedPic);
                }}
                choice.setPicture(selectedPic);
                utx.begin();
                em.merge(choice);
                utx.commit();
                break;
            case 5:
                double discount = Double.parseDouble(request.getParameter("discount"));
                BigDecimal bdDiscount= BigDecimal.valueOf(discount);
                choice.setDiscount(bdDiscount);
                utx.begin();
                em.merge(choice);
                utx.commit();
                break;
            case 6:
                Category selectedCat = (Category) session.getAttribute("selectedChoice");
                choice.setCatid(selectedCat);
                utx.begin();
                em.merge(choice);
                utx.commit();
                break;
        }
        
        response.sendRedirect("ChooseProductMod.jsp?chosen=1");
        }catch(Exception e)
        {
            try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ModProduct</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1> Error has occured</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
