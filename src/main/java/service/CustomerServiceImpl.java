package service;

import model.Customer;
import model.Login;
import model.Transfers;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerServiceImpl implements ICustomerService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/bankingmanager";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123123";

    public CustomerServiceImpl() {
    }

    protected Connection connection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }


    public void insertCustomer(Customer customer) throws SQLException {
        String INSERT_CUSTOMERS_SQL = "INSERT INTO customers" + "(name, email, phone, address)VALUES" + "(?, ?, ?, ?);";
        Connection connection = connection();
        System.out.println(INSERT_CUSTOMERS_SQL);
        try (
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMERS_SQL)) {
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getEmail());
            preparedStatement.setString(3, customer.getPhone());
            preparedStatement.setString(4, customer.getAddress());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }


    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }


    public Customer selectCustomer(int id) throws SQLException {
        String SELECT_CUSTOMER_BY_ID = "select id, name, email, phone, address, balance from customers where id = ?";
        Customer customer = null;
        try (Connection connection = connection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                Double balance = resultSet.getDouble("balance");

                customer = new Customer(id, name, email, phone, address, balance);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customer;
    }


    public List<Customer> selectAllCustomers() throws SQLException {
        String SELECT_ALL_CUSTOMERS = "select * from customers";
        List<Customer> customers = new ArrayList<>();
        try (Connection connection = connection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMERS);) {
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                Double balance = resultSet.getDouble("balance");
                customers.add(new Customer(id, name, email, phone, address, balance));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customers;
    }


    public boolean deleteCustomer(int id) throws SQLException {
        String DELETE_CUSTOMER_SQL = "delete from customers where id = ?;";
        boolean rowDelete;
        try (Connection connection = connection(); PreparedStatement statement = connection.prepareStatement(DELETE_CUSTOMER_SQL)) {
            statement.setInt(1, id);
            rowDelete = statement.executeUpdate() > 0;
        }
        return rowDelete;
    }


    public boolean updateCustomer(Customer customer) throws SQLException {
        String UPDATE_CUSTOMER_SQL = "update customers set name = ?, email = ?, phone = ?, address = ? where id = ?;";
        boolean rowUpdate = false;
        try (Connection connection = connection(); PreparedStatement statement = connection.prepareStatement(UPDATE_CUSTOMER_SQL)) {
            statement.setString(1, customer.getName());
            statement.setString(2, customer.getEmail());
            statement.setString(3, customer.getPhone());
            statement.setString(4, customer.getAddress());
            statement.setInt(5, customer.getId());
            statement.executeUpdate();

            rowUpdate = true;
        } catch (SQLException ex) {
            printSQLException(ex);
        }
        return rowUpdate;
    }


    public List<Customer> search(String valueSearch) throws SQLException {
        String SEARCH_ALL_CUSTOMER = "SELECT * FROM customers WHERE name LIKE ? OR address LIKE ?  ";
        List <Customer> searchList = new ArrayList<>();
        try (Connection connection = connection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_ALL_CUSTOMER)) {
            String sql = "%" + valueSearch + "%";
            preparedStatement.setString(1,sql);
            preparedStatement.setString(2,sql);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                Double balance = rs.getDouble("balance");
                searchList.add(new Customer(id, name, email, phone, address, balance));
            }
        }
        catch (SQLException throwables)
        {
            throwables.printStackTrace();
        }
        return searchList;
    }


    public void deposits(int id, double balance) throws SQLException {
        String DEPOSITS = "call sp_deposit (?,?)";
        try (Connection connection = connection(); PreparedStatement preparedStatement = connection.prepareStatement(DEPOSITS)){
            System.out.println(preparedStatement);
            preparedStatement.setInt(1, id);
            preparedStatement.setDouble(2, balance);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }


    public void withdraws(int id, double balance) throws SQLException {
        String WITHDRAWS = "call sp_withdraw (?,?)";
        try (Connection connection = connection(); PreparedStatement preparedStatement = connection.prepareStatement(WITHDRAWS)){
            System.out.println(preparedStatement);
            preparedStatement.setInt(1, id);
            preparedStatement.setDouble(2, balance);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }


    public List<Transfers> selectAllTransfer() throws SQLException {
        String SELECT_ALL_TRANSFERS = "select * from transfers";
        List<Transfers> transfersList  = new ArrayList<>();
        try (Connection connection = connection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TRANSFERS);) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                Double money = resultSet.getDouble("money");
                Double fee = resultSet.getDouble("fee");
                int depoId = resultSet.getInt("depoId");
                int withId = resultSet.getInt("withId");
                Date fullday = resultSet.getDate("fullday");
                transfersList.add(new Transfers(id, money, fee, depoId, withId, fullday));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return transfersList;
    }


    public boolean transfers(int depoId, double balance, int withId) throws SQLException {
        String TRANSFERS = "call sp_transfer (?,?,?)";
        boolean check = false;
        Connection connection = connection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(TRANSFERS);
            System.out.println(preparedStatement);
            preparedStatement.setInt(1, depoId);
            preparedStatement.setDouble(2, balance);
            preparedStatement.setInt(3, withId);
            preparedStatement.executeUpdate();
            check = true;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return check;
    }

    @Override
    public Login logins(String name) throws SQLException {
        Login login = null;
        String LOG_IN = "SELECT * FROM logins WHERE username = ? ";
        Connection connection = connection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(LOG_IN);
            preparedStatement.setString(1,name);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

                String username = rs.getString("username");
                String password = rs.getString("password");
                login = new Login(username,password);

        } catch (SQLException e) {
            printSQLException(e);
        }
        return login;
    }

    @Override
    public int doLogin(String username, String password) throws SQLException {
        String LOG_IN = "SELECT * FROM logins WHERE username = ? AND password = ?";
        int exitsUser = 0;
        try {
            Connection connection = connection();
            PreparedStatement preparedStatement = connection.prepareStatement(LOG_IN);
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,password);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                exitsUser = 1;
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return exitsUser;
    }
}
