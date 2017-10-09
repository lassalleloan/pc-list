package ch.heigvd.pclist.web.controllers;

import ch.heigvd.pclist.services.business.FactoryServiceLocal;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Loan Lassalle (loan.lassalle@heig-vd.ch)
 * @author Jérémie Zanone (jeremie.zanone@heig-vd.ch)
 */
public class ListServlet extends HttpServlet {

    @EJB
    private FactoryServiceLocal factoryService;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String product = req.getParameter("product");
        String action = req.getParameter("action");
        String rowsAffectedString = req.getParameter("rowsAffected");

        product = product != null && Arrays.asList("pc", "cpu", "ram", "gpu").contains(product) ? product : null;
        action = action != null && Arrays.asList("created", "edited", "deleted").contains(action) ? action : null;
        long rowsAffected = rowsAffectedString != null ? Long.valueOf(rowsAffectedString) : 0;

        boolean isAllList = product == null;
        String pageTitle = "";
        Map<String, Object> objectMap = new HashMap<>();

        if (isAllList || product.equals("pc")) {
            pageTitle = "PC";
            objectMap.put("pcList", factoryService.getPc());
        }

        if (isAllList || product.equals("cpu")) {
            pageTitle = "Processor";
            objectMap.put("cpuList", factoryService.getCpu());
        }

        if (isAllList || product.equals("ram")) {
            pageTitle = "Memory";
            objectMap.put("ramList", factoryService.getRam());
        }

        if (isAllList || product.equals("gpu")) {
            pageTitle = "Graphic";
            objectMap.put("gpuList", factoryService.getGpu());
        }

        if (isAllList) {
            pageTitle = "All";
        }

        req.setAttribute("pageTitle", pageTitle);
        req.setAttribute("allList", isAllList);

        if (rowsAffected > 0) {
            req.setAttribute("product", pageTitle);
            req.setAttribute("action", action);
            req.setAttribute("rowsAffected", rowsAffected);
        }

        for (Map.Entry<String, Object> entry : objectMap.entrySet()) {
            req.setAttribute(entry.getKey(), entry.getValue());
        }

        req.getRequestDispatcher("WEB-INF/pages/list.jsp").forward(req, resp);
    }
}
