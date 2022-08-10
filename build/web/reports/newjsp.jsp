<%-- 
    Document   : newjsp
    Created on : Aug 5, 2022, 6:02:02 AM
    Author     : ERISA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%!Integer quant[]={};%>
<%!Integer sale[]={};%>
<%ArrayList<Integer> quantlabel=new ArrayList<Integer>(Arrays.asList(quant));%>
<%ArrayList<Integer> salelabel=new ArrayList<Integer>(Arrays.asList(sale));%>
<%!ResultSet res;%>

<%!Integer eId[]={};%>
<%!Integer pdtlineId[]={};%>
<%ArrayList<Integer> eIdlabel=new ArrayList<Integer>(Arrays.asList(eId));%>
<%ArrayList<Integer> pdtlineIdlabel=new ArrayList<Integer>(Arrays.asList(pdtlineId));%>
<%!ResultSet rest;%>

<%!Integer a[]={};%>
<%!String b[]={};%>
<%ArrayList<Integer> alabel=new ArrayList<Integer>(Arrays.asList(a));%>
<%ArrayList<String> blabel=new ArrayList<String>(Arrays.asList(b));%>
<%!ResultSet rose;%>

<%!Integer emp[]={};%>
<%!String catName[]={};%>
<%ArrayList<Integer> emplabel=new ArrayList<Integer>(Arrays.asList(emp));%>
<%ArrayList<String> catNamelabel=new ArrayList<String>(Arrays.asList(catName));%>
<%!ResultSet shon;%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/grid.css"/>
    </head>
    <body>
        <h1 style="text-align: center">GRAPHS</h1>
            <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                try {
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb", "root", "");
                    Statement st = conn.createStatement();
                    out.println("Connected!");
                    //BAR CHART
                    res=st.executeQuery("select * from sale");
                    while(res.next()){
                        salelabel.add(+res.getInt("saleId"));
                        quantlabel.add(res.getInt("quantity"));
                    }
                    //PIE CHART
                    rest=st.executeQuery("select * from worker");
                    while(rest.next()){
                        pdtlineIdlabel.add(+rest.getInt("productLineId"));
                        eIdlabel.add(rest.getInt("empId"));
                    }
                    //LINE GRAPH
                    rose=st.executeQuery("select * from productline");
                    while(rose.next()){
                        blabel.add("'"+rose.getString("productLineName")+"'");
                        alabel.add(rose.getInt("price"));
                        
                    }
                    //DOUGHNUT
                    shon=st.executeQuery("select * from productcategory");
                    while(shon.next()){
                        catNamelabel.add("'"+shon.getString("categoryName")+"'");
                        emplabel.add(shon.getInt("employees"));
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } catch(ClassNotFoundException e) {
                e.printStackTrace();
            }
        %>
        <div>
        <div class="main">
            <div class="charts" style="content: center">
           
            <div class="chart">
                <div>
            <canvas id="line"></canvas>
                </div>
            </div>
          
            <div class="chart">
                <div>
            <canvas id="r2"></canvas>
                </div>
            </div>
            
            <div class="chart">
                <div>
            <canvas id="r3"></canvas>
                </div>
            </div>
            <div class="chart">
                <div>
            <canvas id="r4"></canvas>
                </div>
            </div>
        </div>    
        </div>
        </div>
        <script src="./js/chart.min.js"></script>
        <script>
    
var ctx = document.getElementById("line").getContext("2d");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: <%out.println(salelabel);%>,
        datasets: [{
            label: 'Bar Graph Of Sales',
            data: <%out.println(quantlabel);%>,
            backgroundColor: [
                'rgba(0,255,0)'

            ],
            borderColor: 'rgb(41, 155, 99)',
            borderWidth: 1
        }
        
    ]
    },
    options: {
        responsive: true,
        scales:{
        y:{
            title:{
                display:true,
                text:"QUANTITY"
            }
        },
        x:{
            title:{
                display:true,
                text:"SALE ID"
            }
        }
        }
    }
});


        </script>
        <script>
  var ctx2 = document.getElementById('r2').getContext('2d');
var myChart2 = new Chart(ctx2, {
    type: 'pie',
    data: {
        labels: <%out.println(pdtlineIdlabel);%>,
            datasets: [{
            label: 'Pie Chart',
            data: <%out.println(eIdlabel);%>,
            backgroundColor: [
                'rgba(41, 155, 99, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(120, 46, 139,1)'

            ],
            borderColor: [
                'rgba(41, 155, 99, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(120, 46, 139,1)'

            ],
            borderWidth: 1
        }]

    },
    options: {
        responsive: true,
        indexAxis: 'y',
        "maintainAspectRatio": false
    }
});
</script>
<script>
    
var ctx3 = document.getElementById("r3").getContext("2d");
var myChart3 = new Chart(ctx3, {
    type: 'line',
    data: {
        labels: <%out.println(blabel);%>,
        datasets: [{
            label: 'Line Graph',
            data: <%out.println(alabel);%>,
            backgroundColor: [
                'rgba(0,255,0)'

            ],
            borderColor: 'rgb(41, 155, 99)',
            borderWidth: 1
        }
        
    ]
    },
    options: {
        responsive: true,
        scales:{
        y:{
            title:{
                display:true,
                text:"PRICE"
            }
        },
        x:{
            title:{
                display:true,
                text:"PRODUCT LINE NAME"
            }
        }
        }
    }
});


        </script>
        <script>
  var ctx4 = document.getElementById('r4').getContext('2d');
var myChart4 = new Chart(ctx4, {
    type: 'pie',
    data: {
        labels: <%out.println(catNamelabel);%>,
            datasets: [{
            label: 'Doughnut Chart',
            data: <%out.println(emplabel);%>,
            backgroundColor: [
                'rgba(41, 155, 99, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(120, 46, 139,1)'

            ],
            borderColor: [
                'rgba(41, 155, 99, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(120, 46, 139,1)'

            ],
            borderWidth: 1
        }]

    },
    options: {
        responsive: true,
        indexAxis: 'y',
        "maintainAspectRatio": false
    }
});
</script>
    </body>
</html>

