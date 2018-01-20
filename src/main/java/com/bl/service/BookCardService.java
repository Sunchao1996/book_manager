package com.bl.service;

import java.util.List;

import com.bl.beans.bo.BookCard;
import com.bl.beans.bo.Reader;
import com.bl.condition.child.BookCardCond;

/**
 * @功能描述 图书卡的service接口
 * @author chao
 *
 */
public interface BookCardService {
	/**
	 * @功能描述 添加图书卡
	 */
	public int insert(BookCard bc);
	/**
	 * @功能描述 分页查询图书卡
	 */
	public List<BookCard> getByPage(BookCardCond cond);
	/**
	 * @功能描述 禁用图书卡
	 */
	public void delete(String[] ids);
	/**
	 * @功能描述 读者挂失图书卡
	 */
	public int update(Reader reader);
}
