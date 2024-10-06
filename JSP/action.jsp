<%@include file="connect.jsp" %>
<%!
    String msg,action;
%>
<%
    action=request.getParameter("action");//Submiting Registration form on database
    msg=null;
%>

<%-- Reisgtering Users --%>
<%
    if(action.equals("register")){
        String f_name,l_name,email,mobile,question,password;

        f_name = request.getParameter("fname");
        l_name = request.getParameter("lname");
        email = request.getParameter("email");
        mobile = request.getParameter("mob");
        question = request.getParameter("query");
        password = request.getParameter("password");
        
        try{
            stmt = con.createStatement();
            stmt.execute("insert into register(f_name,l_name,email,mob,question,pass) values('"+f_name+"','"+l_name+"','"+email+"','"+mobile+"','"+question+"','"+password+"')");
            msg="Registration Successfull";
            response.sendRedirect("login_register.jsp?msg="+msg);
        }
        catch(Exception e){
            
            msg="Registration Failed"+e.toString();
        }    
        finally{
            con.close();
        }
    }
%>
<%-- Validating Question --%>
<%
    if(action.equals("validateQuery")){
        String mobile,question;

        mobile = request.getParameter("mobile");
        question = request.getParameter("query");
        
        try{
            stmt = con.createStatement();
            String query = "SELECT * FROM register WHERE mob='" + mobile + "' AND question='" + question + "'";
            rs = stmt.executeQuery(query);
            if(rs.next()){
                    if(mobile.equals(rs.getString("mob")) && question.equals(rs.getString("question"))){
                    session.setAttribute("mob",mobile);
                    msg="Validated Query Successfull";
                    response.sendRedirect("changePass.jsp?msg="+msg);
                }
                else{
                    msg="Invalid Query";
                    response.sendRedirect("forgotPass.jsp?msg="+msg);
                }
            }
            else{
                msg="Invalid Query";
                response.sendRedirect("forgotPass.jsp?msg="+msg);
            }    
        }
        catch(Exception e){
            
            msg="Registration Failed"+e.toString();
        }    
        finally{
            con.close();
        }
    }
%>
<%-- Update Password --%>
<%
    if(action.equals("changePassword")){
        String mobile,newpass;
        mobile = request.getParameter("mobile");
        newpass = request.getParameter("password");

        try{
            stmt = con.createStatement();
            stmt.execute("update register set pass = '"+newpass+"' where mob = '"+mobile+"'");
            msg="Password Changed Successfully";
            response.sendRedirect("login_register.jsp?msg="+msg);
        }
        catch(Exception e){
            
            msg="Password could not be Changed"+e.toString();
        }    
        finally{
            con.close();
        }
    }
%>
<%-- Login Authentication of Users --%>
<%
    if(action.equals("login")){
        String mobile,password, firstname = "";
        String lastname = "";

        mobile = request.getParameter("mobile");
        password = request.getParameter("password");

        try{
            stmt = con.createStatement();
            rs = stmt.executeQuery("select * from register where mob = '"+mobile+"' AND pass = '"+password+"'");
            if(rs.next()){
                msg="Login Successfull";
                firstname=rs.getString("f_name");
                lastname=rs.getString("l_name");
                session.setAttribute("f_name",firstname);
                session.setAttribute("l_name",lastname);
                session.setAttribute("mob",mobile);
                session.setAttribute("rid",String.valueOf(rs.getInt("rid")));
                response.sendRedirect("welcomeuser.jsp?msg="+msg);
            }
            else{
                msg="Invalid Credentials";
                response.sendRedirect("login_register.jsp?msg="+msg);
            }
        }
        catch(Exception e){
            
            msg="Registration Failed"+e.toString();
        }    
        finally{
            con.close();
        }
    }
%>

<%-- Login Authentication of Admin --%>
<%
    if(action.equals("login-admin")){
        String mobile,password, fname = "";

        mobile = request.getParameter("mobile");
        password = request.getParameter("password");
        
        try{
            stmt = con.createStatement();
            rs = stmt.executeQuery("select * from Admin_Rgstr where mobile ='"+mobile+"' AND password = '"+password+"'");
            if(rs.next()){
                msg="Login Successful";
                fname=rs.getString("Full_Name");
                session.setAttribute("full_name",fname);
                session.setAttribute("admin_id",String.valueOf(rs.getInt("admin_id")));
                response.sendRedirect("../admin/welcomeadmin.jsp?msg="+msg);
            }
            else{
                msg="Invalid Credentials";
                response.sendRedirect("../admin/login.jsp?msg="+msg);
            }
            
        }
        catch(Exception e){
            
            msg="Registration Failed"+e.toString();
        }    
        finally{
            con.close();
        }
    }
