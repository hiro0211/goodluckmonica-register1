package jp.co.flm.market.logic;

import java.sql.Connection;
import java.sql.SQLException;
import jp.co.flm.market.common.MarketBusinessException;
import jp.co.flm.market.common.MarketSystemException;
import jp.co.flm.market.dao.ConnectionManager;
import jp.co.flm.market.dao.MemberDAO;
import jp.co.flm.market.entity.Member;

public class UpdateMemberLogic {

    public void updateMember(Member member) throws MarketBusinessException, MarketSystemException {
        Connection con = null;

        try {
            con = ConnectionManager.getConnection();
            con.setAutoCommit(false);

            MemberDAO memberDAO = new MemberDAO(con);
            memberDAO.updateMember(member);

            con.commit();
        } catch (SQLException e) {
            try {
                if (con != null) {
                    con.rollback();
                }
            } catch (SQLException e1) {
                throw new MarketSystemException("システムエラーが発生しました。システム管理者に連絡してください。");
            }
            throw new MarketSystemException("システムエラーが発生しました。システム管理者に連絡してください。");
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e2) {
                throw new MarketSystemException("システムエラーが発生しました。システム管理者に連絡してください。");
            }
        }
    }
}