<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en" style="background:#F7F7F7">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>ONAAPH!</title>

    <!-- Bootstrap -->
    <link href="biblio-extern/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="biblio-extern/font-awesome/css/font-awesome.min.css" rel="stylesheet">
     <!-- NProgress -->
    <link href="biblio-extern/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="biblio-extern/fiCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Datatables -->
    <link href="biblio-extern/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="biblio-extern/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="biblio-extern/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="biblio-extern/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="biblio-extern/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="biblio-intern/css/custom.css" rel="stylesheet">




	
  </head>

  <body>
    <div class="container body">
      <div class="main_container">

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>           
            	<button type="button" class="btn btn-danger" style="float:right;margin-left:10px;margin-top:7px"><i class="fa fa-save"></i>  Déconnexion</button>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <!-- C'est là où on doit modifier ... -->

              <div class="x_panel" >
                <div class="x_content">
				<!--Les cadres -->
				<div class="x_title">
				
				</div>
				<!--/fin les cadres-->
					<!--le tableau -->
					<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel" style="border-color:black;border-radius:20px;min-height:550px">

                  <div class="x_content">
                   
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                       <thead>
                        <tr>
                          <th width="4%">#</th>
                          <th>Nom</th>
                          <th width="20%">Prenom</th>
                          <th width="10%">Date de naissance</th>
                          <th>Hopital</th>
                          <th width="10%">Telephone</th>
                          <th width="8%">Action</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<c:forEach items="${patientList}" var="c">
							<tr>
	                          <td>${c.id}</td>
	                          <td>${c.nom}</td>
	                          <td>${c.prenom}</td>
	                          <td>${c.dateNai}</td>
	                          <td>${c.hopital}</td>
	                          <td>${c.tel1}</td>
	                         <td> <a href="/ServeurProjet2CS/ExamenMedicalServlet?id=${c.id}">
	                         	<button type="button" class="btn btn-success btn-sm"><strong><i class="fa fa-folder-open-o"></i> Afficher dossier</strong></button>
	                         </a></td>
	                        </tr>
						</c:forEach>
                        
                     
                      </tbody>
                    </table>

                  </div>
                </div>
              </div>
				  <!--fin tableau-->
                  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                </div>
              </div>
        </div>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="biblio-extern/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="biblio-extern/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="biblio-intern/js/custom.min.js"></script>




 <!-- jQuery -->
    <script src="biblio-extern/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="biblio-extern/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="biblio-extern/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="biblio-extern/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="biblio-extern/iCheck/icheck.min.js"></script>
    <!-- Datatables -->
    <script src="biblio-extern/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="biblio-extern/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="biblio-extern/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="biblio-extern/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="biblio-extern/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="biblio-extern/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="biblio-extern/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="biblio-extern/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="biblio-extern/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="biblio-extern/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="biblio-extern/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="biblio-extern/datatables.net-scroller/js/datatables.scroller.min.js"></script>
    <script src="biblio-extern/jszip/dist/jszip.min.js"></script>
   
 
    <!-- Custom Theme Scripts -->
    <script src="biblio-intern/css/custom.min.js"></script>

    <!-- Datatables -->
    

 <script>
      $(document).ready(function() {
        var handleDataTableButtons = function() {
          if ($("#datatable-buttons").length) {
            $("#datatable-buttons").DataTable({
              dom: "Bfrtip",
              buttons: [
                {
                  extend: "copy",
                  className: "btn-sm"
                },
                {
                  extend: "csv",
                  className: "btn-sm"
                },
                {
                  extend: "excel",
                  className: "btn-sm"
                },
                {
                  extend: "pdfHtml5",
                  className: "btn-sm"
                },
                {
                  extend: "print",
                  className: "btn-sm"
                },
              ],
              responsive: true
            });
          }
        };

        TableManageButtons = function() {
          "use strict";
          return {
            init: function() {
              handleDataTableButtons();
            }
          };
        }();

        $('#datatable').dataTable();

        $('#datatable-keytable').DataTable({
          keys: true
        });

        $('#datatable-responsive').DataTable( {
            language: {
            	url: "biblio-extern/datatables.net/French.json"
            }
            
            
        } );

        $('#datatable-scroller').DataTable({
          ajax: "js/datatables/json/scroller-demo.json",
          deferRender: true,
          scrollY: 380,
          scrollCollapse: true,
          scroller: true
        });

        $('#datatable-fixed-header').DataTable({
          fixedHeader: true
        });

        var $datatable = $('#datatable-checkbox');

        $datatable.dataTable({
          'order': [[ 1, 'asc' ]],
          'columnDefs': [
            { orderable: false, targets: [0] }
          ]
        });
        $datatable.on('draw.dt', function() {
          $('input').iCheck({
            checkboxClass: 'icheckbox_flat-green'
          });
        });

        TableManageButtons.init();
      });
    </script>
    <!-- /Datatables -->
  </body>
</html>