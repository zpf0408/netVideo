package cn.earlymorning.netvideo.beans;

/**
 * @author zpf
 * @create 2019-05-24-14:39
 */
public class MessageResult<T> {
    private String code;
    private boolean status;
    private String message;
    private T data;

    public MessageResult(String code, boolean status, String message, T data) {
        this.code = code;
        this.status = status;
        this.message = message;
        this.data = data;
    }

    public MessageResult() {
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
