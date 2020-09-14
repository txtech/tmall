package tmall.exception;

/**
 * @author Pepsi
 * @create 2020-03-09 19:40
 * @desc 钱包回调异常
 * @copyright vcgroup.cn
 */
public class QianbaoCallbackException extends Exception {

    private static final long serialVersionUID = 1709691248408767920L;

    public QianbaoCallbackException() {}

    public QianbaoCallbackException(String message) {
        super(message);
    }

    public QianbaoCallbackException(String message, Throwable cause) {
        super(message, cause);
    }
}