%>

<%-- Adding Services --%>
<%
    if(action.equals("addservices")){
        String s_name,s_charge,discount,calc;

        s_name = request.getParameter("sname");
        s_charge = request.getParameter("scharge");
        discount = request.getParameter("disc");
        calc = request.getParameter("total");
        
        try{
            stmt = con.createStatement();
            stmt.execute("insert into services_plans(serv_name,serv_charge,discount,total) values('"+s_name+"','"+s_charge+"','"+discount+"','"+calc+"')");
            msg="";
            response.sendRedirect("../admin/addServices.jsp?msg="+msg);
        }
        catch(Exception e){
            
            msg="Registration Failed"+e.toString();
        }    
        finally{
            con.close();
        }
    }
%>
<%-- Deleting Services --%>
<%
    if(action.equals("deleteservices")){
        int id=Integer.parseInt(request.getParameter("sid"));

        try{
            stmt = con.createStatement();
            stmt.execute("delete from services_plans where sid='"+id+"'");
            msg="deletion successful";
            response.sendRedirect("../admin/addServices.jsp?msg="+msg);
        }
        catch(Exception e){
            
            msg="Deletion Failed"+e.toString();
        }    
        finally{
            con.close();
        }
    }
%>
<%-- editing service --%>
<%
    if(action.equals("editservice")){
        int id_edit=Integer.parseInt(request.getParameter("sid"));
        String s_name,s_charge,discount,calc;

        s_name = request.getParameter("sname");
        s_charge = request.getParameter("scharge");
        discount = request.getParameter("disc");
        calc = request.getParameter("total");

        try{
            stmt = con.createStatement();
            stmt.execute("update services_plans set serv_name='"+s_name+"',serv_charge='"+s_charge+"',discount='"+discount+"',total='"+calc+"' where sid='"+id_edit+"'");
            msg="Edit successful";
            response.sendRedirect("../admin/addServices.jsp?msg="+msg);
        }
        catch(Exception e){
            
            msg="Edit Failed"+e.toString();
        }    
        finally{
            con.close();
        }
    }
%>
<%-- Adding plans --%>
<%
    if(action.equals("addplans")){
        String p_name,p_charge,valdate,todate,discount,calc;
        p_name = request.getParameter("pname");
        p_charge = request.getParameter("pcharge");
        discount = request.getParameter("disc");
        calc = request.getParameter("total");

        try{
            stmt = con.createStatement();
            stmt.execute("insert into plans(plan_name,plan_charge,discount,total) values('"+p_name+"','"+p_charge+"','"+discount+"','"+calc+"')");
            msg="Added";
            response.sendRedirect("../admin/addPlans.jsp?msg="+msg);
        }
        catch(Exception e){
            
            msg="Registration Failed"+e.toString();
        }    
        finally{
            con.close();
        }
    }
%>

<%-- editing plans --%>
<%
    if(action.equals("editplan")){
        int pid_edit=Integer.parseInt(request.getParameter("sid"));
        String p_name,p_charge,valdate,todate,discount,calc;

        p_name = request.getParameter("pname");
        p_charge = request.getParameter("pcharge");
        discount = request.getParameter("disc");
        calc = request.getParameter("total");

        try{
            stmt = con.createStatement();
            stmt.execute("update plans set plan_name='"+p_name+"',plan_charge='"+p_charge+"',discount='"+discount+"',total='"+calc+"' where pid='"+pid_edit+"'");
            msg="Edit successful";
            response.sendRedirect("../admin/addPlans.jsp?msg="+msg);
        }
        catch(Exception e){
            msg="Edit Failed"+e.toString();
        }    
        finally{
            con.close();
        }
    }
%>
<%-- Editing Profile --%>
<%
    if(action.equals("editprofile")){
        String fullname,email,mobile,v_name,v_type,v_num,v_model,address;
        int cid=Integer.parseInt(request.getParameter("cid"));
        v_name=request.getParameter("vname");
        v_type=request.getParameter("vtype");
        v_num=request.getParameter("vnumber");
        v_model=request.getParameter("vmodel");
        address=request.getParameter("address");
        try{
            stmt = con.createStatement();
            stmt.execute("update register set vehicle_name='"+v_name+"',vehicle_type='"+v_type+"', vehicle_num='"+v_num+"', vehicle_model='"+v_model+"', address='"+address+"'  where rid='"+cid+"'");
            msg="Profile Updated";
            response.sendRedirect("users.jsp?msg="+msg);
        }
        catch(Exception e){
            
            msg="Registration Failed"+e.toString();
            response.sendRedirect("users.jsp?msg="+msg);
        }    
        finally{
            con.close();
        }
    }
