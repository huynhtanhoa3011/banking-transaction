package service;

import model.Customer;
import model.Login;
import model.Transfers;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerService {
    public void insertCustomer (Customer customer) throws SQLException;

    public Customer selectCustomer(int id) throws SQLException;

    public List<Customer>selectAllCustomers() throws SQLException;

    public List<Transfers>selectAllTransfer() throws SQLException;

    public boolean deleteCustomer(int id) throws SQLException;

    public boolean updateCustomer(Customer customer) throws SQLException;

    public List <Customer> search (String valueSearch) throws SQLException;

    public void deposits (int id, double balance) throws SQLException;

    public void withdraws (int id, double balance) throws SQLException;

    public boolean transfers (int depoId, double balance, int withId) throws SQLException;

    public Login logins(String username) throws SQLException;

    public int doLogin(String username, String password) throws SQLException;


}
