/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import entity.Inventory;
import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.Orderdetails;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Loo Hong Kheng
 */
public class ReportServlet extends HttpServlet {
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
            out.println("<title>Servlet ReportServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReportServlet at " + request.getContextPath() + "</h1>");
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
            List<Inventory> allProduct = (List<Inventory>) session.getAttribute("AllProduct");
            int choice = Integer.parseInt(request.getParameter("choice"));
            List<Orderdetails> detail = em.createNamedQuery("Orderdetails.findAll").getResultList();
            Orderdetails[] orderList = new Orderdetails[detail.size()];
            Calendar ld = Calendar.getInstance();

            int[]totalquantity = new int[detail.size()];
            Orderdetails temp;
            int tempTotal;
            try{
                if(choice==1)
            {//Getting the total quantity
            for(int i=0;i<detail.size();i++)
            {
                for(int y=0;y<allProduct.size();y++)
                {
                    if(allProduct.get(y).getInvenid().equals(detail.get(i).getOrderdetailsPK().getInvenid()))
                    {
                        totalquantity[y] += detail.get(i).getQuantity();
                        orderList[y] =detail.get(i);
                    }
                }
            }
            //Sort in accending order
            for(int i=0;i<totalquantity.length;i++)
            {
                for(int y=i+1;y<totalquantity.length;y++)
                {
                    if(totalquantity[i]<totalquantity[y])
                    {
                        tempTotal=totalquantity[i];
                        totalquantity[i]=totalquantity[y];
                        totalquantity[y]=tempTotal;
                        temp=orderList[i];
                        orderList[i]=orderList[y];
                        orderList[y]=temp;
                    }
                }
            }//Write on page the result
            try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReportServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<button onclick=\"location.href='Report.jsp'\">Back</button>");
            for(int i=0;i<totalquantity.length;i++)
            {
                if(totalquantity[i]!=0)
                {int y=0;
                y=i+1;
                out.println("<h1>"+y+")"+orderList[i].getInventory().getName()+ "\t"+totalquantity[i]+"</h1>");
                }
            }
            out.println("</body>");
            out.println("</html>");
        }
            }
         if(choice==2)
         {//Getting the total quantity after finding the correct year and date
             int year = Integer.parseInt(request.getParameter("year"));
             for(int i=0;i<detail.size();i++)
             {
                 for(int y=0;y<allProduct.size();y++)
                 {
                 ld.setTime(detail.get(i).getOrders().getDate());
                 if(ld.get(Calendar.YEAR)==year&&allProduct.get(y).getInvenid().equals(detail.get(i).getOrderdetailsPK().getInvenid()))
                 {
                     totalquantity[y] += detail.get(i).getQuantity();
                     orderList[y] =detail.get(i);
                 }
                 }
             }
             //Sort in accending order
             for(int i=0;i<totalquantity.length;i++)
            {
                for(int y=i+1;y<totalquantity.length;y++)
                {
                    if(totalquantity[i]<totalquantity[y])
                    {
                        tempTotal=totalquantity[i];
                        totalquantity[i]=totalquantity[y];
                        totalquantity[y]=tempTotal;
                        temp=orderList[i];
                        orderList[i]=orderList[y];
                        orderList[y]=temp;
                    }
                }
            }//Write on page the result
            try (PrintWriter out = response.getWriter()) {
                boolean found=false;
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReportServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<button onclick=\"location.href='Report.jsp'\">Back</button>");
            out.println("<h1> Total Product sold in year"+ year +"</h1>");
            for(int i=0;i<totalquantity.length;i++)
            {
                if(totalquantity[i]!=0)
                {int y=0;
                y=i+1;
                out.println("<h1>"+y+")"+orderList[i].getInventory().getName()+ "\t"+totalquantity[i]+"</h1>");
                found=true;
                }
                
            }
            if(found==false)
            {
                out.println("<button onclick=\"location.href='Report.jsp'\">Back</button>");
                out.println("<h1>No Record found</h1>");
            }
            out.println("</body>");
            out.println("</html>");
        }
         }
         if(choice==3)
         {
             int year = Integer.parseInt(request.getParameter("year"));
             int month = Integer.parseInt(request.getParameter("month"));
             String monthInWord=null;
             switch(month)
             {
                 case 0:
                     monthInWord="January";
                     break;
                case 1:
                     monthInWord="February";
                     break;
                case 2:
                     monthInWord="March";
                     break;
                case 3:
                     monthInWord="April";
                     break;
                case 4:
                     monthInWord="May";
                     break;
                case 5:
                     monthInWord="June";
                     break;
                case 6:
                     monthInWord="July";
                     break;
                case 7:
                     monthInWord="August";
                     break;
                case 8:
                     monthInWord="September";
                     break;
                case 9:
                     monthInWord="October";
                     break;
                case 10:
                     monthInWord="November";
                     break;
                case 11:
                     monthInWord="December";
                     break;
             }
             for(int i=0;i<detail.size();i++)
             {
                 for(int y=0;y<allProduct.size();y++)
                 {
                 ld.setTime(detail.get(i).getOrders().getDate());
                 if(ld.get(Calendar.MONTH)==month&&allProduct.get(y).getInvenid().equals(detail.get(i).getOrderdetailsPK().getInvenid()))
                 {
                    if(ld.get(Calendar.YEAR)==year&&allProduct.get(y).getInvenid().equals(detail.get(i).getOrderdetailsPK().getInvenid()))
                 {
                     totalquantity[y] += detail.get(i).getQuantity();
                     orderList[y] =detail.get(i);
                 }
                 }
                 }
             }
             for(int i=0;i<totalquantity.length;i++)
            {
                for(int y=i+1;y<totalquantity.length;y++)
                {
                    if(totalquantity[i]<totalquantity[y])
                    {
                        tempTotal=totalquantity[i];
                        totalquantity[i]=totalquantity[y];
                        totalquantity[y]=tempTotal;
                        temp=orderList[i];
                        orderList[i]=orderList[y];
                        orderList[y]=temp;
                    }
                }
            }
            try (PrintWriter out = response.getWriter()) {
                boolean found=false;
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReportServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<button onclick=\"location.href='Report.jsp'\">Back</button>");
            out.println("<h1> Total Product sold in "+monthInWord + year+"</h1>");
            for(int i=0;i<totalquantity.length;i++)
            {
                if(totalquantity[i]!=0)
                {int y=0;
                y=i+1;
                out.println("<h1>"+y+")"+orderList[i].getInventory().getName()+ "\t"+totalquantity[i]+"</h1>");
                found=true;
                }
                
            }
            
            if(found==false)
            {
                out.println("<button onclick=\"location.href='Report.jsp'\">Back</button>");
                out.println("<h1>No Record found</h1>");
            }
            out.println("</body>");
            out.println("</html>");
        }
         }
         else
             throw new Exception("Error not valid choice");
            }
            catch(Exception e)
            {
                try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReportServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>"+ e.getMessage() +"</h1>");
            out.println("<button onclick=\"location.href='Report.jsp'\">Back</button>");
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
