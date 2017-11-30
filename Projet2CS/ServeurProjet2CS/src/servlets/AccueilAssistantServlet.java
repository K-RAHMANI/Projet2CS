package servlets;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.FileAttente;
import classes.Patient;
import classes.patientPrevu;
import service.DataBaseService;

/**
 * Servlet implementation class AccueilAssistantServlet
 */
@WebServlet("/AccueilAssistantServlet")
public class AccueilAssistantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccueilAssistantServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    




	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if ((request.getParameter("id")) != null ){
			new DataBaseService().supprimerFile(request.getParameter("id"));
			  response.sendRedirect("./AccueilAssistantServlet");
		}else{
			List<FileAttente> file = new DataBaseService().getFileAttente();
			int nbreAttente = new DataBaseService().getNbreAttente();
			List<Patient> patientList = new DataBaseService().getPatientList();
			List<patientPrevu> patientPrevuList = new DataBaseService().getPatienPrevutList();
			request.setAttribute("patientPrevuList", patientPrevuList);
			request.setAttribute("nbreAttente", nbreAttente);
			request.setAttribute("patientList", patientList);
			request.setAttribute("file", file);
			request.getRequestDispatcher("Assistant.jsp").forward(request, response);	
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String nomPatient = request.getParameter("nom_patient");
		String prenomPatient = request.getParameter("prenom_patient");
		String date = request.getParameter("date");
		System.out.println(date);
		String heure = request.getParameter("heure");
		System.out.println(heure);
		String motif = request.getParameter("motif");
		String type = request.getParameter("type");
		int idPatient = new DataBaseService().getIdPatient(nomPatient, prenomPatient);
		new DataBaseService().addDemandeAssistance(idPatient,motif,type,date,heure);
		doGet(request, response);

	}
}
