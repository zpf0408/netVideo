package cn.earlymorning.netvideo.beans;

/**
 * @author zpf
 * @create 2019-05-29-21:41
 */
public class CodeParam {

    private String telephone;
    private String code;

    public CodeParam(String telephone, String code) {
        this.telephone = telephone;
        this.code = code;
    }

    public CodeParam() {
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
