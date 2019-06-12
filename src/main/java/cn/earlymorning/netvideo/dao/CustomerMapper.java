package cn.earlymorning.netvideo.dao;

import cn.earlymorning.netvideo.beans.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 63299
 * @create 2019-05-12
 */
public interface CustomerMapper {

	public Customer login(Customer customer);

	public Integer register(@Param("customer") Customer customer);

	public Customer getCustomerById(@Param("id") String id);

	public List<Customer> getCustomers();

	public List<Customer> getCustomersByName(@Param("customerName") String customerName);

	public Integer updCustomer(Customer customer);

	public Integer delCustomer(@Param("id") String id);

	public Customer getCustomerByTelephone(@Param("telephone") String telephone);


}