%>
<%-- Editing Admin Profile --%>
<%
    if(action.equals("editAdminProfile")){
        String email,mobile,address,pincode;
        int aid=Integer.parseInt(request.getParameter("aid"));
        email = request.getParameter("email");
        mobile = request.getParameter("mobile");
        address=request.getParameter("address");
        pincode = request.getParameter("pincode");
        try{
            stmt = con.createStatement();
            stmt.execute("update admin_rgstr set email='"+email+"',mobile='"+mobile+"', address='"+address+"', pincode='"+pincode+"' where admin_id='"+aid+"'");
            msg="Profile Updated";
            response.sendRedirect("../admin/profile.jsp?msg="+msg);
        }
        catch(Exception e){
            
            msg="Registration Failed"+e.toString();
            response.sendRedirect("../admin/profile.jsp?msg="+msg);
        }    
        finally{
            con.close();
        }
    }
%>
<%-- book Services --%>
<%
    if(action.equals("bookservice")){
        String sid,cid,custname,contact,servname,servprice,dob,bookday,timetodel,timeofbook,servstatus;
        
        sid = request.getParameter("sid");
        cid = request.getParameter("rid");
        custname = request.getParameter("cname");
        contact = request.getParameter("contact");
        servname = request.getParameter("sname");
        servprice = request.getParameter("sprice");
        dob = request.getParameter("date");
        bookday = request.getParameter("day");
        timetodel = request.getParameter("time");
        timeofbook = request.getParameter("currentTime");
        try{
            stmt = con.createStatement();
            stmt.execute("insert into booking(serv_id,cust_id,cust_name,contact,serv_name,serv_price,date_of_booking,book_day,time_to_deliver,time_of_booking) values('"+sid+"','"+cid+"','"+custname+"','"+contact+"','"+servname+"','"+servprice+"','"+dob+"','"+bookday+"','"+timetodel+"','"+timeofbook+"')");
            msg="Save Sucessfully";
            response.sendRedirect("bookService.jsp?bid="+sid+"&msg="+msg);
        
        }
        catch(Exception e){
            
            msg="Registration Failed"+e.toString();
        }    
        finally{
            con.close();
        }
    }
%>
<%-- Editing Status --%>
<%
    if(action.equals("editstatus1")){
        int bidCheckedIn = Integer.parseInt(request.getParameter("id"));
        try{
            stmt = con.createStatement();
            stmt.execute("update booking set service_status=2 where booking_id='"+bidCheckedIn+"'");
            msg="Save Sucessfully";
            response.sendRedirect("../admin/bookings.jsp?msg="+msg);
        }
        catch(Exception e){
            
            msg="Registration Failed"+e.toString();
        }    
        finally{
            con.close();
        }
    }
%>
<%
    if(action.equals("editstatus2")){
        int bidCheckedIn = Integer.parseInt(request.getParameter("id"));
        try{
            stmt = con.createStatement();
            stmt.execute("update booking set service_status=3 where booking_id='"+bidCheckedIn+"'");
            msg="Save Sucessfully";
            response.sendRedirect("../admin/bookings.jsp?msg="+msg);
        }
        catch(Exception e){
            
            msg="Registration Failed"+e.toString();
        }    
        finally{
            con.close();
        }
    }
%>
<%-- Generating Invoice --%>
<%
    if(action.equals("generateInvoice")){
        int bidInvoice = Integer.parseInt(request.getParameter("id"));
        try{
            stmt = con.createStatement();
            stmt.execute("update booking set service_status=5 where booking_id='"+bidInvoice+"'");
            msg="Generated Sucessfully";
            response.sendRedirect("../admin/billing.jsp?msg="+msg);
        }
        catch(Exception e){
            
            msg="Registration Failed"+e.toString();
        }    
        finally{
            con.close();
        }
    }
%>

<%-- Cancel booking --%>
<%
    if(action.equals("cancelbooking")){
        int bidcancel = Integer.parseInt(request.getParameter("id"));
        try{
            stmt = con.createStatement();
            stmt.execute("update booking set service_status=4 where booking_id='"+bidcancel+"'");
            msg="Cancelled Sucessfully";
            response.sendRedirect("myBookings.jsp?msg="+msg);
        }
        catch(Exception e){
            
            msg="Registration Failed"+e.toString();
        }    
        finally{
            con.close();
        }
    }
