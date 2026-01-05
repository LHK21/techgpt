How to install and use our assignment webpage (TechGPT)

The main program with all the servlet and jsp is in the Assignment folder. The techgpt folder is the original database we created to do this assignment

1) Create a database using the GUI Database text file provided. It will create all the table needed and initialize manager account and two category for items.

2) The first page of the assignment should be Main.jsp

3) Go to ValidateProductInformation.java in controller and find in the dopost method
File pic = new File("C:\\Users\\Loo Hong Kheng\\Desktop\\GUI Assingnment\\Assignment\\src\\java\\picture");
then change the path of the picture folder to your picture folder location at Assignment/src/java by right clicking the folder and copy as path.

4) Do the same in ConfirmProductMod.jsp and ModProduct.java in controller package at the dopost method 

5)Click login in the navigation bar and switch to admin login at the top right conner by clicking the manager. Log in as admin (username and password are both admin)

6)Go to products and insert products and when inserting products ensure that the picture used must be in the picture folder and the picture can only be in jpeg,there are already a few picture in there for you to use.

7) In order to register as customer you can do so in customer login page,For staff the manager will have to go to profile by clicking their username below the user icon at the navigation bar.Its at the most left of the nav bar.Note that it may be hard to click it at product page so try to access it at any other page .Then when they are in the profile page click add new staff to add new staff.

8)To edit delete modify add products it can be done at the product page with the correct role.

9)For account it can be done at profile when log in as manager only by using user management,except for modifying password which can be done by all at the profile page. Order history is also at profile page.
