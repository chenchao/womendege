package com.kingnode.xsimple.dao.push;

import java.util.List;

import com.kingnode.xsimple.Setting;
import com.kingnode.xsimple.entity.push.KnPushMessageInfo;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * @author cici
 */
@SuppressWarnings("ALL")
public interface KnMessageDao extends PagingAndSortingRepository<KnPushMessageInfo,Long>, JpaSpecificationExecutor<KnPushMessageInfo> {
    /**
     * 根据主键id的集合更新消息的状态
     * @param received 消息的状态
     * @param ids 主键id集合
     */
    @Modifying
    @Query("update KnPushMessageInfo set msgState=?1 where id in(?2)")
    void updateStatusByIds(Setting.MsgState received,List<Long> ids);
    /**
     * 根据设备的id和时间查询设备的信息,获取非已接收的数据,去除pushIds里面存在的数据进行分页返回
     * @param deviceIds 设备的id集合
     * @param pushIds 忽略的消息id集合
     * @param time 时间点
     * @param page 分页数据
     * @return 消息列表
     */
    @Query("select u from KnPushMessageInfo u where  u.createTime>?2 and u.deviceInfo.id in(?1) and u.messType=?3 and msgState<>'received'")
    List<KnPushMessageInfo> findMessageByDeviceIdsAndTimeAndType(List<Long> deviceIds,Long time,Setting.MessageType type, org.springframework.data.domain.Pageable page);
    /**
     * 根据设备的id和时间查询设备的信息,获取非已接收的数据,去除pushIds里面存在的数据进行分页返回
     * @param deviceIds 设备的id集合
     * @param pushIds 忽略的消息id集合
     * @param time 时间点
     * @param page 分页数据
     * @return 消息列表
     */
    @Query("select u from KnPushMessageInfo u where u.id not in(?2) and u.createTime>?3 and u.deviceInfo.id in(?1) and u.messType=?4 and msgState<>'received'")
    List<KnPushMessageInfo> findMessageByDeviceIdsAndNotInIdTimeAndType(List<Long> deviceIds,List<Long> pushIds,Long time,Setting.MessageType type, org.springframework.data.domain.Pageable page);

    /**
     * 根据时间点删除在此时间点之前的消息数据
     * @param time 时间点
     */
    @Modifying
    @Query("delete from KnPushMessageInfo where createTime<?1")
    void deleteByTime(Long time);
}
