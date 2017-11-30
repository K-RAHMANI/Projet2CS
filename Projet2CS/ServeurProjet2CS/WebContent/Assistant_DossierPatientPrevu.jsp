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
    <!-- Custom Theme Style -->
    <link href="biblio-intern/css/custom.css" rel="stylesheet">

	
  </head>

  <body>
  <form method="post" action="Assistant_DossierPatient?src=prevu">
  
    <div class="container body">
      <div class="main_container">

        <!-- top navigation -->
         <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu" style="height:50px">
            <nav>
            <h2 style="margin:15px;float:left"> <Strong>Compléter dossier patient:</Strong> <c:out value="${patient.nom}" /> <c:out value="${patient.prenom}" /></h2>
            <a href="./AccueilAssistantServlet">
            <button type= "button" class="btn btn-danger" style="float:right;margin-left:10px;margin-top:7px"><i class="fa fa-save"></i> Annuler</button> </a> 
            <button type="submit" class="btn btn-success" style="float:right;margin-top:7px"><i class="fa fa-save"></i> Valider</button>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->
                <!-- /top navigation -->

        <!-- page content -->
      
        <div class="right_col" role="main">
          <!-- C'est là où on doit modifier ... -->
               <div class="x_panel">
			                     <div class="x_content">
				  
				  		
        						 <!--début partie gauche-->

                         <div class="col-md-8 col-xs-12" >
						
	 <!--...............................-->					
                         <div class="col-md-8 col-xs-12" style="width:100%" >
                              
                              
                            <div class="x_panel" style="border-color: #000000;border-radius:20px;background:#EEEEEE">
                              
							      <h2 Style="color:BLACK;font: italic bold 15px Georgia, serif;">Informations du patient</h2> 
                                  <hr  style="color:black; margin: 3px">
			                      	
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" class="form-control has-feedback-left" id="nom_patient" name="nom_patient" value="<c:out value="${patientPrevu.nom}" />" >
                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									 
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" class="form-control has-feedback-left" id="prenom_patient" name="prenom_patient" value="<c:out value="${patientPrevu.prenom}" />" >
                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									 
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="date" class="form-control has-feedback-left" name="date_naissance_patient" id="date_naissance_patient"  value="<c:out value="${patientPrevu.dateNai}" />" >
                                    <span class="fa fa-clock-o form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									
									
									 
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="Email" class="form-control has-feedback-left" name="email_patient" id="email_patient" placeholder="Email">
                                    <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>                            
								     </div>
									 
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" class="form-control has-feedback-left" name="tel_patient" id="tel_patint" value="<c:out value="${patientPrevu.tel1}" />">
                                    <span class="fa fa-phone form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									 
									
									  <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" class="form-control has-feedback-left" name="tel_patient2" id="tel_patient2" placeholder="Téléphone2">
                                    <span class="fa fa-phone form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									 
									  <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" class="form-control has-feedback-left" name="adr_patient"  id="adr_patient" placeholder="Adresse">
                                    <span class="fa fa-home form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									 
									
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" class="form-control has-feedback-left" name="wilaya_patient" id="wilaya_patient" value="<c:out value="${patientPrevu.wilaya}" />">
                                    <span class="fa fa-home form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" class="form-control has-feedback-left" name="commune_patient" id="commune_patient" placeholder="Commune">
                                    <span class="fa fa-home form-control-feedback left" aria-hidden="true"></span>
                                     </div>
                                     <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" class="form-control has-feedback-left" name="NSS" id="NSS" placeholder="NSS">
                                    <span class="fa fa-home form-control-feedback left" aria-hidden="true"></span>
                                     </div>
                                     <div class="col-md-4 col-sm-6 col-xs-12">
                                      <select class="col-md-12 col-sm-6 col-xs-12 form-group has-feedback" style="border-radius: 5px;height:35px"  name="sel_fich" id="sel_fich">
	                                    <option>Caisse</option>
										<option>CNAS</option>
	                                    <option>CASNOS</option>
	                                    <option>MILITAIRE</option>   
	                                    </select>
									   </div>	
                                     
                                     <div class="col-md-4 col-sm-6 col-xs-12">
		                              <input type="file" id="fichier" name="fichier"  class="form-control col-md-7 col-xs-12">
		                            </div>
                                      				   
							   
                            </div>
                             
                         </div>
	<!--...............................-->					
					
					      <div class="col-md-8 col-xs-12" style="width:100%">
                            <div class="x_panel" style="border-color: #000000;border-radius:20px;background:#EEEEEE">
							
							
                                 <h2 Style="color:BLACK;font: italic bold 15px Georgia, serif;">Proches à contacter</h2> 
                                  
								   <hr  style="color:black; margin: 5px">
								  
								  
								  	 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" class="form-control has-feedback-left" name="nom_proche" id="nom_proche" placeholder="Nom du proche">
                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									 
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" class="form-control has-feedback-left" name="prenom_proche" id="prenom_proche" placeholder="Prénom du proche">
                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									 
								
									 
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="Email" class="form-control has-feedback-left" name="email_proche" id="email_proche" placeholder="Email">
                                    <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>                            
								     </div>
									  
									
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" class="form-control has-feedback-left" name="tel_proche" id="tel_proche" placeholder="Téléphone1">
                                    <span class="fa fa-phone form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									  <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" class="form-control has-feedback-left" name="tel_proche2" id="tel_proche2" placeholder="Téléphone2">
                                    <span class="fa fa-phone form-control-feedback left" aria-hidden="true"></span>
                                     </div>
								
									 
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" class="form-control has-feedback-left" name="relation_p_p" id="relation_p_p" placeholder="Relation avec le patient">
                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>                            
								     </div>
									 
								  
								  
			                      					
                                
                            </div>
                         </div>  
                         
                         
