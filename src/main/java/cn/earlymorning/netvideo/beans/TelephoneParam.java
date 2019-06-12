package cn.earlymorning.netvideo.beans;

/**
 * 手机号参数
 *
 * @author zpf
 * @create 2019-05-15-17:23
 */
public class TelephoneParam {

	private String telephone;

	public TelephoneParam(String telephone) {
		this.telephone = telephone;
	}

	public TelephoneParam() {
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	@Override
	public String toString() {
		return "TelephoneParam{" +
				"telephone='" + telephone + '\'' +
				'}';
	}
}
