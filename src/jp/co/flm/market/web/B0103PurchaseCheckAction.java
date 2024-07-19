/**
 * jp.co.flm.market.web.B0103PurchaseCheckAction
 *
 * All Rights Reserved, Copyright Fujitsu Learning Media Limited
 */
package jp.co.flm.market.web;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import jp.co.flm.market.common.MarketBusinessException;
import jp.co.flm.market.common.MarketSystemException;
import jp.co.flm.market.entity.Member;
import jp.co.flm.market.entity.Orders;
import jp.co.flm.market.logic.MemberInfoLogic;
import jp.co.flm.market.logic.PurchaseProductsLogic;

/**
 * ショッピングカートに商品を追加し、ショッピングカート画面へ遷移するアクションクラスです。
 *
 * @author FLM
 * @version 1.0 YYYY/MM/DD
 */
public class B0103PurchaseCheckAction implements ActionIF{

    /**
     * セッションチェックを行う。
     *
     * @param req
     *            HttpServletRequest
     */
    public String checkSession(HttpServletRequest req) {
        String page = null;

        // セッションを取得する。
        HttpSession session = req.getSession(false);

        if (session == null) {
            // セッションが確立されていない場合、エラーメッセージをリクエストスコープに格納する。
            ArrayList<String> errorMessageList = new ArrayList<String>();
            errorMessageList.add("セッションが無効になりました。再度トップ画面から操作をやりなおしてください。");
            req.setAttribute("errorMessageList", errorMessageList);
            page = "error.jsp";
        } else {
            // ショッピングカートを取得する。
            ArrayList<Orders> cart = (ArrayList<Orders>) session.getAttribute("B01ShoppingCart");

         // ショッピングカートができていない場合、エラーメッセージをリクエストスコープに格納する。
            if (cart == null) {
                ArrayList<String> errorMessageList = new ArrayList<String>();
                errorMessageList.add("セッションが無効になりました。再度トップ画面から操作をやりなおしてください。");
                req.setAttribute("errorMessageList", errorMessageList);

                page = "error.jsp";

            }



        }
        return page;
    }

    /**
     * アクションを実行する。
     *
     * @param req
     *            HttpServletRequest
     * @return 次画面のJSP名
     */
    public String execute(HttpServletRequest req) {

        String page = null;
        page =checkSession(req);

        if (page == null) {
        try {
            // セッションを取得する。
            HttpSession session = req.getSession(false);

            // ショッピングカートを取得する。
            ArrayList<Orders> cart = (ArrayList<Orders>) session.getAttribute("B01ShoppingCart");

            //会員情報を取得する。
            Member member = (Member) session.getAttribute("CommonLoginMember");

            // 商品情報の追加、会員情報の更新、在庫の更新を行う
            //引数が正しいかどうか確かめる
            PurchaseProductsLogic logic = new PurchaseProductsLogic();
            logic.processOrder(cart);

            page = "purchase-result-view.jsp";

            //カートセッションの中身を削除
            session.removeAttribute("B01ShoppingCart");

            //新しい商品情報をゲットしてセッションに入れ直す。
            MemberInfoLogic mlogic = new MemberInfoLogic();
            ArrayList<Orders> orderList = mlogic.getOrderList(member.getMemberId());

            //新しい商品情報をセッションスコープへ格納する。
            session.setAttribute("orderList", orderList);

          //新しいポイント情報をゲットメンバーで呼び出す。
            Member mmember = logic.getMember(member.getMemberId(), member.getPassword());

            //新しいポイント情報をセッションスコープへ格納する。
            session.setAttribute("CommonLoginMember", mmember);


        } catch (MarketBusinessException e) {
            // エラーメッセージを取得する。
            String errorMessage = e.getMessage();

            // リクエストスコープへエラーメッセージを格納する。
            ArrayList<String> errorMessageList = new ArrayList<String>();
            errorMessageList.add(errorMessage);
            req.setAttribute("errorMessageList", errorMessageList);

            page = "error.jsp";

        } catch (MarketSystemException e) {
            // エラーメッセージを取得する。
            String errorMessage = e.getMessage();

            // リクエストスコープへエラーメッセージを格納する。
            ArrayList<String> errorMessageList = new ArrayList<String>();
            errorMessageList.add(errorMessage);
            req.setAttribute("errorMessageList", errorMessageList);

            page = "error.jsp";
        }
        }

        return page;
    }
}