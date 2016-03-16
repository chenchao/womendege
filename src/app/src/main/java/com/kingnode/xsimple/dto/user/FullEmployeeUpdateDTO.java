package com.kingnode.xsimple.dto.user;
import com.kingnode.xsimple.dto.FullEmployeeDTO;
/**
 * 员工信息DTO,包含更新时间,主要用于增量更新
 * @author cici
 */
public class FullEmployeeUpdateDTO extends FullEmployeeDTO{
    private Long updateTime;
    private String k1;//add/update/del分别表示新增/更新/删除
    public Long getUpdateTime(){
        return updateTime;
    }
    public void setUpdateTime(Long updateTime){
        this.updateTime=updateTime;
    }
    public String getK1(){
        return k1;
    }
    public void setK1(String k1){
        this.k1=k1;
    }
    public enum EmployeeStatus{
        add("新增"),update("更新"),del("删除");
        private final String u_type;
        EmployeeStatus(final String u_type){
            this.u_type=u_type;
        }
        /**
         * @return Returns the s_type.
         */
        public String getTypeName(){
            return u_type;
        }
    }
}
