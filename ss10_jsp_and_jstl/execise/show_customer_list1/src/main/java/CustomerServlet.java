import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customer"})
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer("Hiếu", "19/12/1988", "Quảng Nam", "https://i.pinimg.com/236x/62/ee/a8/62eea8996641733c2a071b98da328364--seul-lips.jpg"));
        customerList.add(new Customer("Nga", "20/12/1988", "Quảng Ngãi", "https://znews-photo.zingcdn.me/w660/Uploaded/kbd_pilk/2022_09_22/vuong_hieu_than8.jpg"));
        customerList.add(new Customer("Tâm", "21/12/1988", "Quảng Bình", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6k2Le5fcBTGjfPIOp6qpgA2_fmurKC5LF8A&usqp=CAU"));
        customerList.add(new Customer("Tuyết", "22/12/1988", "Quảng Trị", "https://ichef.bbci.co.uk/news/640/cpsprodpb/D26F/production/_104017835_64f31ae3-200d-48f5-aa98-cb80ac0df5bc.jpg"));
        customerList.add(new Customer("Hào", "23/12/1988", "Quảng Ninh", "https://staticgthn.kinhtedothi.vn/uploaded/vantronggthn/2019_09_06/anh-ta-ton-1567702842-width1000height728_nsmw.jpg"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("customer/list.jsp").forward(request, response);
    }
}
