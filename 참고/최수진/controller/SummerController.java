package controller;

import dto.TravelPlaceDTO;
import service.SummerTravelService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/summer")
public class SummerController extends HttpServlet {

    private SummerTravelService service = new SummerTravelService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 기본값 6월
        int month = 6;

        String monthParam = request.getParameter("month");
        if (monthParam != null) {
            month = Integer.parseInt(monthParam);
        }

        // 월별 여행지 목록
        List<TravelPlaceDTO> list = service.getSummerListByMonth(month);

        request.setAttribute("month", month);
        request.setAttribute("list", list);

        RequestDispatcher rd =
                request.getRequestDispatcher("/WEB-INF/views/summer/summer.jsp");
        rd.forward(request, response);
    }
}
