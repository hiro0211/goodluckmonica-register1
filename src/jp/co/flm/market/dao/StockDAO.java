/**
 * jp.co.flm.market.dao.StockDAO
 *
 * All Rights Reserved, Copyright Fujitsu Learning Media Limited
 */
package jp.co.flm.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jp.co.flm.market.entity.Stock;

/**
 * Stockテーブルを利用するDAOクラスです。
 *
 * @author FLM
 * @version 1.0 YYYY/MM/DD
 */
public class StockDAO {

    /** コネクション */
    private Connection con;

    /**
     * コンストラクタ
     *
     * @param con
     *            コネクション
     */
    public StockDAO(Connection con) {
        this.con = con;
    }

    /**
     * 在庫情報の1件排他検索を行う。
     *
     * @param productId
     *            商品ID
     * @return 在庫情報
     * @throws SQLException
     *             SQL例外
     */
    public Stock selectStockForUpdate(String productId) throws SQLException {
        return null;
    }

    /**
     * 在庫情報の更新を行う。
     *
     * @param productId
     *            商品ID
     * @param quantity
     *            在庫数
     * @throws SQLException
     *             SQL例外
     */
    public void updateStock(String productId, int quantity) throws SQLException {
    }
}
