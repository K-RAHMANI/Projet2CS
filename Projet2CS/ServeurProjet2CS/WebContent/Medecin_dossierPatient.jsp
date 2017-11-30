<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en" style="background:#F7F7F7;">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>ONAAPH!</title>

    <!-- Bootstrap -->
    <link href="biblio-extern/bootstrap2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="biblio-extern/bootstrap2/dist/css/bootstrap-grid.min.css" rel="stylesheet">
    <link href="biblio-extern/bootstrap2/dist/css/bootstrap-reboot.min.css" rel="stylesheet">
    <link href="biblio-extern/bootstrap2/dist/css/bootstrap-theme.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="biblio-extern/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="biblio-intern/css/custom.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="biblio-extern/iCheck/skins/flat/green.css" rel="stylesheet">

  </head>

  <body>
  	
    <div class="container body">
     <form action="AccueilMedecinServlet" method="post">
      <div class="main_container">

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu" style="height:50px">
            <nav>
            <h2 Style="color:BLACK;font: italic bold 15px Georgia, serif; float:left;margin:15px"> <Strong>Examen médical de:</Strong></h2>
            <input style="float:left;width:100px;margin:5px"  type="text"  readonly="readonly" class="form-control" id="prenom_patient" name="prenom_patient" value="<c:out value="${patient.prenom}"/>">
			<input style="float:left;width:100px;margin:5px"  type="text"  readonly="readonly" class="form-control" id="nom_patient" name="nom_patient" value="<c:out value="${patient.nom}"/>">
            <a href="./AccueilMedecinServlet"><button type="button" class="btn btn-danger" style="float:right;margin-left:10px;margin-top:7px"><i class="fa fa-ban"></i> Annuler</button></a>  
            <button type="submit" class="btn btn-success" style="float:right;margin-top:7px"><i class="fa fa-save"></i> Valider l'examen</button>
            
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <!-- C'est là où on doit modifier ... -->
               <div class="x_panel">
                  <div class="x_content">
                              <div class="col-md-8 col-xs-12" >                           
                             <div class="card card-outline-primary" style="margin-bottom:8px"> 
                                <div class="x_content" >                       
                                             <!--1st div horizo-->
                                             	<div class="col-md-6 col-xs-12" >
                                                      <div class="card card-outline-primary" style="margin-top:8px;margin-bottom:8px">
													    <textarea name="observations" class="form-control" id="exampleTextarea" rows="3" placeholder="Ecrivez vos remarques"></textarea>
													  </div>
                                               	</div>
                                               	
                                                <div class="col-md-6" style="padding-top: 0px; padding-bottom:0px;" >
                                                     <div class="col-md-4 col-xs-12">           
                                                    <span class="badge badge-default" style="font-size:13px;margin-bottom:5px">Poids: 85 kg</span> 
                                                    <br>
                                                    <span class="badge badge-default" style="font-size:13px;margin-bottom:5px">Taille: 1.75 m</span>
                                                    <br>
                                                    <span class="badge badge-default" style="float:left;font-size:13px;margin-right:5px"> Pointeur: 42</span>  
                                                 </div>
                                                 <br>  
                                                    <div class="col-md-6 col-xs-12">                              
                                                    	<h4><span class="badge badge-default" style="font-size:13px"><strong>IMC  </strong>: 27,8   <span style="color:red; font-size:13px;"><i class="fa fa-warning" ></i> surpoids</span></span> </h4>
                                                    </div> 
                                                    <br><br><br>
                                                    
                                                    <div >                  
                                                      <span class="badge badge-default" style="float:left;font-size:13px; margin-right:5px;margin-left:10px"> Tension(Min): 9 <strong><i class="fa fa-check" style="color:#449d44"></i></strong></span>
                                                      </div>
                                                      <div >                                                   
                                                       <span class="badge badge-default" style="float:left;font-size:13px; " > Tension(Max): 14,5  <strong><i class="fa fa-warning" style="color:red"></i></strong></span>
                                                      </div>  
                                                                         
                                              	 </div>
                                           <!--end first div-->                                     
                                           <!--2nd div horizo-->                                       
                               </div>
                              </div>

                              <div class="card card-outline-primary" style="margin-bottom:8px">
                                <div class="x_content" >
                                    <div class="col-md-6 col-xs-12" >
                                    <h4>1.Décrivez la surface de la zone péristomiale :</h4>
                                    <select class="custom-select form-control-sm col-md-6 col-xs-12" name="quest1" id="quest1" >
	                                    <option>Plane</option>
	                                    <option>Creuse</option>
	                                    <option>Bombée</option>   
                                    </select> 
									<br><br>
                                    <h4>2.Décrivez la zone péristomiale ?</h4>
                                    <select class="custom-select form-control-sm col-md-6 col-xs-12" name="quest2" id="quest2">
	                                    <option>Uniforme</option>
	                                    <option>Variable</option>
                                    </select> <br><br>
                                    <h4>3.L'abdomen est-il mou ou ferme?</h4>
                                    <select class="custom-select form-control-sm col-md-6 col-xs-12" name="quest3" id="quest3">
                                    <option>Mou</option>
                                    <option>Ferme</option>
                                    </select>  <br><br>    
                                    <h4>4.Avez-vous des plis superficiels ou profonds?</h4>
                                    <select class="custom-select form-control-sm col-md-6 col-xs-12" name="quest4" id="quest4">
                                    <option>Plis superficiels</option>
                                    <option>Plis profonds</option>
                                    </select> <br><br>                
                                    </div>
                                    <div class="col-md-6 col-xs-12">   
                                    <h4>5.Où se situe votre stomie ?</h4>
                                    <select class="custom-select form-control-sm col-md-8 col-xs-12" name="quest5" id="quest5">
                                    <option>Au-dessus de la ligne de flexion</option>
                                    <option>Au niveau de la ligne de flexion</option>
                                    <option>En dessous de la ligne de flexion</option>   
                                    </select> <br><br>
                                    <h4>6.Comment l’orifice de votre stomie se situe-t-il?</h4>
                                    <select class="custom-select form-control-sm col-md-9 col-xs-12" name="quest6" id="quest6">
                                    <option>Au-dessus de la surface de la peau</option>
                                    <option>Au niveau de la surface de la peau</option>
                                    <option>En dessous de la surface de la peau</option>   
                                    </select> <br><br>
                                   <h4>7.Décrivez les effluents émanant de votre stomie?</h4>
                                    <select class="custom-select form-control-sm col-md-6 col-xs-12" name="quest7" id="quest7">
	                                    <option>Selles moulées</option>
	                                    <option>Selles liquides</option>
	                                    <option>Urine</option>   
                                    </select> 
                                    <br><br><br>
                                    <button id="btnVoir" type="button" class="btn btn-primary btn-md" Style="float:right;"><i class="fa fa-check"></i> Valider mes choix</button>                                
                                    </div>
                                </div>
                            </div>
                            <div id="optionImg" class="x_panel" style="background-color:  #F8F9F9; padding:5px;display:none; ">   
								<img id="optionImg2" src="images/SIAD/quest5.png" width="100%" height="180px" >
							</div>

							<div id="produitSiad" class="x_panel" style="background-color:  #F8F9F9; padding:5px;display:none; ">   
								<div class="col-md-12 col-xs-12"> 
									<c:forEach items="${produitList}" var="prod">
									<label class="custom-control custom-checkbox" Style="float:left">
									  <input type="checkbox" class="custom-control-input" value="${prod.design}" id="${prod.design}" >
									  <span class="custom-control-indicator"></span>
									  <span class="custom-control-description">${prod.design}</span>
									</label>
									</c:forEach>
								</div>
								 <button id="btnValiderSiad" type="button" class="btn btn-primary btn-md" Style="align:center;"><i class="fa fa-plus-circle"></i>  Ajouter à l'ordonnance</button>                               
							</div>
                             <div id="ordonnance" class="card card-outline-primary" style=" padding:5px;">                                
                                 <table id="ordonnanceTable" class="table table-sm table-responsive table-hover" style="margin: 0px">
                                  <thead>
                                   <tr>
                                   <th >Prescription</th>
                                    <th width="25%" >Produit</th>
                                    <th width="15%">Quantité</th>
                                    <th width="20%">Description</th>
                                    <th></th>
                                   </tr>
                                 </thead>
                                 <tbody>
                                  <tr id="tr1" ><td> <input class="form-control form-control-sm" type="text" > </td> <td><input list="produits" class="form-control form-control-sm" width="100%" type="text" > <datalist id="produits"><c:forEach items="${produitList}" var="prd"><option value="${prd.design}"></c:forEach> </datalist> </td> <td><input class="form-control form-control-sm" type="text" > </td>  <td> <input class="form-control form-control-sm" type="text" > </td> 
                                  <td><button type="button" class="btn btn-danger btn-sm" style="margin:0px" onClick="suppTr('tr1')"><i class="fa fa-minus"></i></button></td>
                                  </tr>
                            	
                              	</tbody>
                             </table>
                             <button id="ajtLigne" type="button" class="btn btn-primary btn-sm col-md-2" style="margin:0px"><i class="fa fa-plus"></i>  Ajouter</button>
                          </div>               
                    </div>
                     <div class="col-md-4 col-xs-12">
                         <div  class="divd" align="center" style="border: solid 1px lightgray">                   
                            <select class="form-control" id="catSelect" Style="float:left;width:50%">
	                            <option value='typeTous' >Tous les documents</option>              
	                            <option value='typeOrdonnance'>Ordonnances</option>
	                            <option value='typeOrdonnanceInterne'>--Ordonnances internes</option>
	                            <option value='typeOrdonnanceExterne'>--Ordonnances externes</option>
	                            <option value='typeRadiographie'>Radiographie</option>
	                            <option value='typeRadiographieInterne'>--Radiographie interne</option>
	                            <option value='typeRadiographieExterne'>--Radiographie externe</option>
                            </select>
                            <select class="form-control" id="docSelect" Style="float:left;width:50%" >
	                            <option value='noDoc.jpg' class='typeTous' >Choisissez un document</option>
	                            <c:forEach items="${docList}" var="c">
	                            	<option value='${c.url}' class='${c.nom_doc}'>${c.type_doc} ${c.date_depote}</option>
								</c:forEach>
                            </select>
                            <div style="background: white;">
