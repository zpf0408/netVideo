package cn.earlymorning.netvideo.controller;

import cn.earlymorning.netvideo.api.JuheDemo;
import cn.earlymorning.netvideo.beans.*;
import cn.earlymorning.netvideo.services.CourseTypeService;
import cn.earlymorning.netvideo.services.CustomerService;
import cn.earlymorning.netvideo.units.JavaBase64;
import cn.earlymorning.netvideo.units.RandomUtils;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author 63299
 * @create 2019-05-13
 */
@Controller("customerController")
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService = null;

    @Autowired
    private CourseTypeService courseTypeService;

	@RequestMapping("/login")
	public ModelAndView login(
							  @RequestParam Map<String,String> map,
                              @RequestParam(value = "remember",required = false) String remember ,HttpSession session, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		if(map!=null){
            String username = map.get("username");
            String password = map.get("password");

            if(username==null&&password==null&&remember==null||("".equals(username.trim())&&"".equals(password.trim())&&"".equals(remember.trim()))){
                mv.setViewName("/customer/login");
            }else{
                Customer customer = new Customer();
                customer.setTelephone(username);
                customer.setPassword(JavaBase64.baseEncode(password));
                Customer c = customerService.login(customer);

                if(c== null){
                    mv.addObject("error","用户名或密码错误");
                    mv.addObject("userName",username);
                    mv.setViewName("/customer/login");
                }else{
                    session.setAttribute("customer",c);
                    session.setMaxInactiveInterval(3600*2);
                    mv.setViewName("redirect:/course/index");
                }
                //cookies自动登录
                if(remember!=null&&!remember.trim().equals("")){
                    Cookie sessionId = new Cookie("JSESESSIONID",session.getId());
                    sessionId.setMaxAge(2*60);
                    sessionId.setPath("/");
                    response.addCookie(sessionId);

                }

            }
        }else{
		    mv.setViewName("/customer/login");
        }



		return mv;
	}


	@ResponseBody
	@RequestMapping(value = "/getCustomerByTelephone",method = RequestMethod.POST)
	public Integer getCustomerByTelephone(@RequestBody String telephone){

		TelephoneParam telephoneParam = JSONObject.parseObject(telephone, TelephoneParam.class);
		Customer c = customerService.getCustomerByTelephone(telephoneParam.getTelephone());
		if(c==null){
			return 0;
		}
		return 1;
	}

    /**
     * 用户注册
     * @param map
     * @param codeParam
     * @return
     */
	@RequestMapping(value = "/register")
	public ModelAndView register(@RequestParam Map<String ,String> map,
								 @SessionAttribute(value = "codeParam",required = false) CodeParam codeParam,HttpSession session){
		ModelAndView mv = new ModelAndView();
		if(map!=null){
            String telephone = map.get("idNumber");
            String name = map.get("username");
            String password = map.get("password");
            String captcha = map.get("captcha");
            if(telephone==null&&name==null&&password==null&&captcha==null||("".equals(telephone.trim())&&"".equals(name.trim())&&"".equals(password.trim())&&"".equals(captcha.trim()))){
                mv.setViewName("/customer/register");

            }else{
                if(codeParam!=null){
                    if(!codeParam.getTelephone().trim().equals(telephone.trim())){
                        mv.addObject("telephone",telephone);
                        mv.addObject("username",name);
                        mv.addObject("error","手机号有误！");
                        mv.setViewName("/customer/register");
                    }else{
                        if(!captcha.equals(codeParam.getCode())){
                            mv.addObject("telephone",telephone);
                            mv.addObject("username",name);
                            mv.addObject("error","验证码错误！");
                            mv.setViewName("/customer/register");
                        }else{
                            Customer customer = new Customer();
                            customer.setTelephone(telephone);
                            customer.setName(name);
                            customer.setHeadUrl("defaulthead.jpg");
                            Timestamp createDate = new Timestamp((new Date()).getTime());
                            customer.setCreateDate(createDate);
                            customer.setPassword(JavaBase64.baseEncode(password));
                            customerService.register(customer);

                            if(customer.getId()>0){

                                mv.setViewName("redirect:/customer/registerSuccess");
                            }else{
                                mv.addObject("telephone",telephone);
                                mv.addObject("username",name);
                                mv.addObject("error","注册用户失败！");
                                mv.setViewName("/customer/register");
                            }
                        }
                    }
                }else{
                    mv.addObject("telephone",telephone);
                    mv.addObject("username",name);
                    mv.addObject("error","手机没验证！！");
                    mv.setViewName("/customer/register");
                }

            }
        }else{
            mv.setViewName("/customer/register");
        }
		//删除session中验证码
        session.removeAttribute("codeParam");
		return mv;
	}

    /**
     * 验证码生成
     * @param telephoneParam
     * @param session
     * @return
     */
	@ResponseBody
	@RequestMapping("/generateNote")
	public MessageResult generateNote(@RequestBody TelephoneParam telephoneParam, HttpSession session){
		MessageResult messageResult = new MessageResult();
		Integer code = RandomUtils.numberRandom();
		String result = null;
		try{
			result = JuheDemo.getRequest2(String.valueOf(code),telephoneParam.getTelephone());
			net.sf.json.JSONObject object = net.sf.json.JSONObject.fromObject(result);
			if(object.getInt("error_code")==0){
                CodeParam codeParam = new CodeParam(telephoneParam.getTelephone(),String.valueOf(code));
				session.setAttribute("codeParam",codeParam);
				messageResult.setCode(String.valueOf(object.get("error_code")));
				messageResult.setStatus(true);
				messageResult.setMessage(String.valueOf(object.get("reason")));
			}else{
				messageResult.setCode(String.valueOf(object.get("error_code")));
				messageResult.setStatus(false);
				messageResult.setMessage(String.valueOf(object.get("reason")));
			}
		}catch (Exception e){
			e.printStackTrace();
		}

		return messageResult;
	}

	@RequestMapping(value = "/retrievePwd")
	public ModelAndView retrievePwd(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/customer/retrievePwd");
		return mv;
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		session.invalidate();
		mv.setViewName("redirect:/course/index");
		return mv;
	}

	@RequestMapping("/personInfo")
	public ModelAndView personInfo(@RequestParam(value = "customer",required = false) Customer customer){
	    ModelAndView mv = new ModelAndView();
	    if(customer==null){

        }
	    List<CourseType> courseTypes = courseTypeService.getAlls();
	    mv.addObject("courseTypes",courseTypes);

	    mv.setViewName("/customer/personInfo");
	    return mv;
    }

    @RequestMapping("/updPassword")
    public ModelAndView updPassword(@RequestParam(value = "password" , required = false) String password,@RequestParam(value = "npassword" , required = false) String npassword,
                                    @SessionAttribute("customer") Customer customer){
	    ModelAndView mv = new ModelAndView();
	    if(customer==null){
	        mv.setViewName("redirect:/customer/logout");
        }else{
            if(password==null&&npassword==null||"".equals(password)&&"".equals(npassword)){

                mv.setViewName("/customer/updPassword");
            }else{
                String basePwd = JavaBase64.baseEncode(password);
                if(basePwd.equals(customer.getPassword())){
                    customer.setPassword(basePwd);
                    Integer i = customerService.updCustomer(customer);
                    if(i>0){
                        mv.setViewName("/customer/updPwdSuccess");
                    }else{
                        mv.addObject("error","修改密码错误");
                        mv.setViewName("/customer/updPassword");
                    }
                }
            }
        }
        List<CourseType> courseTypes = courseTypeService.getAlls();
        mv.addObject("courseTypes",courseTypes);

	    return mv;
    }

    @RequestMapping(value = "/updCustomer",method = RequestMethod.POST)
	public ModelAndView updCustomer(@RequestParam("customer") Map<String,Object> customer){
		ModelAndView mv = new ModelAndView();

		return mv;
	}

	@RequestMapping("/registerSuccess")
	public ModelAndView reqSuccess(){
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("/customer/registerSuccess");
	    return mv;
    }

    /**
     * 用户列表
     * @param customerName
     * @param page
     * @return
     */
	@RequestMapping(value = "/getCustomers")
	public ModelAndView getCustomers(@RequestParam(value = "customerName",required = false) String customerName,@RequestParam(value = "page",required = false) String page){
	    ModelAndView mv = new ModelAndView();

        Integer limit = 12;

        Integer curPage = 1;
        if(page!=null&&!page.trim().equals("")){
            curPage = Integer.parseInt(page.trim())>0?Integer.parseInt(page.trim()):1;
        }
        Page<Object> page1 = PageHelper.startPage(curPage,limit);
        List<Customer> customers = customerService.getCustomers(customerName);

        //总页数
        int pages = page1.getPages();
        if(curPage>pages){
            curPage = pages;
        }
        //获取当前页
        int cur = page1.getPageNum();
        //总个数
        long total = page1.getTotal();
        RowBounds rowBounds = new RowBounds(cur,pages,total,limit);

        mv.addObject("customers",customers);
        mv.addObject("rowBounds",rowBounds);

	    mv.setViewName("/customer/customer_list");

	    return mv;
    }

    @RequestMapping("/updCustomer")
    public ModelAndView updCustomer(){
	    ModelAndView mv = new ModelAndView();

	    return mv;
    }
}
