package jp.co.flm.market.web;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import jp.co.flm.market.common.MarketSystemException;
import jp.co.flm.market.entity.Member;
import jp.co.flm.market.logic.RegisterMemberLogic;

public class B0201RegisterMemberAction implements ActionIF{
        //pageを初期化
        String page = null;

        public String execute(HttpServletRequest req) {
            // セッションを取得する。できなかった場合は新規作成する。
              HttpSession session = req.getSession(true);

            try {
              //Memberオブジェクトを生成
//                Member member = new Member();

                //セッション情報の取得
                Member member = (Member) session.getAttribute("registerMember");

                //RegisterMemberLogicオブジェクトを生成
                RegisterMemberLogic logic= new RegisterMemberLogic();

                //LogicのregisterMemberメソッドを呼び出す
                logic.registerMember(member);

                // ログイン済みか確認するフラグを作成
                session.setAttribute("CommonLoginMember", member);

                //次の画面で表示されるように会員情報をsetする
                req.setAttribute("member", member);

              //会員登録が成功したらセッション情報を削除
//                session.removeAttribute("member");

                // 会員登録結果画面に遷移する
                page = "member-register-result-view.jsp";

            } catch (MarketSystemException e) {
                // エラーメッセージを取得する。
                String errorMessage = e.getMessage();

                // リクエストスコープへエラーメッセージを格納する。
                ArrayList<String> errorMessageList = new ArrayList<String>();
                errorMessageList.add(errorMessage);
                req.setAttribute("errorMessageList", errorMessageList);

                page = "error.jsp";
            }

        return page;
     }
    }




