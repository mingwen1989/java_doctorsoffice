import java.util.List;
import org.sql2o.*;

public class Doctor {
  private int id;
  private String first_name;
  private String last_name;
  private String specialty;

  public Doctor(String first_name, String last_name, String specialty) {
    this.first_name = first_name;
    this.last_name = last_name;
    this.specialty = specialty;
  }

  public String getFirstName() {
    return first_name;
  }

  public String getLastName() {
    return last_name;
  }

  public String getSpecialty() {
    return specialty;
  }

  public int getId() {
    return id;
  }

  public static List<Doctor> all() {
    String sql = "SELECT * FROM doctors ORDER BY last_name ASC";
    try(Connection con = DB.sql2o.open()) {
      return con.createQuery(sql).executeAndFetch(Doctor.class);
    }
  }
  public Integer countPatients() {
    String sql = "SELECT COUNT(doctorid) FROM patients WHERE doctorid =:id";
    try(Connection con = DB.sql2o.open()) {
      return con.createQuery(sql)
      .addParameter("id", this.id)
      .executeAndFetchFirst(Integer.class);
    }
  }

  public List<Patient> getPatients() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM patients where doctorid=:id";
      return con.createQuery(sql)
      .addParameter("id", this.id)
      .executeAndFetch(Patient.class);
    }
  }

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO doctors(first_name, last_name, specialty) VALUES (:first_name, :last_name, :specialty)";
      this.id = (int) con.createQuery(sql, true)
      .addParameter("first_name", this.first_name)
      .addParameter("last_name", this.last_name)
      .addParameter("specialty", this.specialty)
      .executeUpdate()
      .getKey();
    }
  }

  public static Doctor find(int id) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM doctors where id=:id";
      Doctor doctor = con.createQuery(sql)
      .addParameter("id", id)
      .executeAndFetchFirst(Doctor.class);
      return doctor;
    }
  }
}
