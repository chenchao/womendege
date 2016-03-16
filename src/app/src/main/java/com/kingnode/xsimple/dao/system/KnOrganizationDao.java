package com.kingnode.xsimple.dao.system;
import java.util.List;
import javax.persistence.QueryHint;

import com.kingnode.xsimple.dto.OrganizationDTO;
import com.kingnode.xsimple.entity.system.KnOrganization;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
/**
 * @author chirs@zhoujin.com (Chirs Chou)
 */
@SuppressWarnings("ALL")
public interface KnOrganizationDao extends PagingAndSortingRepository<KnOrganization,Long>, JpaSpecificationExecutor<KnOrganization>{
    List<KnOrganization> findByPathLike(String path);
    /**
     * 通过supId 查找所有直接的下级组织
     *
     * @param supId
     *
     * @return
     */
    List<KnOrganization> findBySupId(Long supId);
    @Query("select new com.kingnode.xsimple.dto.OrganizationDTO(o.id,o.code,o.name,(select count(k) from KnOrganization k where k.supId=o.id)) from KnOrganization o where supId=?1 order by o.code ")
    List<OrganizationDTO> findBySupIdHasChildrenNum(Long supId);
    /**
     * 通过supId 查找所有直接的下级组织
     *
     * @param supId
     *
     * @return
     */
    List<KnOrganization> findByName(String name);
    /**
     * 用于卓越系统
     * @param code
     * @return
     */
    KnOrganization findByCode(String code);
    /**
     * 根据idsList获取相应的部门
     *
     * @param idsList 部门idsList
     *
     * @return List<KnOrganization> 返回符合条件的所有部门信息
     */
    @QueryHints({@QueryHint(name="org.hibernate.cacheable", value="true")})@Query("select u from KnOrganization u where u.id in(:idsList)") List<KnOrganization> findListAllByIds(@Param("idsList") List<Long> idsList);
    @QueryHints({@QueryHint(name="org.hibernate.cacheable", value="true")})@Query("select u from KnOrganization u where u.path like:path") List<KnOrganization> findLowerOrganListByPath(@Param("path") String path);
    /**
     * 分页,加入缓存
     *
     * @param spec
     * @param pageable
     *
     * @return
     */
    @QueryHints({@QueryHint(name="org.hibernate.cacheable",value="true")}) Page<KnOrganization> findAll(Specification<KnOrganization> spec,Pageable pageable);

    @Query("select o from KnOrganization o order by o.seq asc")
    List<KnOrganization> findAllOrgan();

}