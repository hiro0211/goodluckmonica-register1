/**
 * jp.co.flm.market.web.CommonAction
 *
 * All Rights Reserved, Copyright Fujitsu Learning Media Limited
 */
package jp.co.flm.market.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 * トップ画面へ遷移するアクションクラスです。
 *
 * @author FLM
 * @version 1.0 YYYY/MM/DD
 */
public class CommonAction implements ActionIF{

    /**
     * アクションを実行する。
     *
     * @param req
     *            HttpServletRequest
     * @return 次画面のJSP名
     */
    public String execute(HttpServletRequest req) {
        // 会員登録のセッションを削除する
        HttpSession session = req.getSession(false);
        session.removeAttribute("registerMember");

        String page = "top-view.jsp";

        return page;
    }

}
