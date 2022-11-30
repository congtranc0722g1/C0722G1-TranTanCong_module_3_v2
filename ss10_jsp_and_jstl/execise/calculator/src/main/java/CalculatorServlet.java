import java.io.IOException;

@javax.servlet.annotation.WebServlet(name = "CalculatorServlet", urlPatterns = {"/calculator"})
public class CalculatorServlet extends javax.servlet.http.HttpServlet {
    double result;

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        double num1 = Double.parseDouble(request.getParameter("number1"));
        char operator = request.getParameter("operator").charAt(0);
        double num2 = Double.parseDouble(request.getParameter("number2"));
        try {
            result = Calculator.calculate(num1, operator, num2);
        } catch (RuntimeException e) {
            request.setAttribute("exception", e.getMessage());
        }
        request.setAttribute("result", result);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
