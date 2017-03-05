
<%--
  Created by IntelliJ IDEA.
  User: shiva9
  Date: 2/7/2017
  Time: 3:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false" %>
<html>
<head>
    <title>List_Customers</title>
    <spring:url value="resources/js/jquery-1.12.1.min.js"     var="jqueryJs" />
    <script src="${jqueryJs}"></script>
    <spring:url value="resources/js/jquery.dataTables.js"     var="datatable" />
    <script src="${datatable}"></script>
    <spring:url value="resources/js/dataTables.scroller.min.js"     var="datatableSCMIN" />
    <script src="${datatableSCMIN}"></script>
    <spring:url value="resources/js/dataTables.scroller.js"     var="datatableSC" />
    <script src="${datatableSC}"></script>
    <spring:url value="resources/css/jquery.dataTables.css" var="jquerydataTables" />
    <link href="${jquerydataTables}" rel="stylesheet" />
    <spring:url value="resources/css/jquery.dataTables.min.css" var="jquerydataTablesMin" />
    <link href="${jquerydataTablesMin}" rel="stylesheet" />
    <spring:url value="resources/css/scroller.dataTables.min.css" var="jquerydataTablesScollerMin" />
    <link href="${jquerydataTablesScollerMin}" rel="stylesheet" />
    <spring:url value="resources/css/common.css" var="common" />
    <link href="${common}" rel="stylesheet" />
    <spring:url value="resources/images" var="images" />
    <link href="${common}" rel="stylesheet" />
    </head>
   <style>
       .btnE{

           background-image: url('resources/images/edit.gif');
           background-repeat: no-repeat;
       }
       .btnD{

           background-image: url('resources/images/delete.gif');
           background-repeat: no-repeat;
       }
   </style>
<body>


<h1><center>Contact Details  <a href="list_customers.htm"> refresh</a></center> </h1>
<table id="example" class="display" cellspacing="0" width="100%" style="overflow-x:auto">

<thead>
    <tr>
        <th style=" background-color: darkorange;">CustomerId</th>
        <th style=" background-color: darkorange;">FirstName</th>
        <th style=" background-color: darkorange;">LastName</th>
        <th style=" background-color: darkorange;">Edit/Delete</th>

    </tr>

    </thead>

</table>
<script type="text/javascript">
    $(document).ready(function(){

       /* $("#load").on("click", function () {
            loader();
        });*/


        var data = ${lstCustomers};
        console.log("data="+data);

        /*for ( var i=0 ; i<data.length ; i++ ) {
            data.push( [  { "mData":"_customerId"},
                        { "mData": "_firstName"},
                        { "mData": "_lastName"},
                        {
                            "mData": "_customerId",
                            className: "center",
                            "render": function(mData, type, full, meta) {
                                return '<a href="edit_customers/' + mData + '">Edit</a>/<a href="update_customer/' + mData + '">Delete</a>';
                            }
                        }
                    ] );
        }*/
        var table = $('#example').DataTable( {

            "aaData": data,
            "aoColumns": [
                { "mData":"customerId"},
                { "mData": "firstName"},
                { "mData": "lastName"},
                {
                    "mData": "customerId",
                    /*className: "btnE btnD",*/

                    //defaultContent: '<a href="edit_customers/{_customerId"}" class="editor_edit">Edit</a> / <a href="" class="editor_remove">Delete</a>'
                    //defaultContent: '<a href="edit_customers/{_customerId"}" class="editor_edit">Edit</a> / <a href="" class="editor_remove">Delete</a>'
                    //defaultContent: '<a href="edit_customers/'+"{data._customerId}"+'">Edit</a>'
                    "render": function(mData, type, full, meta) {
                        return '<a href="edit_customers/' + mData + '" class="editor_edit"><img src="resources/images/edit.gif"></a> <a href="update_customer/' + mData + '"class="editor_delete"><img src="resources/images/delete.gif"></a>';
                        //return '<img src="resources/images/edit.gif"> <img src="resources/images/delete.gif">';
                    }
                }


            ],
            "paging":true,
            "pageLength":10,
            "ordering":true,
            "order":[0,"asc"]
        });

        /*$('#example').DataTable( {
            data:           data,
            deferRender:    true,
            scrollY:        200,
            scrollCollapse: true,
            scroller:       true
        } );*/
    });

    /*$('#example').on( 'click', '.editor_edit', function () {
        var id = table.row( this ).id();

        alert( 'Clicked row id '+id );
    } );*/

   $("#example").on('click', '.editor_delete', function() {


       var delCustomer = confirm("do u Want to delete[Y/N]?");

       if(delCustomer)
       {
           /*alert("delete functionality");*/
         //  window.location.href = $(this).attr('href');

           $(this).attr('href').submit();
           $("#deleteCustomerMsg").text("Record Deleted Successfully");
       }
       return false;

    });
   /* $('#example').on('click', 'a.editor_edit', function (e) {
        e.preventDefault();

        editor.edit( $(this).closest('tr'), {
            title: 'Edit record',
            buttons: 'Update'
        } );
    } );*/
</script>
<div id="deleteCustomerMsg"></div>
</body>
</html>
