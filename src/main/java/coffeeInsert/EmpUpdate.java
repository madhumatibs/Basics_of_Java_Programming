package coffeeInsert;

import java.sql.*;
import java.util.Scanner;

public class EmpUpdate {
    public static void main(String[] args) {
        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/Employee", "root", "MADHU@2005");

            Scanner sc = new Scanner(System.in);

            System.out.print("Enter Emp No to update: ");
            int eno = sc.nextInt();
            sc.nextLine();

            System.out.print("Enter new Name: ");
            String name = sc.nextLine();

            System.out.print("Enter new Salary: ");
            int salary = sc.nextInt();

            PreparedStatement ps = con.prepareStatement(
                    "UPDATE Emp SET Emp_Name=?, Basicsalary=? WHERE Emp_NO=?");

            ps.setString(1, name);
            ps.setInt(2, salary);
            ps.setInt(3, eno);

            ps.executeUpdate();

            System.out.println("Employee Updated Successfully!");

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}