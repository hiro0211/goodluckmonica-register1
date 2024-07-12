package jp.co.flm.market.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import jp.co.flm.market.common.MarketSystemException;
import jp.co.flm.market.entity.Member;

// 会員登録時の入力チェックと会員情報の一時保存を行う。
public class B0201CheckMemberAction {
    // pageを初期化
    String page = null;


    public void checkSession(HttpServletRequest req) throws MarketSystemException {
        HttpSession session = req.getSession(false);
        if (session == null) {
            // セッションが存在しない場合、新規作成する
            session = req.getSession(true);
        }
        if (session == null) {
            // セッションの取得に失敗した場合、例外を投げる。
            throw new MarketSystemException("システムエラーが発生しました。システム管理者に連絡してください。");
        }
    }

    public String validate(HttpServletRequest req) {
        List<String> errorMessages = new ArrayList<>();

        // リクエストパラメータから入力値を取得
        String memberName = req.getParameter("memberName");
        String gender = req.getParameter("gender");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");

        //必須項目が空ではないか確認
        if (memberName == null)
            errorMessages.add("名前は入力必須項目です。");
        if (gender == null )
            errorMessages.add("性別は入力必須項目です。");
        if (address == null )
            errorMessages.add("住所は入力必須項目です。");
        if (phone == null )
            errorMessages.add("電話番号は入力必須項目です。");
        if (password == null )
            errorMessages.add("パスワードは入力必須項目です。");

        // 文字数の確認を行う。
        if (memberName != null && (memberName.length() < 1 || memberName.length() > 50))
            errorMessages.add("名前は40文字で入力してください。");
        if (address != null && (address.length() < 1 || address.length() > 100))
            errorMessages.add("住所は1〜100文字で入力してください。");
        if (phone != null && (phone.length() < 1 || phone.length() > 20))
            errorMessages.add("電話番号は1〜20文字で入力してください。");
        if (password != null && (password.length() < 8 || password.length() > 20))
            errorMessages.add("パスワードは8〜20文字で入力してください。");

        //エラーメッセージがあった場合、もう一度登録画面に遷移す
        if (!errorMessages.isEmpty()) {
            req.setAttribute("errorMessageList", errorMessages);
            page = "/member-register-view.jsp";
            return page;
        }
        return page;
    }

    public String execute(HttpServletRequest req) {
        try {
            // セッションを確認
            checkSession(req);
            // セッションを作成
            HttpSession session = req.getSession(false);
            // validateメソッドの入力値を検証する
            page = validate(req);

            if (page == null) {
                //リクエストパラメータから入力値を取得
                String memberName = req.getParameter("memberName");
                String gender = req.getParameter("gender");
                String address = req.getParameter("address");
                String phone = req.getParameter("phone");
                String password = req.getParameter("password");
                Member member = (Member) session.getAttribute("member");
//                String memberId = member.getMemberId();

                // Memberオブジェクトを作成し値を設定する
                member.setMemberName(memberName);
                member.setGender(gender);
                member.setAddress(address);
                member.setPhone(phone);
                member.setPassword(password);
//             member.setMemberId(memberId);

                // セッションに会員情報を保存する
                session.setAttribute("member", member);

                // 確認画面へ遷移する
                page = "member-register-confirm-view.jsp";
            }
            return page;
        } catch (MarketSystemException e) {
            String errorMessages = e.getMessage();
            req.setAttribute("errorMessageList", errorMessages);

            page = "error.jsp";
            return page;
        }
    }

//    private boolean isEmpty(String str) {
//        return str == null || str.trim().isEmpty();
//    }
}