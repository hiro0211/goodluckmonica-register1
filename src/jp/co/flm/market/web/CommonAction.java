/**
 * jp.co.flm.market.web.CommonAction
 *
 * All Rights Reserved, Copyright Fujitsu Learning Media Limited
 */
package jp.co.flm.market.web;

import javax.servlet.http.HttpServletRequest;

/**
 * トップ画面へ遷移するアクションクラスです。
 *
 * @author FLM
 * @version 1.0 YYYY/MM/DD
 */
public class CommonAction {

    /**
     * アクションを実行する。
     *
     * @param req
     *            HttpServletRequest
     * @return 次画面のJSP名
     */
    public String execute(HttpServletRequest req) {

        String page = "top-view.jsp";

        return page;
    }

}