<!--...............................-->	

						 <div class="col-md-8 col-xs-12" style="width:100% ">
                            <div class="x_panel" style="border-color: #000000;border-radius:20px;background:#EEEEEE">
                                  <h2 Style="color:black;font: italic bold 15px Georgia, serif;">Mesures</h2> 
                                   <hr  style="color:black; margin: 5px">
								  
								<div class="col-md-2 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" class="form-control " name="poids" id="poids" placeholder="Poids">
                                    
								   </div>
								   
								    <div class="col-md-2 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" class="form-control " name="taille" id="taille" placeholder="Taille">
								
								   </div>
								   
								   <div class="col-md-3 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" class="form-control " name="tensionMin" id="tensionMin" placeholder="TensionMin">
								  
								   </div>
								   
								   <div class="col-md-3 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" class="form-control " name="tensionMax" id="tensionMax" placeholder="TensionMax">
								 
								   </div>
								   
								   <div class="col-md-2 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" class="form-control" name="pointure" id="pointure" placeholder="Pointure">
								   </div>							                                                
                            </div>
                         </div>					
     <!--...............................-->	
      					<div class="col-md-8 col-xs-12" style="width:100% ">
     						<div class="x_panel" style="border-color: #000000;border-radius:20px;background:#EEEEEE">
                                 <h2 Style="color:BLACK;font: italic bold 15px Georgia, serif;">Fichiers</h2> 
                                    <hr  style="color:black; margin: 5px">
                                
                            
		                            <div class="col-md-6 col-sm-6 col-xs-12 ">
		                              <input type="file" id="fichier" name="fichier"  class="form-control col-md-7 col-xs-12">
		                            </div>
                                 
								 
									    <select class="col-md-3 col-sm-6 col-xs-12 form-group has-feedback" style="border-radius: 5px;height:35px"  name="sel_fich" id="sel_fich">
	                                    <option>Le type du fichier</option>
										<option>Ordonnance</option>
	                                    <option>Bilan</option>
	                                    <option>Echographie</option>   
	                                    </select>
								
									
									<div class="col-md-3 col-sm-6 col-xs-12 form-group has-feedback">
	                  				<button type="button" id="btn_val" class="btn btn-round btn-success" style="width:100%;border-radius: 5px; align:center" > <i class="fa fa-plus-square"> </i> Ajouter le fichier  </button>
	                                
									</div>
									
                            </div>
                          </div>  
     <!--...............................-->	
						 </div> 
<!--fin partie gauche-->						 

						 
<!--début partie Droite-->

						<div class="col-md-4 col-xs-12">

						 
                         
		<!--...............................-->					 
                            
                        	
                        	<div  class="divd" align="center" style="border: solid 1px lightgray">
                        
                            <select class="form-control" id="sel1">
                            <option>Choisissez un document </option>
                            <option>Document 2</option>
                            <option>Document 3</option>
                            <option>Document 4</option>
                            </select>
                            <div style="background: white;padding-bottom:180px;padding-top: 180px ">
                              <h1><i class="fa fa-search"></i></h1> 
                               Veuillez sélectionner un élément pour le visualiser
                            </div>
                             <br><br>
                            <button type="button" class="glyphicon glyphicon-backward"></button>
                            <button type="button" class="glyphicon glyphicon-forward"></button>
                         </div>

                        </div>
                        <!--fin partie droite-->
                         					
                 </div>
				 <!--/x-content-->
                 
                          
					 
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

        //$('#datatable').dataTable();

//        $('#datatable-keytable').DataTable({
//          keys: true
//        });

//        $('#datatable-responsive').DataTable();
//
//        $('#datatable-scroller').DataTable({
//          ajax: "js/datatables/json/scroller-demo.json",
//          deferRender: true,
//          scrollY: 380,
//          scrollCollapse: true,
//          scroller: true
//        });
//
//        $('#datatable-fixed-header').DataTable({
//          fixedHeader: true
//        });

        var $datatable = $('#datatable-checkbox');

//        $datatable.dataTable({
//          'order': [[ 1, 'asc' ]],
//          'columnDefs': [
//            { orderable: false, targets: [0] }
//          ]
//        });
        $datatable.on('draw.dt', function() {
          $('input').iCheck({
            checkboxClass: 'icheckbox_flat-green'
          });
        });

        TableManageButtons.init();
      });
    </script>
    <!-- /Datatables -->
    </form>
  </body>
</html>