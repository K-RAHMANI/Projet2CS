package service;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import classes.Document;
import classes.Examen;
import classes.FileAttente;
import classes.Patient;
import classes.Produit;
import classes.patientPrevu;

/**
 * Created by RAHMANI KHAYREDDIN on 08/05/2017.
 */

public class DataBaseService {

    /*public static final String className = "org.postgresql.Driver";
    public static final String chaine = "jdbc:postgresql://localhost:3306/db_projet";
    public static final String username = "postgres";
    public static final String password = "esi";*/
	
	public static final String className = "com.mysql.jdbc.Driver";
    public static final String chaine = "jdbc:mysql://localhost:3306/projet2";
    public static final String username = "root";
    public static final String password = "";
    private PreparedStatement prep;
    private Connection connection;

    public Connection connecter(){
        Connection con = null;
        try {
            Class.forName(className);
            con = DriverManager.getConnection(chaine,username,password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    public List<Patient> getPatientList(){
    	List<Patient> patientList = new ArrayList<Patient>();
        String query = "Select * from patient";
        Connection connection = connecter();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()){
                Patient patient = new Patient();
                patient.setNom(rs.getString("nom_patient"));
                patient.setPrenom(rs.getString("prenom_patient"));
                patient.setTel1(rs.getString("Telephone1"));
                patient.setTel2(rs.getString("Telephone2"));
                patient.setDateNai(rs.getString("Date_Naissance_patient"));
                patient.setAdr(rs.getString("Telephone2"));
                patient.setHopital(rs.getString("hopital"));
                patient.setId(Integer.parseInt(rs.getString("id_patient")));
                patientList.add(patient);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return patientList;    
    }
    
    public void AjouterPatient(Patient patient){
    	String query = "insert into patient values(NULL,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,NULL,NULL)"; //15 + id + photo
    	connection = connecter();
    	prep = null;
        
    	int i=-1;
    	try {
			prep =connection.prepareStatement(query);
			prep.setString(1, patient.getNom());
			prep.setString(2, patient.getPrenom());
			prep.setString(3,  patient.getDateNai());
			prep.setString(4, patient.getAdr());
			prep.setString(5, patient.getCommune());
			prep.setString(6, patient.getWilaya());
			prep.setString(7, patient.getTel1());
			prep.setString(8, patient.getTel2());
			prep.setString(9, patient.getMail());
			prep.setString(10, patient.getNomProche());
			prep.setString(11, patient.getPrenomProche());
			prep.setString(12, patient.getMailProche());
			prep.setString(13, patient.getTel1Proche());
			prep.setString(14, patient.getTel2Proche());
			prep.setString(15, patient.getRelationPatient());
			prep.setString(16, patient.getNss());
			prep.setString(17, patient.getCaisse() );
			
	    	i=prep.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public void AjouterExamen( Examen examen){
    	String query = "insert into examen(Medecin,Patient,Type_Examen,Poids,Taille,Pointure,tensionMin,tensionMax) values(1,?,?,?,?,?,?,?)"; //15 + id + photo
    	connection = connecter();
    	prep = null;
    	int i=-1;
    	try {
			prep =connection.prepareStatement(query);
			prep.setString(1, String.valueOf(examen.getPatient()));	
			prep.setString(2, "Type1");	
			prep.setString(3, String.valueOf(examen.getPoids()));
			prep.setString(4, String.valueOf(examen.getTaille()));
			prep.setString(5, String.valueOf(examen.getTensionMin()));
			prep.setString(6, String.valueOf(examen.getTensionMAx()));
			prep.setString(7, String.valueOf(examen.getPointure()));
			
			
	    	i=prep.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public Patient getPatient(int id){
    	String query = "select * from patient where id_patient="+id;
    	
    	connection = connecter();
    	Patient patient=new Patient();;
    	try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query); 
            rs.next();
            patient.setNom(rs.getString("Nom_patient"));
            patient.setPrenom(rs.getString("Prenom_patient"));
            patient.setDateNai(rs.getString("Date_Naissance_patient"));
            patient.setAdr(rs.getString("Adresse"));
            patient.setTel1(rs.getString("Telephone1"));
            patient.setTel2(rs.getString("Telephone2"));
            patient.setCommune(rs.getString("Commune"));
            patient.setWilaya(rs.getString("Wilaya"));
            patient.setMail(rs.getString("Email"));
            patient.setNomProche(rs.getString("Nom_Proche"));
            patient.setPrenomProche(rs.getString("Prenom_Proche"));
            patient.setMailProche(rs.getString("Email_Proche"));
            patient.setTel1Proche(rs.getString("Telephoen1_Proche"));
            patient.setTel2Proche(rs.getString("Telephoen2_Proche"));
            patient.setRelationPatient(rs.getString("Raltion_Patient"));
            patient.setNss(rs.getString("nss"));
            patient.setCaisse(rs.getString("caisse"));
       
            patient.setId(Integer.parseInt(rs.getString("ID_Patient")));
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
	return patient;	
    }
    
    public int getIdPatient(String nom, String prenom){
    	String query = "select id_patient from patient where Nom_patient = '"+nom+"' and Prenom_patient = '"+prenom+"'";
    	connection = connecter();
    	int id=-1;
    	try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query); 
            rs.next();
            id = Integer.parseInt(rs.getString("id_patient"));
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    	return id;
    }
    
    public Examen getExamen(int idPatient){
    	String query = "Select * from examen where patient="+idPatient+" and Date_Examen=(Select Max(Date_Examen) from examen)";
    	connection = connecter();
    	int id=-1;
    	Examen examen=new Examen();;
    	try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query); 
            rs.next();
            examen.setID_Examen(Integer.parseInt(rs.getString("ID_Examen")));
            examen.setMedecin(Integer.parseInt(rs.getString("Medecin")));
            examen.setPatient(Integer.parseInt(rs.getString("Patient")));
            examen.setTaille(Float.valueOf(rs.getString("Taille")));
            examen.setPoids(rs.getFloat("Poids"));
            examen.setPointure(Float.parseFloat(rs.getString("Pointure")));
            examen.setDate_Examen(rs.getString("Date_Examen"));
            examen.setHeure_Examen(rs.getString("Heure_Examen"));
            examen.setType_Examen(rs.getString("Type_Examen"));
            examen.setObservations("observations");
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    	return examen;	
    }
    
public int getNbreAttente(){
    	
    	String query =  " select count(*)as A FROM filattente " ;
    	
    	int idUtilisateur2 = 0;
    	connection = connecter();
    	
    	try {
    		
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query); 
            rs.next();
             idUtilisateur2 = rs.getInt( "A" );
            } 
         catch (SQLException e) {
            e.printStackTrace();
        }
    	
    	
		return idUtilisateur2;	
    }
    
    public void addDemandeAssistance(int id,String motif,String type,String date,String heure){
    	String query = "insert into demandeassistance values(NULL,?,?,?,?,?)"; 
    	connection = connecter();
    	prep = null;
    	int i=-1;
    	try {
			prep=connection.prepareStatement(query);
			prep.setString(1, String.valueOf(id));
			prep.setString(2, type);
			prep.setString(3, motif);
			prep.setString(4, date);
			prep.setString(5, heure);
	    	i=prep.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
    
    public List<Document> getDocListMedical(int idPatient){
    	List<Document> docList = new ArrayList<Document>();
        String query = "Select * from document where id_patient="+idPatient+" and categorie_doc='Medical'";
    	//System.out.println(query);
        Connection connection = connecter();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()){
                Document doc = new Document();
                doc.setType_doc(rs.getString("Type_doc"));
                doc.setUrl(rs.getString("URL"));
                doc.setDate_depote(rs.getString("Dat_depote"));
                doc.setNom_doc(rs.getString("nom_doc"));
                docList.add(doc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return docList;    
    }
    
    public List<Produit> getPrdList(){
    	List<Produit> produitList = new ArrayList<Produit>();
        String query = "Select * from Produit";
    	//System.out.println(query);
        Connection connection = connecter();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()){
            	Produit produit = new Produit();
            	produit.setCodeProduit(rs.getString("Code_Produit"));
            	produit.setDesign(rs.getString("Designation"));
            	produitList.add(produit);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return produitList;    
    }
    
    public void supprimerPrevu(String idPrevu){
    	
    	String query =  "delete FROM patient_prevu where idPatientPrevu="+idPrevu ;
    	
    	connection = connecter();
    	
    	try {
            PreparedStatement st = connection.prepareStatement(query);
            st.executeUpdate();   
            } 
         catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public List<patientPrevu> getPatienPrevutList(){
    	List<patientPrevu> patientPrevuList = new ArrayList<patientPrevu>();
        String query = "Select * from patient_prevu";
        Connection connection = connecter();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()){
            	patientPrevu patient = new patientPrevu();
                patient.setNom(rs.getString("Nom_patient"));
                patient.setPrenom(rs.getString("Prenom_patient"));
                patient.setTel1(rs.getString("Telephone"));
                patient.setDateNai(rs.getString("Date_Naissance_patient"));
                patient.setWilaya(rs.getString("Wilaya"));
                patient.setHopital(rs.getString("Hopital"));
                patient.setIdPatientPrevu(Integer.parseInt(rs.getString("idPatientPrevu")));
                patientPrevuList.add(patient);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return patientPrevuList;    
    }
    
    public patientPrevu getPatientPrevu(int id){
    	String query = "select * from 	patient_prevu where idPatientPrevu="+id;
    	
    	connection = connecter();
    	patientPrevu patient=new patientPrevu();;
    	try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query); 
            rs.next();
            patient.setNom(rs.getString("Nom_patient"));
            patient.setPrenom(rs.getString("Prenom_patient"));
            patient.setTel1(rs.getString("Telephone"));
            patient.setDateNai(rs.getString("Date_Naissance_patient"));
            patient.setHopital(rs.getString("Hopital"));
            patient.setWilaya(rs.getString("Wilaya"));
            patient.setIdPatientPrevu(Integer.parseInt(rs.getString("idPatientPrevu")));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    	return patient;	
    }
    
    public List<FileAttente> getFileAttente(){
    	List<FileAttente> fileAttente = new ArrayList<FileAttente>();
    	String query = "select * from filattente where passer=0";
    	
    	
    	connection = connecter();
    	
    	try {
    		
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query); 
            while (rs.next()){
            FileAttente file=new FileAttente();;
            Patient patient= new Patient();
            patient = getPatient(Integer.parseInt(rs.getString("Patient")));
            file.setIdFile(Integer.parseInt(rs.getString("ID_Fil")));
            file.setNomPatientAttente(patient.getNom());
            file.setPrenomPatientAttente(patient.getPrenom());
            fileAttente.add(file);
            } 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    	for (int i = 0; i < fileAttente.size(); i++) {
			System.out.println(fileAttente.get(i).getIdFile());
		}
    	return fileAttente;	
    }
    
    public int getIdPatientPrevu(String nom, String prenom){
    	String query = "select idPatientPrevu from patient_prevu where Nom_patient = '"+nom+"' and Prenom_patient = '"+prenom+"'";
    	connection = connecter();
    	int id=-1;
    	try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query); 
            rs.next();
            id = Integer.parseInt(rs.getString("idPatientPrevu"));
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    	return id;
    }
    public void supprimerFile ( String idFile){
      	 String query ="UPDATE filattente SET Date = curdate(),heurePassage=curtime(),passer=1  WHERE ID_Fil="+idFile;
      	 
       	connection = connecter();  	
       	try {
               PreparedStatement st = connection.prepareStatement(query);
               st.executeUpdate(); 
               } 
            catch (SQLException e) {
               e.printStackTrace();
           }
      } 
       public void affecterListeAttente(String idPatient){
        	String query = "insert into filattente values(NULL,?,?,NULL,NULL)"; 
        	connection = connecter();
        	prep = null;
        	int i=-1;
        	try {
    			prep=connection.prepareStatement(query);
    			prep.setString(1, String.valueOf(idPatient));
    			prep.setString(2, "0");
    		
    	    	i=prep.executeUpdate();
    		} catch (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
        }
    public void updateExamen(Examen examen){
    	String query ="UPDATE examen SET quest1='"+examen.getQuest1()+"',quest2='"+examen.getQuest2()+"',"
    			+ "quest4='"+examen.getQuest4()+"',quest5='"+examen.getQuest5()+"',quest6='"+examen.getQuest6()+"',"
    					+ "quest3='"+examen.getQuest3()+"',quest7='"+examen.getQuest7()+"', "
    							+ "	Date_Examen = curdate(),Heure_Examen=curtime(),observations='"+examen.getObservations()+"'  WHERE ID_Examen="+examen.getID_Examen();
      	System.out.println(query);
    	connection = connecter();  	
    	try {
            PreparedStatement st = connection.prepareStatement(query);
            st.executeUpdate(); 
            } 
         catch (SQLException e) {
            e.printStackTrace();
        }
    }
}