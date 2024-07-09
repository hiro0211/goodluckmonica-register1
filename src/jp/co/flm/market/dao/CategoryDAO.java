/**
 * jp.co.flm.market.dao.CategoryDAO
 *
 * All Rights Reserved, Copyright Fujitsu Learning Media Limited
 */
package jp.co.flm.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jp.co.flm.market.entity.Category;

/**
 * Categoryテーブルを利用するDAOクラスです。
 *
 * @author FLM
 * @version 1.0 YYYY/MM/DD
 */
public class CategoryDAO {

    /** コネクション */
    private Connection con;

    /**
     * コンストラクタ
     *
     * @param con
     *            コネクション
     */
    public CategoryDAO(Connection con) {
        this.con = con;
    }

    /**
     * カテゴリ情報の全件検索を行う。
     *
     * @return 全カテゴリ情報
     * @throws SQLException
     *             SQL例外
     */
    public ArrayList<Category> getAllCategories() throws SQLException {
        return null;
    }
}
