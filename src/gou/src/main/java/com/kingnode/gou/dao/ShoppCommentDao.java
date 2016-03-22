package com.kingnode.gou.dao;
import com.kingnode.gou.entity.ShoppComment;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
/**
 * @author chirs@zhoujin.com (Chirs Chou)
 */
@SuppressWarnings("ALL")
public interface ShoppCommentDao extends PagingAndSortingRepository<ShoppComment,Long>, JpaSpecificationExecutor<ShoppComment>{
}
