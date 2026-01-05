<%-- 
    Document   : ConfirmProductMod
    Created on : May 1, 2024, 2:15:03 PM
    Author     : Loo Hong Kheng
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="entity.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Modification</title>
    </head>
    <body>
        <header><%@ include file="Header.jsp" %></header> 
        <h1>Modification made would you like to proceed</h1>
        <%
            if(session.getAttribute("userType")==null||!(session.getAttribute("userType").equals("manager")))
            {
            response.sendRedirect("AccessRestricted.jsp");
        }
            if(request.getParameter("name")!=null)
        {
          %>   
          <p>
             Changed name to <%=request.getParameter("name") %>
          </p>
          <form method="post" action="ModProduct?mod=1">
              <input type="submit">
              <input type="hidden" name="name" value=<%=request.getParameter("name")%>>
              <input type="submit" value="Back" formaction="ChooseProductMod.jsp?chosen=1">
          </form>
        <%}
        %>
        <%
            if(request.getParameter("price")!=null)
        {
          %>   
          <p>
             Changed price to RM<%=request.getParameter("price") %>
          </p>
          <form method="post" action="ModProduct?mod=2">
              <input type="submit">
              <input type="hidden" name="price" value=<%=request.getParameter("price")%>>
              <input type="submit" value="Back" formaction="ChooseProductMod.jsp?chosen=1">
          </form>
        <%}
        %>
        <%
            if(request.getParameter("description")!=null)
        {
          %>   
          <p>
             Changed description to <%=request.getParameter("description") %>
          </p>
          <form method="post" action="ModProduct?mod=3">
              <input type="submit">
              <input type="hidden" name="description" value=<%=request.getParameter("description")%>>
              <input type="submit" value="Back" formaction="ChooseProductMod.jsp?chosen=1">
          </form>
        <%}
        %>
        <%
            if(request.getParameter("picture")!=null)
            {
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
                           Base64.Encoder encode = Base64.getEncoder();
                           picture = encode.encodeToString(selectedPic);
                }}
          %>   
          <p>
             Changed Picture to <image src="data:image/jpeg;base64,<%=picture %>" width="100px" height="100px" alt="picture">
          </p>
          <form method="post" action="ModProduct?mod=4">
              <input type="submit">
              <input type="hidden" name="picture" value=<%=request.getParameter("picture")%>>
              <input type="submit" value="Back" formaction="ChooseProductMod.jsp?chosen=1">
          </form>
        <%}
        %>
        <%
            if(request.getParameter("discount")!=null)
        {
          %>   
          <p>
             Changed discount to RM<%=request.getParameter("discount") %>
          </p>
          <form method="post" action="ModProduct?mod=5">
              <input type="submit">
              <input type="hidden" name="discount" value=<%=request.getParameter("discount")%>>
              <input type="submit" value="Back" formaction="ChooseProductMod.jsp?chosen=1">
          </form>
        <%}
        %>
        <%
        
        if(request.getParameter("category")!=null)
        {
         Category choice=null;
         session.removeAttribute("selectedChoice");
         List<Category> list = (List<Category>) session.getAttribute("Category");
           for(int i=0; i< list.size();i++)
           { 
              if(request.getParameter("category").equals(list.get(i).getCatid()))
              {
                choice =list.get(i);
                session.setAttribute("selectedChoice", choice);
              } 
           }
          %>   
          <p>
             Changed Category to <%= choice.getName() %>
          </p>
          <form method="post" action="ModProduct?mod=6">
              <input type="submit">
              <input type="submit" value="Back" formaction="ChooseProductMod.jsp?chosen=1">
          </form>
        <%}
        %>
        <footer>
        <jsp:include page="Footer.jsp" />
        </footer>
    </body>
</html>
