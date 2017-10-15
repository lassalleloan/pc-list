package ch.heigvd.pclist.services.business;

import javax.ejb.Local;
import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * @author Loan Lassalle (loan.lassalle@heig-vd.ch)
 * @author Jérémie Zanone (jeremie.zanone@heig-vd.ch)
 * @since 13.09.2017
 */
@Local
public interface ProductServiceLocal {

    List<String> PRODUCT_LIST = Arrays.asList("pc", "cpu", "ram", "gpu");

    void generate(HttpServletRequest req);

    long count(String product);

    Map<String, Object> get(String product, long id);

    Map<String, Object> get(String product, long pageSize, long pageIndex);

    Map<String, Object> getBrand(String product);

    Map<String, Object> getComponent(String product);

    void create(HttpServletRequest req);

    void update(HttpServletRequest req);

    void delete(HttpServletRequest req);
}
