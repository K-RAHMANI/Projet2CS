package servlets;

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
import classes.Produit;
import service.DataBaseService;

/**
 * Servlet implementation class ExamenMedicalServlet
 */
@WebServlet("/ExamenMedicalServlet")
public class ExamenMedicalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExamenMedicalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int idPatient=Integer.parseInt(request.getParameter("id"));
		Patient patient = new DataBaseService().getPatient(idPatient);
		Examen examen = new DataBaseService().getExamen(idPatient);
		List<Document> docList=new DataBaseService().getDocListMedical(idPatient);
		List<Produit> produitList=new DataBaseService().getPrdList();
		request.setAttribute("docList", docList);
		request.setAttribute("patient", patient);
		request.setAttribute("examen", examen);
		request.setAttribute("produitList", produitList);
		request.getRequestDispatcher("Medecin_dossierPatient.jsp").forward(request, response);
		}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
