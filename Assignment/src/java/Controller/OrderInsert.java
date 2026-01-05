/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Sales.Cart;
import entity.Account;
import entity.Orderdetails;
import entity.OrderdetailsPK;
import entity.Orders;
import entity.Payment;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Calendar;
import java.util.Date;
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
@WebServlet(name = "OrderInsert", urlPatterns = {"/OrderInsert"})
public class OrderInsert extends HttpServlet {
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
            out.println("<title>Servlet OrderInsert</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderInsert at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Cart cart = (Cart)session.getAttribute("cart");
        List<Orders> orderList = em.createNamedQuery("Orders.findAll").getResultList();
        List<Account> accList = em.createNamedQuery("Account.findByAccountid").setParameter("accountid", session.getAttribute("accountId")).getResultList();
        List<Payment> payList = em.createNamedQuery("Payment.findAll").getResultList();
        Account currentAccount = accList.get(0);
        Date currentDate = new Date();
        Calendar  cal = Calendar.getInstance();
        cal.setTime(currentDate);
        Date payDate;
        cal.add(Calendar.DATE, 5);
        payDate =cal.getTime();
        double totalAmount = (Double) session.getAttribute("grandAmount");
        BigDecimal totalPay = new BigDecimal(totalAmount).setScale(2, RoundingMode.CEILING);
        String orderID =null;
        Payment pay;
        //Generate Order ID
        if(orderList.size()<10)
        {
            orderID="od0"+(orderList.size()+1);
        }
        else
        {
            orderID="od"+(orderList.size()+1);
        }
        //Generate Payment ID
         String PayID =null;
        if(payList.size()<10)
        {
            PayID="pay0"+(payList.size()+1);
        }
        else
        {
            PayID="pay"+(payList.size()+1);
        }
        //Create Order
        Orders order = new Orders(orderID,currentDate,currentAccount);
        
        if(session.getAttribute("card")==null)
        {
              //Determine if customer has paid already
           pay= new Payment(PayID,totalPay,"unpaid",payDate,order);
        }
        else
        {
            pay= new Payment(PayID,totalPay,"paid",currentDate,order);
        }
        try{
                   //Insert into database
            utx.begin();
            em.persist(order);
            em.persist(pay);
            utx.commit();
            for(int i=0;i<cart.getOrder().getProducts().size();i++)
            {
                OrderdetailsPK pk= new OrderdetailsPK(orderID,cart.getOrder().getProducts().get(i).getInvenid());
                Orderdetails ordet = new Orderdetails(pk,Long.valueOf(cart.getOrder().getQuantities().get(i)),cart.getOrder().getProducts().get(i),order);
                utx.begin();
                em.persist(ordet);
                utx.commit();
            }
            //Reset order
            session.removeAttribute("cart");
            session.removeAttribute("card");
            session.setAttribute("arriveDate", payDate);
            response.sendRedirect("endOfPayment.jsp");
        }catch(Exception ex)
        {
            try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderInsert</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Error in inserting data " + ex.getMessage() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
        }
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
