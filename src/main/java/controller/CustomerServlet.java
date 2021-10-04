package controller;

import model.Customer;
import model.Login;
import model.Transfers;
import service.CustomerServiceImpl;
import service.ICustomerService;
import utils.CheckRegex;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customers")
public class CustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ICustomerService customerService;

    public void init() {
        customerService = new CustomerServiceImpl();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "login":
                    login(req, resp);
                    break;
                case "create":
                    insertCustomers(req, resp);
                    break;
                case "edit":
                    updateCustomers(req, resp);
                    break;
                case "delete":
                    deleteCustomers(req, resp);
                    break;
                case "deposits":
                    doDeposit(req, resp);
                    break;
                case "withdraws":
                    doWithdraw(req, resp);
                    break;
                case "transfer":
                    doTransfer(req, resp);
                    break;
//                default:
//                    login(req, resp);
//                    break;

                case "search":
                    searchCustomers(req, resp);

            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void login(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException, ServletException {
        Login login;
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        CustomerServiceImpl customerService = new CustomerServiceImpl();

        int existUser = customerService.doLogin(username, password);

        RequestDispatcher dispatcher = req.getRequestDispatcher("customer/loginForm.jsp");

        if (existUser == 0) {
            req.setAttribute("error", "Thong tin dang nhap khong dung");
            dispatcher.forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/customers");
        }

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "login":
                    showLoginForm(req, resp);
                    break;
                case "create":
                    showNewForm(req, resp);
                    break;
                case "edit":
                    showEditForm(req, resp);
                    break;
                case "delete":
                    formdeleteCustomers(resp, req);
                    break;
                case "deposits":
                    formDeposits(req, resp);
                    break;
                case "search":
                    formSearchCustomers(req, resp);
                case "withdraws":
                    formWithdraws(req, resp);
                    break;
                case "transfer":
                    formTransfers(req, resp);
                    break;

                default:
                    listCustomer(req, resp);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void searchCustomers(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        List<Customer> searchList = new ArrayList<>();
        CustomerServiceImpl customerService = new CustomerServiceImpl();
        String searhValue = req.getParameter("search");
        searchList = customerService.search(searhValue);
        req.setAttribute("searchList", searchList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("customer/showSearchList.jsp");
        dispatcher.forward(req, resp);
    }

    private void formSearchCustomers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("customer/showSearchList.jsp");
        requestDispatcher.forward(req, resp);
    }


    private void listCustomer(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException, ServletException {
        List<Customer> listCustomer = customerService.selectAllCustomers();
        req.setAttribute("listCustomer", listCustomer);
        RequestDispatcher dispatcher = req.getRequestDispatcher("customer/admin.jsp");
        dispatcher.forward(req, resp);
    }

    public void formdeleteCustomers(HttpServletResponse response, HttpServletRequest request) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("customer", customerService.selectCustomer(id));
        RequestDispatcher dis = request.getRequestDispatcher("customer/delete.jsp");
        dis.forward(request, response);
    }

    public void doDeposit(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String strbalance = request.getParameter("balance");
        Customer customer = customerService.selectCustomer(id);
        RequestDispatcher dispatcher = null;
        if (strbalance == "") {
            dispatcher = request.getRequestDispatcher("customer/deposit.jsp");
            request.setAttribute("customer", customerService.selectCustomer(id));
            request.setAttribute("error", "Please enter the money");
            request.setAttribute("success", null);
            formDeposits(request, response);
        } else if (!CheckRegex.isNumeric(strbalance)) {
            dispatcher = request.getRequestDispatcher("customer/deposit.jsp");
            request.setAttribute("customer", customerService.selectCustomer(id));
            request.setAttribute("error", "Error");
            request.setAttribute("success", null);
            formDeposits(request, response);
        } else {
            if (customer == null) {
                dispatcher = request.getRequestDispatcher("customer/404.jsp");
            } else {
                double balance = Double.parseDouble(strbalance);
                if (balance < 50.d || balance > 1000000.d) {
                    request.setAttribute("customer", customerService.selectCustomer(id));
                    request.setAttribute("error", "Min money is 50 and Max is 1000000");
                    request.setAttribute("success", null);
                    formDeposits(request, response);
                } else {
                    customerService.deposits(id, balance);
                    request.setAttribute("customer", customerService.selectCustomer(id));
                    request.setAttribute("success", "succesfull transaction");
                    request.setAttribute("error", null);
                    formDeposits(request, response);
                }
            }
        }

    }

    private void formDeposits(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(req.getParameter("id"));
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("customer/deposit.jsp");
        req.setAttribute("customer", customerService.selectCustomer(id));
        requestDispatcher.forward(req, resp);
    }

    private void doWithdraw(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(req.getParameter("id"));
        String strbalance = req.getParameter("balance");
        Customer customer = customerService.selectCustomer(id);
        RequestDispatcher dispatcher = null;
        if (strbalance == "") {
            dispatcher = req.getRequestDispatcher("customer/withdraw.jsp");
            req.setAttribute("customer", customerService.selectCustomer(id));
            req.setAttribute("error", "Please enter the money");
            req.setAttribute("success", null);
            formWithdraws(req, resp);
        } else if (!CheckRegex.isNumeric(strbalance)) {
            dispatcher = req.getRequestDispatcher("customer/withdraw.jsp");
            req.setAttribute("customer", customerService.selectCustomer(id));
            req.setAttribute("error", "Error");
            req.setAttribute("success", null);
            formWithdraws(req, resp);

        } else {
            if (customer == null) {
                dispatcher = req.getRequestDispatcher("customer/404.jsp");
            } else {
                double balance = Double.parseDouble(strbalance);
                if (balance <= 1.d || balance > 10000.d) {
                    req.setAttribute("customer", customerService.selectCustomer(id));
                    req.setAttribute("error", "Min money is 1 and Max is 10000");
                    req.setAttribute("success", null);
                    formWithdraws(req, resp);
                } else {
                    customerService.withdraws(id, balance);
                    req.setAttribute("customer", customerService.selectCustomer(id));
                    req.setAttribute("success", "succesfull transaction");
                    req.setAttribute("error", null);
                    formWithdraws(req, resp);
                }
            }

        }

    }

    private void formWithdraws(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/withdraw.jsp");
        request.setAttribute("customer", customerService.selectCustomer(id));
        requestDispatcher.forward(request, response);
    }

    private void doTransfer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        int depoId = Integer.parseInt(req.getParameter("depoId"));
        double balance = Double.parseDouble(req.getParameter("balance"));
        int withId = Integer.parseInt(req.getParameter("withId"));
        CustomerServiceImpl customerService = new CustomerServiceImpl();
        customerService.transfers(depoId, balance, withId);
        req.setAttribute("customer", customerService.selectCustomer(depoId));
        RequestDispatcher dispatcher = req.getRequestDispatcher("customer/transfer.jsp");
        dispatcher.forward(req, resp);


    }

    private void formTransfers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(req.getParameter("id"));
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("customer/transfer.jsp");
        Customer customer = new Customer();
        customer = customerService.selectCustomer(id);
        req.setAttribute("customer", customer);
        requestDispatcher.forward(req, resp);
    }

    private void deleteCustomers(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException, ServletException {
       List<Transfers> transfersList = customerService.selectAllTransfer();
        int id = Integer.parseInt(req.getParameter("id"));
        boolean check = true;
       for(Transfers transfers: transfersList){
           if(transfers.getDepoId() == id || transfers.getDepoId() == id){
               check = false;
               break;
           }
       }
        if(check){
            customerService.deleteCustomer(id);
            resp.sendRedirect("/customers");
        }else {
            resp.sendRedirect("/customers");
        }


    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(req.getParameter("id"));
        Customer existingCustomer = customerService.selectCustomer(id);
        if (existingCustomer != null) {
            RequestDispatcher dispatcher = req.getRequestDispatcher("customer/edit.jsp");
            req.setAttribute("customer", existingCustomer);
            dispatcher.forward(req, resp);

        } else {
            RequestDispatcher dispatcher = req.getRequestDispatcher("customer/404.jsp");
            dispatcher.forward(req, resp);
        }

    }

    private void showLoginForm(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException, ServletException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("customer/loginForm.jsp");
        dispatcher.forward(req, resp);
    }

    private void showNewForm(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException, ServletException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("customer/create.jsp");
        dispatcher.forward(req, resp);
    }


    private void insertCustomers(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException, ServletException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        if (name == "" || email == "" || phone == "" || address == "") {
            RequestDispatcher dispatcher = req.getRequestDispatcher("customer/create.jsp");
            req.setAttribute("error", "Invalid Values");
            req.setAttribute("success", null);
            dispatcher.forward(req, resp);
        } else {
            if(CheckRegex.validateName(name) && CheckRegex.validateMail(email) && CheckRegex.validatePhone(phone)){
                Customer newCustomer = new Customer(name, email, phone, address);
                customerService.insertCustomer(newCustomer);
                req.setAttribute("error", null);
                req.setAttribute("success", "Create Customer successfully");
                showNewForm(req, resp);
            }else {
                req.setAttribute("error", "error, please enter correct syntax");
                req.setAttribute("success", null);
                showNewForm(req, resp);
            }

        }
    }

    private void updateCustomers(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        if (name == "" || email == "" || phone == "" || address == "") {
            RequestDispatcher dispatcher = req.getRequestDispatcher("customer/edit.jsp");
            req.setAttribute("customer",customerService.selectCustomer(id));
            req.setAttribute("error", "Invalid Values. Please enter full information");
            req.setAttribute("success", null);
//            dispatcher.forward(req, resp);
            showEditForm(req,resp);
        } else {
            Customer newCustomer = new Customer(id, name, email, phone, address);
            boolean updateSuccess = customerService.updateCustomer(newCustomer);

            if (updateSuccess) {
                req.setAttribute("customer",customerService.selectCustomer(id));
                req.setAttribute("error", null);
                req.setAttribute("success", "Update Customer succsessfully");
            } else {
                req.setAttribute("customer",customerService.selectCustomer(id));
                req.setAttribute("error", "Invalid Values. Please check data information again");
                req.setAttribute("success", null);
            }
            showEditForm(req,resp);
        }
    }
}