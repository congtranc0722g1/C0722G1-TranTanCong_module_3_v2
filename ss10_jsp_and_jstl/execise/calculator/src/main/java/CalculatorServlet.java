import java.io.IOException;

@javax.servlet.annotation.WebServlet(name = "CalculatorServlet", urlPatterns = {"/calculator"})
public class CalculatorServlet extends javax.servlet.http.HttpServlet {
    double result;

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        double firstNumber = Double.parseDouble(request.getParameter("first-number"));
        char operator = request.getParameter("operator").charAt(0);
        double secondNumber = Double.parseDouble(request.getParameter("second-number"));
        try {
            result = Calculator.calculate(firstNumber, operator, secondNumber);
        } catch (RuntimeException e) {
            request.setAttribute("exception", e.getMessage());
        }
        request.setAttribute("result", result);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
