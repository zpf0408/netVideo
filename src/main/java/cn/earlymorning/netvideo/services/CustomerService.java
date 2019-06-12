package cn.earlymorning.netvideo.services;

import cn.earlymorning.netvideo.beans.Customer;
import cn.earlymorning.netvideo.dao.CustomerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 63299
 */
@Service
public class CustomerService {

	@Autowired
	private CustomerMapper customerMapper = null;

	public Customer login(Customer c){
		Customer customer = customerMapper.login(c);

		return customer;
	}

	public Customer getCustomerByTelephone(String telephone){
		Customer customer = customerMapper.getCustomerByTelephone(telephone);

		return customer;
	}

	public Integer register(Customer customer){
		customerMapper.register(customer);
		return customer.getId();
	}

	public List<Customer> getCustomers(){
		List<Customer> customers = customerMapper.getCustomers();

		return customers;
	}

	public List<Customer> getCustomers(String customerName){
		List<Customer> customers = customerMapper.getCustomersByName(customerName);

		return customers;
	}

}
