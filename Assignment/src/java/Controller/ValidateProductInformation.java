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
@WebServlet(name = "ValidateProductInformation", urlPatterns = {"/ValidateProductInformation"})
public class ValidateProductInformation extends HttpServlet {
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
            out.println("<title>Servlet ValidateProductInformation</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ValidateProductInformation at " + request.getContextPath() + "</h1>");
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
        boolean found=false;
        HttpSession session=request.getSession();
        List<Inventory> existProduct = (List<Inventory>) session.getAttribute("AllProduct");
        List<Inventory> selectedInvenList = (List<Inventory>) session.getAttribute("Product");
        Inventory selectedInven = selectedInvenList.get(0);
        PrintWriter out = response.getWriter();
        try{
        if(request.getParameter("name")!=null)
        {//check if product name is the null or is the same as existing product
             if(request.getParameter("name").trim().equals(""))
            {
              throw new Exception("Error inputed value for product name or description is null");
            }
             
            for(int i=0;i<existProduct.size();i++)
                    {
                        if(existProduct.get(i).getName().toLowerCase().equals(request.getParameter("name")))
                        {
                            throw new Exception("Error there is a product with the same name already");
                        }
                    }
        }
        //check if product price and discount is not null or negative
        if(request.getParameter("price")!=null)
        {
             if(Double.parseDouble(request.getParameter("price"))<0||Double.parseDouble(request.getParameter("price"))==0)
            {
              throw new Exception("Error inputed value for product price cannot be zero or negative");
            }
        }
        
        if(request.getParameter("discount")!=null)
        {
             if(Double.parseDouble(request.getParameter("discount"))<0||(selectedInven.getPrice().doubleValue()-Double.parseDouble(request.getParameter("discount")))<=0)
            {
              throw new Exception("Error inputed value for product discount cannot be negative or bigger than or equal to price");
            }
        }
        //check if product description is null 
        if(request.getParameter("description")!=null)
        {
             if(request.getParameter("description").trim().equals(""))
            {
              throw new Exception("Error inputed value for product description is null");
            }
        }
 
        request.getRequestDispatcher("ConfirmProductMod.jsp").forward(request, response);
    }catch(Exception e)
        {
            out.println("<!DOCTYPE html>");
                     out.println("<html>");
                     out.println("<head>");
                     out.println("<title>Servlet ValidateProductInformation</title>");            
                     out.println("</head>");
                     out.println("<body>");
                     out.println("<h1>"+ e.getMessage() +"</h1>");
                     out.println("<button onclick=\"location.href='ChooseProductMod.jsp?chosen=1'\">Back</button>");
                     out.println("</body>");
                     out.println("</html>");
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
                HttpSession session=request.getSession();
                session.removeAttribute("newProduct");
                List<Inventory> existProduct = (List<Inventory>) session.getAttribute("AllProduct");
                PrintWriter out = response.getWriter();
                String id;
                //Create product ID
                if(existProduct.size()<10)
                {
                 id="Inven0"+(existProduct.size()+1);
                }
                else
                id="Inven"+existProduct.size();
                try
                {//check if product namee is the null or is the same as existing product
                    String productName = request.getParameter("ProductName");
                    productName=productName.toLowerCase();
                    for(int i=0;i<existProduct.size();i++)
                    {
                        if(existProduct.get(i).getName().toLowerCase().equals(productName))
                        {
                            throw new Exception("Error there is a product with the same name already");
                        }
                    }//check if product price and discount is not null or negative
                    double productPrice = Double.parseDouble(request.getParameter("ProductPrice"));
                    if(productPrice ==0|| productPrice <0)
                    {
                        throw new Exception("Error Price cannot be 0 or below 0");
                    }
                    BigDecimal bdPrice= BigDecimal.valueOf(productPrice);
                    String productDescription = request.getParameter("ProductDescription");
                    String pictureName =  request.getParameter("ProductPicture");
                    double discount = Double.parseDouble(request.getParameter("Discount"));
                    if(discount <0||(productPrice-discount)<=0)
                    {
                        throw new Exception("Error discount cannot be negative or bigger than or equal to price");
                    }
                    BigDecimal bdDiscount= BigDecimal.valueOf(discount);
                    //check if product description is null 
                    if(productName.trim().equals("")||productDescription.equals(""))
                    {
                        throw new Exception("Error inputed value for product name or description is null");
                    }
                    String category = request.getParameter("category");
                    List<Category> catList = (List<Category>)session.getAttribute("Category");
                    Category selectedCat = new Category();
                    for(int i=0;i<catList.size();i++)
                    {
                        if(catList.get(i).getCatid().equals(category))
                        {
                            selectedCat = catList.get(i);
                        }
                    } //find the image folder and get the specific image 
                    File pic = new File("C:\\Users\\Loo Hong Kheng\\Desktop\\GUI Assingnment\\Assignment\\src\\java\\picture");
                    String[] picName = pic.list();
                    File[] allPic = pic.listFiles();
                    for(int i=0;i< picName.length ;i++)
                    {
                        if(picName[i].equals(pictureName))
                        {
                           FileInputStream inputImage = new FileInputStream(allPic[i]);
                           byte[] selectedPic = new byte[(int) allPic[i].length()];
                           inputImage.read(selectedPic);
                           Inventory newProduct= new Inventory(id,productName,bdPrice,productDescription,selectedPic,bdDiscount,selectedCat);
                           session.setAttribute("newProduct", newProduct);
                }}
                    response.sendRedirect("ConfirmProduct.jsp");
                }catch(NumberFormatException e)
                {
                    out.println("<!DOCTYPE html>");
                     out.println("<html>");
                     out.println("<head>");
                     out.println("<title>Servlet ValidateProductInformation</title>");            
                     out.println("</head>");
                     out.println("<body>");
                     out.println("<h1>Error inputed price or discount is not a number </h1>");
                     out.println("<button onclick=\"location.href='InsertProduct.jsp'\">Back</button>");
                     out.println("</body>");
                     out.println("</html>");
                }
                catch(Exception e)
                {
                     /* TODO output your page here. You may use following sample code. */
                     out.println("<!DOCTYPE html>");
                     out.println("<html>");
                     out.println("<head>");
                     out.println("<title>Servlet ValidateProductInformation</title>");            
                     out.println("</head>");
                     out.println("<body>");
                     out.println("<h1>"+ e.getMessage() +"</h1>");
                     out.println("<button onclick=\"location.href='InsertProduct.jsp'\">Back</button>");
                     out.println("</body>");
                     out.println("</html>");
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