<!-- 								<img id="preview" src="images/docs/noDoc.jpg" width="100%" height="100%" > -->
									<embed id="preview" src="images/docs/noDoc.jpg" type='application/pdf' width="100%" height="480px" />
                            </div>
                            <button class="btn" type="button"><i class="fa fa-chevron-left" ></i></button>
                            <button class="btn" type="button"><i class="fa fa-chevron-right" ></i></button>
                            
                            <div class="card" style="width: 20rem;Display:none; position:absolute" id="descPrdImg">
							  <img class="card-img-top" id="card-img-top" src="images/produit/Anneau_Protecteur.jpg" alt="Card image cap">
							  <div class="card-block">
							    <h4 class="card-title">Description Produit</h4>
							    <p class="card-text">Ce produit est de très bonne qualité, il est le plus utilisé dans les cas ...etc</p>
							  </div>
							</div>
                         </div>
                        
                     </div>                    
                 </div>
                
              </div>
             
        </div>
     
     </div>
     </form>
     

        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="biblio-extern/jquery/dist/jquery.min.js" type="text/javascript"></script>
    <!-- Custom Theme Scripts -->
    <script src="biblio-intern/js/custom.min.js" type="text/javascript"></script>
    <!-- Bootstrap -->
    <script src="biblio-extern/bootstrap/dist/js/bootstrap.js" type="text/javascript"></script>

    <script >
    
    	function suppTr(s){
    		$('#'+s).hide();
    	}
	    var cursorX;
	    var cursorY;
	    document.onmousemove = function(e){
	        cursorX = e.pageX;
	        cursorY = e.pageY;
	    }
      $(document).ready(function() {
    	  $("select.form-control-sm").hover(function(){	
    	        }, function(){
    	        $('#optionImg').hide();
    		  	$('#ordonnance').show();

    	    });
    	$(".custom-checkbox").hover(function(){
    		$('#descPrdImg').css("bottom",620-cursorY); 
    		$('#descPrdImg').css("left",cursorX-900); 
    		$('#card-img-top').attr('src','images/produit/'+$('.custom-checkbox > input').val()+'.jpg');
    		$('#descPrdImg').show();
    		
	        }, function(){
		  	$('#descPrdImg').hide();

	    });
    	  
    	 
    	$("select.form-control-sm").click(function(){
    		$('#optionImg2').attr('src','images/SIAD/'+this.id+'.png');
    		  $('#optionImg').show();
  		  	  $('#ordonnance').hide();
    	  });
    	  $("#btnVoir").click(function(){
  		  	  $('#ordonnance').hide();
  		  	  $('#produitSiad').show();
    	  });
    	  $("#ajtLigne").click(function(){
    			  $('#ordonnanceTable tr:last').after(
    					  '<tr id="${prd.design}"><td> <input class="form-control form-control-sm" type="text" > </td><td><input list="produits" class="form-control form-control-sm" width="100%" type="text" > <datalist id="produits"><c:forEach items="${produitList}" var="prd">   	<option value="${prd.design}""></c:forEach> </datalist> </td> <td><input class="form-control form-control-sm" type="text" > </td>  <td> <input class="form-control form-control-sm " type="text" > </td> <td><button type="button" class="btn btn-danger btn-sm" style="margin:0px" onClick="suppTr("${prd.design}")"><i class="fa fa-minus"></i></button></td></tr>'
    			  );
    	  });
    	  $("#btnValiderSiad").click(function(){
	    		  <c:forEach items="${produitList}" var="prod">
		    		  if ($("#${prod.design}").is(":checked")){
		    			  $('#ordonnanceTable tr:last').after(
		    					  '<tr id="${prd.design}"><td> <input class="form-control form-control-sm" type="text" ><td><input list="produits" class="form-control form-control-sm" width="100%" type="text" value="${prod.design}"> <datalist id="produits"><c:forEach items="${produitList}" var="prd">   	<option value="${prd.design}"></c:forEach> </datalist> </td> <td><input class="form-control form-control-sm" type="text" > </td>  <td> <input class="form-control form-control-sm " type="text" > </td><td><button type="button" class="btn btn-danger btn-sm" style="margin:0px" onClick="suppTr("${prd.design}")"><i class="fa fa-minus"></i></button></td></tr>'
		    			  );
		    		  }
    		  	   </c:forEach>
  		  	  $('#ordonnance').show();
  		  	  $('#produitSiad').hide();
    	  });
    	  
    	  $('#docSelect').change(function(){ 
    		    var value = $(this).val();
    		    var parent = $('embed#preview').parent();
    		    var newElement = "<embed id='preview' src='images/docs/"+value+"' width='100%' height='480px' />";
    		    $('embed#preview').remove();
    		    parent.append(newElement);

    		});
    	  $('#catSelect').change(function(){ 
  		    var value = $('#catSelect option:selected').attr('value');
  		    console.log(value);
  		    if (value!='typeTous'){
  		    	$('.typeTous').hide();
  		    	$('.typeOrdonnance').hide();
  		    	$('.typeOrdonnanceInterne').hide();
  		    	$('.typeOrdonnanceExterne').hide();
  		    	$('.typeRadiographie').hide();
  		    	$('.typeRadiographieInterne').hide();
  		    	$('.typeRadiographieExterne').hide();
  		    	$('.'+value).show();
  		    }else{
  		    	$('.typeTous').show();
  		    	$('.typeOrdonnance').show();
  		    	$('.typeOrdonnanceInterne').show();
  		    	$('.typeOrdonnanceExterne').show();
  		    	$('.typeRadiographie').show();
  		    	$('.typeRadiographieInterne').show();
  		    	$('.typeRadiographieExterne').show();
  		    }
  		});
      });
    </script>
  </body>
</html>