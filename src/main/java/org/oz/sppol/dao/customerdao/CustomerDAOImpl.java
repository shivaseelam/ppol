 package org.oz.sppol.dao.customerdao;

import org.oz.sppol.bo.customer.CustomerBO;
import org.oz.sppol.dto.customerdto.CustomerDTO;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by shiva9 on 2/7/2017.
 */
public class CustomerDAOImpl  extends  JdbcDaoSupport implements CustomerDAO {

    private static final String GET_ALL_CUSTOMERS= "SELECT CUSTOMER_ID,FIRST_NAME,LAST_NAME FROM   SLS_CUSTOMER WHERE ACTIVE_STATUS='Y'  ; ";
    private static final String GET_CUSTOMER_ID= "SELECT * FROM SLS_CUSTOMER WHERE   ACTIVE_STATUS='Y' AND CUSTOMER_ID = ?";
    private static final String DELETE_CUSTOMER= "UPDATE SLS_CUSTOMER SET ACTIVE_STATUS='Y' WHERE CUSTOMER_ID = ?";

    /*private JdbcTemplate jt;

    public void setJt(JdbcTemplate jt) {
        this.jt = jt;
    }
*/

    @Override
    public List<CustomerBO> getAllCustomerDetails() {


        /*List<CustomerBO> customerBOs = getJdbcTemplate().query("SELECT * FROM SLS_CUSTOMER",new BeanPropertyRowMapper<CustomerBO>(CustomerBO.class));
        System.out.print(customerBOs);*/

        List<CustomerBO> customers = new ArrayList<CustomerBO>();
        List<Map<String, Object>> customerBOs =getJdbcTemplate().queryForList(GET_ALL_CUSTOMERS);
        for(Map row: customerBOs)
        {
            CustomerBO customerBO = new CustomerBO();
            customerBO.set_customerId((Integer)row.get("CUSTOMER_ID"));
            customerBO.set_firstName((String) row.get("FIRST_NAME"));
            customerBO.set_lastName((String)row.get("LAST_NAME"));
            customers.add(customerBO);
        }
        return  customers;
    }

    private List<CustomerBO> getCustomerBOs(List<CustomerBO> customers,String sql,int customerID) {

        List<Map<String, Object>> customerBOs =getJdbcTemplate().queryForList(sql,customerID);
        for(Map row: customerBOs)
        {
            CustomerBO customerBO = new CustomerBO();
            customerBO.set_customerId((Integer)row.get("CUSTOMER_ID"));
            customerBO.set_firstName((String) row.get("FIRST_NAME"));
            customerBO.set_lastName((String)row.get("LAST_NAME"));
            customers.add(customerBO);
        }
        return  customers;
    }

    @Override
    public CustomerBO getCustomerDetail(int customerId) {

        List<CustomerBO> customer = new ArrayList<CustomerBO>();
         customer = getCustomerBOs(customer,GET_CUSTOMER_ID,customerId);
        return customer.get(0);
    }

    @Override
    public boolean updateCustomerDetail(CustomerDTO customerDTO) {

        String updateSql = "UPDATE SLS_CUSTOMER SET  FIRST_NAME='"+customerDTO.getfirstName()+"'  WHERE ACTIVE_STATUS='Y' AND CUSTOMER_ID="+customerDTO.getcustomerId();
        Object[] params = { customerDTO.getfirstName(),customerDTO.getcustomerId()};
       int bMsg = getJdbcTemplate().update(updateSql);
        boolean bSuccess =false;
        if(bMsg>0)
        {
            bSuccess = true;
        }

        return bSuccess;
    }

    @Override
    public int insertCustomerDetail(CustomerBO customerBO) {
        return 0;
    }

    @Override
    public boolean deleteCustomerDetail(int customerId) {



        return false;
    }





}
