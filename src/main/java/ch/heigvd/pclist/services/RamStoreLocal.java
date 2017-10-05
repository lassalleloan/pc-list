package ch.heigvd.pclist.services;

import ch.heigvd.pclist.models.Ram;

import javax.ejb.Local;
import java.util.List;

/**
 * @author Loan Lassalle (loan.lassalle@heig-vd.ch)
 * @author Jérémie Zanone (jeremie.zanone@heig-vd.ch)
 */
@Local
public interface RamStoreLocal {

    Ram getOne(long id);

    List<Ram> getAll();
}