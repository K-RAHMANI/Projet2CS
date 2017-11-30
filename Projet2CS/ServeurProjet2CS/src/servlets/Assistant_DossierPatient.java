package servlets;

import java.io.IOException;
import java.util.Date;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

import java.text.SimpleDateFormat;
import java.util.Date;

import classes.Examen;
import classes.Patient;
import classes.patientPrevu;
import service.DataBaseService;

/**
 * Servlet implementation class Assistant_DossierPatient
 */
@WebServlet("/Assistant_DossierPatient")
public class Assistant_DossierPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Assistant_DossierPatient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
		String var = request.getParameter("source");
		
		
		if (var.equals("a")){
			Patient patient = new DataBaseService().getPatient(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("patient", patient);
			request.getRequestDispatcher( "Assistant_DossierPatient.jsp" ).forward( request, response );
		}else{
			if (var.equals("b")){
				patientPrevu patientPrevu = new DataBaseService().getPatientPrevu(Integer.parseInt(request.getParameter("id")));
				request.setAttribute("patientPrevu", patientPrevu);
				
				request.getRequestDispatcher( "Assistant_DossierPatientPrevu.jsp" ).forward( request, response );
			}else{
				request.getRequestDispatcher( "Assistant_NouveauPatient.jsp" ).forward( request, response );
				
			}
			
			
		}
		
	
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nom_patient = request.getParameter( "nom_patient" );
        String prenom_patient = request.getParameter( "prenom_patient" );
        String date_naissance_patient = request.getParameter( "date_naissance_patient" );
        String email_patient = request.getParameter( "email_patient" );
        String tel_patient = request.getParameter( "tel_patient" );
        String tel_patient2 = request.getParameter( "tel_patient2" );
        String adr_patient = request.getParameter( "adr_patient" );
        String wilaya_patient = request.getParameter( "wilaya_patient" );
        String commune_patient = request.getParameter( "commune_patient" );
        String nom_proche = request.getParameter( "nom_proche" );
        String prenom_proche = request.getParameter( "prenom_proche" );
        String email_proche = request.getParameter( "email_proche" );
        String tel_proche = request.getParameter( "tel_proche" );
        String tel_proche2 = request.getParameter( "tel_proche2" );
        String relation_p_p = request.getParameter( "relation_p_p" );
        String poids = request.getParameter( "poids" );
        String taille = request.getParameter( "taille" );
        String tensionMin = request.getParameter( "tensionMin" );
        String tensionMax = request.getParameter( "tensionMax" );
        String pointure = request.getParameter( "pointure" );
        String nss = request.getParameter( "NSS" );
        String caisse = request.getParameter( "caisse" );
        String fichier = request.getParameter( "fichier" );
        String sel_fich = request.getParameter( "sel_fich" ); 
      
       Patient patient1 = new Patient (nom_patient,prenom_patient,date_naissance_patient,adr_patient,
    		   commune_patient, wilaya_patient, tel_patient, tel_patient2,email_patient, nom_proche,prenom_proche,
    		   email_proche,tel_proche, tel_proche2, relation_p_p, "Hopital Mustapha Bacha", nss, caisse );
      
       String src = request.getParameter("src");
       DataBaseService db = new DataBaseService();
       if ( !src.equals("nonprevu")){
    	   System.out.println("d5lt");
    	   db.AjouterPatient(patient1);
       }
        int idPatient = new DataBaseService().getIdPatient(nom_patient, prenom_patient);
        int me = 1;   
        String type_Examen = "type1";
       
        Examen exam = new Examen (me, idPatient ,type_Examen, Float.parseFloat(poids), Float.parseFloat(taille), Float.parseFloat(tensionMin),  Float.parseFloat(tensionMax), Float.parseFloat(pointure));
        db.AjouterExamen(exam);
        
       
        if ( src.equals("prevu")){
        	int id = new DataBaseService().getIdPatientPrevu(nom_patient, prenom_patient);
        	new DataBaseService().supprimerPrevu(String.valueOf(id));
        	
        }
       
        
        new DataBaseService().affecterListeAttente(String.valueOf(idPatient));
        response.sendRedirect("./AccueilAssistantServlet");
        
       
        
	}

}