%>
<%-- Getting reviews --%>
<%
    if(action.equals("review")){
        String email, message;

        email = request.getParameter("email");
        message = request.getParameter("message");
        try{
            stmt = con.createStatement();
            stmt.execute("insert into reviews(email,message) values('"+email+"','"+message+"')");
            msg="Message Sent";
            response.sendRedirect("../index.jsp?msg="+msg);
        }
        catch(Exception e){
            
            msg="Message Not Sent"+e.toString();
        }    
        finally{
            con.close();
        }

    }
%>
<%-- New Bill No. --%>
<%
    if(action.equals("newbill")){
        int billno=Integer.parseInt(request.getParameter("billno"));
            try{
            stmt = con.createStatement();
            stmt.execute("update counter set billno='"+billno+"'");
            response.sendRedirect("../admin/billing.jsp?msg="+msg);
        }
        catch(Exception e){
            
            msg="Message Not Sent"+e.toString();
        }    
        finally{
            con.close();
        }

    }
%>
<%-- Invoice Generating --%>
<%
    if(action.equals("invoice")){
        int billno,custID;
        String billdate,servname,servcharge;

        billno = Integer.parseInt(request.getParameter("billNo"));
        custID = Integer.parseInt(request.getParameter("custId"));
        billdate = request.getParameter("currDate");
        servname = request.getParameter("sname");
        servcharge = request.getParameter("scharge");
        try{
            stmt = con.createStatement();
            stmt.execute("insert into billing(billno,cust_id,billdate,serv_name,serv_charge) values('"+billno+"','"+custID+"','"+billdate+"','"+servname+"','"+servcharge+"')");
            msg="Bill Generated";
            response.sendRedirect("../admin/billing.jsp?msg="+msg);
        }
        catch(Exception e){
            msg="Message Not Sent"+e.toString();
        }    
        finally{
            con.close();
        }

    }
%>
<%-- Plan Purchasing --%>
<%
    if(action.equals("purchasePlan")){
        int cpID, custID, price;
        String planName, custName, validateFrom, validateTo, stats;
        cpID = Integer.parseInt(request.getParameter("cpID"));
        custID = Integer.parseInt(request.getParameter("rid"));
        price = Integer.parseInt(request.getParameter("planprice"));
        planName = request.getParameter("planname");
        custName = request.getParameter("cname");
        validateFrom = request.getParameter("valid_date");
        validateTo = request.getParameter("to_date");

        try{
            stmt = con.createStatement();
            stmt.execute("insert into customers_plan(cpid,cust_id,cust_name,plan_name,price,valid_from, valid_to) values('"+cpID+"','"+custID+"','"+custName+"','"+planName+"','"+price+"','"+validateFrom+"','"+validateTo+"')");
            msg="Plan Purchased";
            response.sendRedirect("planSubscribed.jsp?msg="+msg);
        }
        catch(Exception e){
            msg="Message Not Sent"+e.toString();
        }    
        finally{
            con.close();
        }
    }
%>
<%-- expiring Plans By admin --%>
<%
    if(action.equals("expireSubscribedPlan")){
        int cpID, custID;
        cpID = Integer.parseInt(request.getParameter("cpid"));
        custID = Integer.parseInt(request.getParameter("custid"));

        try{
            stmt = con.createStatement();
            stmt.execute("update customers_plan set status = 2 where cpid='"+cpID+"' AND cust_id = '"+custID+"'");
            msg="Updated successful";
            response.sendRedirect("../admin/planManagement.jsp?msg="+msg);
        }
        catch(Exception e){
            msg="Updation Failed"+e.toString();
        }    
        finally{
            con.close();
        }
    }
%>
<%-- Unsubscribing Plans By admin --%>
<%
    if(action.equals("deleteSubscribedPlan")){
        int cpID, custID;
        cpID = Integer.parseInt(request.getParameter("cpid"));
        custID = Integer.parseInt(request.getParameter("custid"));

        try{
            stmt = con.createStatement();
            stmt.execute("delete from customers_plan where cpid='"+cpID+"' AND cust_id = '"+custID+"'");
            msg="Updated successful";
            response.sendRedirect("../admin/planManagement.jsp?msg="+msg);
        }
        catch(Exception e){
            msg="Updation Failed"+e.toString();
        }    
        finally{
            con.close();
        }

    }
%>