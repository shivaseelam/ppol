package org.oz.sppol.dao.customerdao;

import org.oz.sppol.bo.customer.CustomerBO;
import org.oz.sppol.dto.customerdto.CustomerDTO;

import java.util.List;
import java.util.Map;

/**
 * Created by shiva9 on 2/7/2017.
 */
public interface CustomerDAO {

    public List<CustomerBO> getAllCustomerDetails();
    public CustomerBO getCustomerDetail(int customerId);
    public boolean updateCustomerDetail(CustomerDTO customerDTO);
    public int insertCustomerDetail(CustomerBO customerBO);
    public boolean deleteCustomerDetail(int customerId);

}
