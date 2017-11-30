package servlets;
import service.DataBaseService;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.Document;
import classes.Examen;
import classes.Patient;

/**
 * Servlet implementation class AccueilMedecinServlet
 */
@WebServlet("/AccueilMedecinServlet")
public class AccueilMedecinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccueilMedecinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Patient> patientList = new DataBaseService().getPatientList();
		request.setAttribute("patientList", patientList);
		request.getRequestDispatcher("MedecinAccueil.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String quest1 = request.getParameter( "quest1" );
        String quest2 = request.getParameter( "quest2" );
        String quest3 = request.getParameter( "quest3" );
        String quest4 = request.getParameter( "quest4" );
        String quest5 = request.getParameter( "quest5" );
        String quest6 = request.getParameter( "quest6" );
        String quest7 = request.getParameter( "quest7" );
        String observations = request.getParameter( "observations" );
        DataBaseService db = new DataBaseService();
        int idPatient = db.getIdPatient(request.getParameter( "nom_patient" ), request.getParameter( "prenom_patient" ));        
        Examen exam = db.getExamen(idPatient);
        exam.setQuest1(quest1);exam.setQuest2(quest2);exam.setQuest3(quest3);exam.setQuest4(quest4);
        exam.setQuest5(quest5);exam.setQuest6(quest6);exam.setQuest7(quest7);exam.setObservations(observations);
        db.updateExamen(exam);
		doGet(request, response);
	}
}
