package controller;

import dto.TravelDescDTO;
import dto.TravelPlaceDTO;
import service.SummerTravelService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/summer/detail")
public class SummerDetailController extends HttpServlet {

    private SummerTravelService service = new SummerTravelService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int placeId = Integer.parseInt(request.getParameter("placeId"));

        TravelPlaceDTO place = service.getPlaceDetail(placeId);
        List<TravelDescDTO> descList = service.getPlaceDescriptions(placeId);

        request.setAttribute("place", place);
        request.setAttribute("descList", descList);

        RequestDispatcher rd =
                request.getRequestDispatcher("/WEB-INF/views/summer/summerDetail.jsp");
        rd.forward(request, response);
    }
}