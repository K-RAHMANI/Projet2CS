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
    <!-- Bootstrap -->
    <link href="biblio-extern/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Custom Theme Style -->
    <link href="biblio-intern/css/custom.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="biblio-extern/iCheck/skins/flat/green.css" rel="stylesheet">
      <!-- Font Awesome -->
    <link href="biblio-extern/font-awesome/css/font-awesome.min.css" rel="stylesheet">
     <!-- NProgress -->
    <link href="biblio-extern/nprogress/nprogress.css" rel="stylesheet">
     <!-- Datatables -->
    <link href="biblio-extern/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="biblio-extern/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="biblio-extern/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="biblio-extern/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="biblio-extern/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
  </head>

  <body>
    <div class="container body">
      <div class="main_container">
        <!-- top navigation -->
        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu" style="height:50px">
            <nav>
            
            <button class="btn btn-danger" style="float:right;margin-left:10px;margin-top:7px"><i class="fa fa-save"></i>Déconnexion</button>
                   
            </nav>
          </div>
        </div>
        <!-- /top navigation -->
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <!-- C'est là où on doit modifier ... -->
        
          
              <div class="x_panel" >
                <div class="x_content">
                <div class="col-md-8 col-xs-12" >
                	                  <!--Volet traitement-->
                       <div class="x_panel" style="border-color:black;border-radius:20px;min-height:550px" >
