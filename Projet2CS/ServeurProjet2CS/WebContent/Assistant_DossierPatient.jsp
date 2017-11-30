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
  <form method="post" action="Assistant_DossierPatient?src=nonprevu">
    <div class="container body">
      <div class="main_container">

        <!-- top navigation -->
         <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu" style="height:50px">
            <nav>
	            <h2 style="margin:15px;float:left"> <Strong>Mise à jour dossier du patient :</Strong> <c:out value="${patient.nom}" /> <c:out value="${patient.prenom}" /></h2>
	             <a href="./AccueilAssistantServlet">
	            <button type="button" class="btn btn-danger" style="float:right;margin-left:10px;margin-top:7px"><i class="fa fa-save"></i> Annuler</button>  </a>
	            <button id="btnValider" type="submit" class="btn btn-success" style="float:right;margin-top:7px;"><i class="fa fa-save"></i>Valider</button>
	            <button type="button" id="btnModifier" class="btn btn-success" style="float:right;margin-top:7px"><i class="fa fa-save"></i> Mise a jour</button>
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
                                    <input type="text"  readonly="readonly" class="form-control has-feedback-left" id="nom_patient" name="nom_patient" value="<c:out value="${patient.nom}" />">
                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									 
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" readonly="readonly" class="form-control has-feedback-left" id="prenom_patient" name="prenom_patient" value="<c:out value="${patient.prenom}" />">
                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									 
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="date" readonly="readonly" class="form-control has-feedback-left" name="date_naissance_patient" id="date_naissance_patient" value="<c:out value="${patient.dateNai}" />">
                                    <span class="fa fa-clock-o form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									
									
									 
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="Email" readonly="readonly" class="form-control has-feedback-left" name="email_patient" id="email_patient" value="<c:out value="${patient.mail}" />">
                                    <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>                            
								     </div>
									
									 
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" readonly="readonly" class="form-control has-feedback-left" name="tel_patient" id="tel_patint" value="<c:out value="${patient.tel1}" />">
                                    <span class="fa fa-phone form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									 
									
									  <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" readonly="readonly" class="form-control has-feedback-left" name="tel_patient2" id="tel_patient2" value="<c:out value="${patient.tel2}" />">
                                    <span class="fa fa-phone form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									 
									  <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" readonly="readonly" class="form-control has-feedback-left" name="adr_patient"  id="adr_patient" value="<c:out value="${patient.adr}" />">
                                    <span class="fa fa-home form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									 
									
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" readonly="readonly" class="form-control has-feedback-left" name="wilaya_patient" id="wilaya_patient" value="<c:out value="${patient.wilaya}" />">
                                    <span class="fa fa-home form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" readonly="readonly" class="form-control has-feedback-left" name="commune_patient" id="commune_patient" value="<c:out value="${patient.commune}" />">
                                    <span class="fa fa-home form-control-feedback left" aria-hidden="true"></span>
                                     </div>
                                     <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" readonly="readonly" class="form-control has-feedback-left" name="NSS" id="NSS" value="<c:out value="${patient.nss}" />">
                                    <span class="fa fa-home form-control-feedback left" aria-hidden="true"></span>
                                     </div>
                                     <div class="col-md-4 col-sm-6 col-xs-12">
                                      <select name="caisse" class="col-md-12 col-sm-6 col-xs-12 form-group has-feedback" readonly="readonly" style="border-radius: 5px;height:35px"  name="sel_fich" id="sel_fich" >
	                                    <option>Caisse</option>
										<option>CNAS</option>
	                                    <option>CASNOS</option>
	                                    <option>MILITAIRE</option>   
	                                    </select>
									   </div>	
                                     
                                     <div class="col-md-4 col-sm-6 col-xs-12">
		                              <input type="file" readonly="readonly" id="fichier" name="fichier"  class="form-control col-md-7 col-xs-12">
		                            </div>
                                      				   
							   
                            </div>
                             
                         </div>
	<!--...............................-->					
					
					      <div class="col-md-8 col-xs-12" style="width:100%">
                            <div class="x_panel" style="border-color: #000000;border-radius:20px;background:#EEEEEE">
							
							
                                 <h2 Style="color:BLACK;font: italic bold 15px Georgia, serif;">Proches à contacter</h2> 
                                  
								   <hr  style="color:black; margin: 5px">
								  
								  
								  	 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" readonly="readonly" class="form-control has-feedback-left" name="nom_proche" id="nom_proche" value="<c:out value="${patient.nomProche}" />">
                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									 
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" readonly="readonly" class="form-control has-feedback-left" name="prenom_proche" id="prenom_proche" value="<c:out value="${patient.prenomProche}" />">
                                    <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									 
								
									 
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="Email" readonly="readonly" class="form-control has-feedback-left" name="email_proche" id="email_proche" value="<c:out value="${patient.mailProche}" />">
                                    <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>                            
								     </div>
									  
									
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" readonly="readonly" class="form-control has-feedback-left" name="tel_proche" id="tel_proche" value="<c:out value="${patient.tel1Proche}" />">
                                    <span class="fa fa-phone form-control-feedback left" aria-hidden="true"></span>
                                     </div>
									  <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" readonly="readonly" class="form-control has-feedback-left" name="tel_proche2" id="tel_proche2" value="<c:out value="${patient.tel2Proche}" />">
                                    <span class="fa fa-phone form-control-feedback left" aria-hidden="true"></span>
                                     </div>
								
									 
									 <div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">
                                    <input type="text" readonly="readonly" class="form-control has-feedback-left" name="relation_p_p" id="relation_p_p" value="<c:out value="${patient.relationPatient}" />">
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
		                              <input type="file" id="fichier" name="fichier"   class="form-control col-md-7 col-xs-12">
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
    	  $('#btnModifier').click(function(){
    		  $('input').prop( "readonly", false );
    		  $('select').prop( "readonly", false );
    		  $('#btnModifier').hide();
    	  });
      });
    </script>
    <!-- /Datatables -->
    
    </form>
  </body>
</html>