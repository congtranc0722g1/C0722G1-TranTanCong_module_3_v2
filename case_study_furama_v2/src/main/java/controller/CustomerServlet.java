package controller;

import model.Customer;
import model.CustomerType;
import service.ICustomerService;
import service.ICustomerTypeService;
import service.impl.CustomerService;
import service.impl.CustomerTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customer"})
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();
    private ICustomerTypeService customerTypeService = new CustomerTypeService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                save(request, response);
                break;
            case "edit":
                update(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            default:
                showListcustomer(request, response);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean check = customerService.delete(id);
        String mess = " Xóa không thành công";
        if (check) {
            mess = "Xóa thành công";
        }
        request.setAttribute("mess", mess);
        showListcustomer(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int customerTypeId = Integer.parseInt(request.getParameter("customer-type-id"));
        String name = request.getParameter("name");
        LocalDate dateOfBirth = LocalDate.parse(request.getParameter("birthday"));
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("id-card");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(id, customerTypeId, name, dateOfBirth, gender, idCard, phone, email, address);
        boolean check = customerService.update(customer);
        String mess = " Chỉnh sửa không thành công";
        if (check) {
            mess = "Chỉnh sửa thành công";
        }
        request.setAttribute("mess", mess);
        List<CustomerType> customerTypeList = customerTypeService.finAll();
        request.setAttribute("customerTypeList", customerTypeList);
        Customer customers = customerService.findById(id);
        request.setAttribute("customer", customers);
        try {
            request.getRequestDispatcher("view/customer/edit.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int customerTypeId = Integer.parseInt(request.getParameter("customer-type-id"));
        String name = request.getParameter("name");
        LocalDate dateOfBirth = LocalDate.parse(request.getParameter("birthday"));
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String idCard = request.getParameter("id-card");
        String phone = request.getParameter("phone-number");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(id, customerTypeId, name, dateOfBirth, gender, idCard, phone, email, address);
        boolean check = customerService.add(customer);
        String mess = "Thêm mới không thành công";
        if (check) {
            mess = "Thêm mới thành công";
        }
        request.setAttribute("mess", mess);
        List<CustomerType> customerTypeList = customerTypeService.finAll();
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("/view/customer/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showFormcreate(request, response);
                break;
            case "edit":
                showFormedit(request, response);
                break;
            case "search":
                search(request, response);
                break;
            default:
                showListcustomer(request, response);
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String nameSearch = request.getParameter("name");
        String addressSearch = request.getParameter("address");
        List<Customer> customerList = customerService.search(nameSearch, addressSearch);
        request.setAttribute("customerList", customerList);
        List<CustomerType> customerTypeList = customerTypeService.finAll();
        request.setAttribute("customerTypeList", customerTypeList);
        request.setAttribute("nameSearch", nameSearch);
        request.setAttribute("addressSearch", addressSearch);
        try {
            request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormedit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        request.setAttribute("customer", customer);
        List<CustomerType> customerTypeList = customerTypeService.finAll();
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("view/customer/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormcreate(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = customerTypeService.finAll();
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("/view/customer/create.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showListcustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.findAll();
        request.setAttribute("customerList", customerList);
        List<CustomerType> customerTypeList = customerTypeService.finAll();
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("/view/customer/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