<!--                        <div class="btn-group btn-group-lg" role="group" aria-label="..."> -->
<!-- 						  <button type="button" class="btn btn-default">Left</button> -->
<!-- 						  <button type="button" class="btn btn-default">Middle</button> -->
<!-- 						  <button type="button" class="btn btn-default">Right</button> -->
<!-- 						</div> -->
                    
                      <div class="x_content" style="padding-left:0px;padding-right:0px">
                        <button id="lstPatientPrevuBtn" type="button" style="padding-left:5px;padding-right:5px" class="btn btn-danger"><img src="images/imgs/user_wait.png" width="31px"> <Strong>Liste des patients prévus</Strong></button>
                        <button id="lstPatientBtn" type="button" style="padding-left:5px;padding-right:5px" class="btn btn-success"><img src="images/imgs/user_valid.png" width="31px"> <Strong>Liste des patients</Strong></button>
                        <button id="dmdAssistBtn" type="button" style="padding-left:5px;padding-right:5px" class="btn btn-success"><img src="images/imgs/notepad.png" width="31px"> <Strong>Demande d'assistance</Strong></button>
                         <a href="./Assistant_DossierPatient?source=c">
           			    <button style="padding-left:7px;padding-right:10px" class="btn btn-success"><img src="images/imgs/user_add.png" width="31px"> <Strong>Nouveau patinet</Strong></button>
		             	</a> 
                        <!--Liste des patients prévus-->
		                 <div id="lstPatientPrevu" style="display:;">
		                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap"  width="100%">
		                       <thead>
		                        <tr>
		                               <th>Numéro</th>
		                                <th>Nom</th>
		                                <th>Prénom</th>
		                                <th>Hopital</th>
		                                <th>Créer</th>
		                        </tr>
		                      </thead>
		                      <tbody>
		                      	<c:forEach items="${patientPrevuList}" var="c">
										<tr>
				                          <td>${c.idPatientPrevu}</td>
				                          <td>${c.nom}</td>
			                              <td>${c.prenom}</td>
			                              <td>${c.hopital}</td>
			                           <td> <a href="/ServeurProjet2CS/Assistant_DossierPatient?id=${c.idPatientPrevu}&source=b">
			                         	<button type="button" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></button> </a></td>
			                        </tr>
								</c:forEach>
		                      </tbody>
		                    </table>
		
		                </div>
             
                        <!--Liste des patients prévus-->
                        <!--Liste des patients-->
                        <div id="lstPatient" style="display:none;">
                          <table id="datatable-responsive2" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
		                       <thead>
		                        <tr>
		                        <th style="width:20px">Numéro</th>
                                <th>Nom</th>
                                <th>Prénom</th>
                                <th>Date Naissance</th>
                                <th>Créer</th>
		                        </tr>
		                      </thead>
		                      <tbody>
		                      	<c:forEach items="${patientList}" var="c">
								<tr>
		                          <td>${c.id}</td>
		                          <td>${c.nom}</td>
		                          <td>${c.prenom}</td>
		                           <td>${c.dateNai}</td>
		                          
			                           <td> <a href="/ServeurProjet2CS/Assistant_DossierPatient?id=${c.id}&source=a">
			                         	<button type="button" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></button> </a></td>
			                        </tr>
								</c:forEach>
		                      </tbody>
		                    </table>
                        </div>
                        <!--Liste des patients-->
                        <!--Demande d'assistance-->
                        <div id="dmdAssist" class="x_panel" style="display:none;">
                          <div class="x_content">
                          <form  action="AccueilAssistantServlet" method="post">
                            
                            <div class="col-md-8 col-sm-6 col-xs-12 form-group has-feedback">
                              <input list="patients" type="text" class="form-control has-feedback-left" name="rechercher" placeholder="Rechercher Patient (Nom, Prénom, Date de naissance)">
                             
                               <datalist id="patients">
                                   <c:forEach items="${patientList}" var="patient">   	
                                   <option value="${patient.nom} ${patient.prenom} ${patient.dateNai}">
                                   </c:forEach> 
                                   </datalist>
                                   
                              <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                            </div>
                            
                          
                            
                            
                            <div class="x_panel" style="">
                              <div style="float:left; margin-right: 60px ">
                                <label>Type d'assistance *:</label>
                                <p>
                                  Stomathérapeute
                                  <input type="radio" class="flat" name="type" value="Stomatherapeute" checked=""/>
                                </p>
                                <p>
                                  Psychologue
                                  <input type="radio" class="flat" name="type"  value="Psychologue" />
                                </p>
                              </div>
                                    <textarea name="motif" class="form-control" rows="3" placeholder="Motif d'assistance"></textarea>
                            </div>
                            <div class="x_panel" style="">
                              Prise de rendez-vous:
                              <fieldset>
                                <div class="control-group">
                                  <div class="controls">
                                    <div class="col-md-11 xdisplay_inputx form-group has-feedback">
                                      <input type="Date" class="form-control has-feedback-left" placeholder="Choisir une date" name="date">
                                      <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                      <span id="inputSuccess2Status2" class="sr-only">(success)</span>
                                    </div>
                                  </div>
                                </div>
                              </fieldset>
                              <fieldset>
                                <div class="control-group">
                                  <div class="controls">
                                    <div class="col-md-11 xdisplay_inputx form-group has-feedback">
                                      <input type="Time" class="form-control has-feedback-left" placeholder="Choisir l'heure" name="heure">
                                      <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                      <span id="inputSuccess2Status23" class="sr-only">(success)</span>
                                    </div>
                                  </div>
                                </div>
                              </fieldset>
                            </div>
                            <button id="validerRdvBtn" type="Submit" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span> Valider RDV</button>
                            <button id="reinitBtn" type="Submit" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span> Réinitialiser</button>
                            </form>
                          </div>
                        </div>
                        <!--Demande d'assistance-->
                      </div>
                      </div>
                    
                
                
                </div>
                
				<div class="col-md-4 col-xs-12" >
				  <!--liste d'attente médecin-->
		              
		                    <div class="x_panel" style="border-color:black;border-radius:20px;min-height:550px">
		                    <div class="x_content">
		                      <div class="x_title">
		                        <h2>Liste d'attente médecin  (<c:out value="${nbreAttente}" />) </h2>
		                        <ul class="nav navbar-right panel_toolbox">
		                          <li><a class="close-link"><i class="fa fa-close"></i></a>
		                          </li>
		                        </ul>
		                        <div class="clearfix"></div>
		                      </div>
		                      <div class="x_content">
		 <table id="datatable-responsive3" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
		                  
		                      
		                          <thead>
		                          <tr>
		                            <th>Numéro</th>
		                            <th>Nom</th>
		                            <th>Prénom</th>
		                            <th></th>
		                          </tr>
		                          </thead>
		                          
		                          	<tbody>
		                      	<c:forEach items="${file}" var="c">
									<tr>
			                          <td>${c.idFile}</td>
			                          <td>${c.nomPatientAttente}</td>
			                          <td>${c.prenomPatientAttente}</td>
			                          <td> <a href="/ServeurProjet2CS/AccueilAssistantServlet?id=${c.idFile}">
			                         <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus-sign" aria-hidden="true"></span></button>
			                         </a></td>
			                        </tr>
								</c:forEach>
		                        
		                     
		                      </tbody>
		                            
		                        </table>
		
		                      </div>
		                    </div>
		                    </div>
		
		                 
		                  <!--liste d'attente médecin-->
				
				</div>
             
             
             
                


                  <!--Volet traitement-->
            </div >
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Affecter au médecin</h4>
        </div>
        <div class="modal-body">
          <h2>Le médecin disponible :</h2>
      <select class="form-control" id="sel1">
        <option>médecin 1</option>
        <option>médecin 2</option>
        <option>médecin 3</option>
        <option>médecin 4</option>
      </select>
          
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Faire passer</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
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
     <!-- jQuery -->
    <script src="biblio-extern/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="biblio-extern/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="biblio-intern/js/custom.min.js"></script>
    <!-- iCheck -->
    <script src="biblio-extern/iCheck/icheck.min.js"></script>
  <!-- FastClick -->
      <!-- NProgress -->
    <script src="biblio-extern/nprogress/nprogress.js"></script>
    <script src="biblio-extern/fastclick/lib/fastclick.js"></script>
    <script src="biblio-extern/daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="biblio-extern/moment/moment.min.js"></script>
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
        $('#datatable-responsive2').DataTable( {
            language: {
            	url: "biblio-extern/datatables.net/French.json"
            }
        } );
        $('#datatable-responsive3').DataTable( {
            language: {
            	url: "biblio-extern/datatables.net/French.json"
            },
            "info":     false,
            "bFilter": false,
            "ordering": false,
            "paging": false
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
    

    <script>
      $(document).ready(function () {
        $("#lstPatientBtn").click(function(){
          $("#lstPatientBtn").css({'background':'#d43f3a','border-color':'#d43f3a'});
          $("#lstPatientPrevuBtn").css({'background':'#169F85','border-color':'#169F85'});
          $("#dmdAssistBtn").css({'background':'#169F85','border-color':'#169F85'});
          $("#lstPatient").css({'display':''});
          $("#lstPatientPrevu").css({'display':'none'});
          $("#dmdAssist").css({'display':'none'});
        });
        $("#lstPatientPrevuBtn").click(function(){
          $("#lstPatientBtn").css({'background':'#169F85','border-color':'#169F85'});
          $("#lstPatientPrevuBtn").css({'background':'#d43f3a','border-color':'#d43f3a'});
          $("#dmdAssistBtn").css({'background':'#169F85','border-color':'#169F85'});
          $("#lstPatient").css({'display':'none'});
          $("#lstPatientPrevu").css({'display':''});
          $("#dmdAssist").css({'display':'none'});
        });
        $("#dmdAssistBtn").click(function(){
          $("#lstPatientBtn").css({'background':'#169F85','border-color':'#169F85'});
          $("#lstPatientPrevuBtn").css({'background':'#169F85','border-color':'#169F85'});
          $("#dmdAssistBtn").css({'background':'#d43f3a','border-color':'#d43f3a'});
          $("#lstPatient").css({'display':'none'});
          $("#lstPatientPrevu").css({'display':'none'});
          $("#dmdAssist").css({'display':''});
        });
      });
    </script>
  </body>
</html>