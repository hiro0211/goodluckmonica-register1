/**
 * jp.co.flm.framework.FrontControllerServlet
 *
 * All Rights Reserved, Copyright Fujitsu Learning Media Limited
 */

package jp.co.flm.market.web;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * フロントコントローラクラス
 *
 * @author FLM
 * @version 1.0 YYYY/MM/DD
 */
@WebServlet("/mserv")
public class FrontControllerServlet extends HttpServlet {

    /**
     * サーブレットのサービス
     *
     * @param request
     *            HttpServletRequest
     * @param response
     *            HttpServletResponse
     * @throws ServletException
     * @throws IOException
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * サーブレットのサービス
     *
     * @param request
     *            HttpServletRequest
     * @param response
     *            HttpServletResponse
     * @throws ServletException
     * @throws IOException
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    @SuppressWarnings("checkstyle:CyclomaticComplexity")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String flag = request.getParameter("flag");

        String page = null;

        if (flag == null) {
            flag = "TOP";
        }
        switch (flag) {
            case "TOP":
                CommonAction commonAction = new CommonAction();
                page = commonAction.execute(request);
                break;
            case "CommonLogin":
                CommonLoginAction commonLoginAction = new CommonLoginAction();
                page = commonLoginAction.execute(request);
                break;
            case "B0102UpdateCart":
                B0102UpdateCartAction b0102UpdateCartAction = new B0102UpdateCartAction();
                page = b0102UpdateCartAction.execute(request);
                break;
            case "B0102DeleteFromCart":
                B0102DeleteCartAction b0102DeleteCartAction = new B0102DeleteCartAction();
                page = b0102DeleteCartAction.execute(request);
                break;
            case "B0102GoShopping":
                B0102GoShoppingAction b0102GoShoppingAction = new B0102GoShoppingAction();
                page = b0102GoShoppingAction.execute(request);
                break;
            case "B0102LoginShopping":
                // B0102LoginShoppingAction b0102LoginShoppingAction = new
                // B0102LoginShoppingAction();
                // page = b0102LoginShoppingAction.execute(request);
                break;
            case "B0202LoginMember":
                B0202LoginMemberAction b0202LoginMemberAction = new B0202LoginMemberAction();
                page = b0202LoginMemberAction.execute(request);
                break;
            default:
                // エラーメッセージを取得する。
                String errorMessage = "不正な操作です。";

                // リクエストスコープへエラーメッセージを格納する。
                ArrayList<String> errorMessageList = new ArrayList<String>();
                errorMessageList.add(errorMessage);
                request.setAttribute("errorMessageList", errorMessageList);

                page = "error.jsp";
                break;
        }

        RequestDispatcher rd = request.getRequestDispatcher("/jsp/" + page);
        rd.forward(request, response);
    }
}
