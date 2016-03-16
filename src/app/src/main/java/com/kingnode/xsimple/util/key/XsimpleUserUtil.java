package com.kingnode.xsimple.util.key;
import com.google.common.base.Strings;
import com.kingnode.diva.security.utils.Digests;
import com.kingnode.diva.utils.Encodes;
import com.kingnode.xsimple.Setting;
/**
 * xsimple中的KnUser用户实体种的 密码设置工具类
 *
 * @author cici
 */
public class XsimpleUserUtil{
    private static XsimpleUserUtil util;
    public static XsimpleUserUtil getInstance(){
        if(util==null){
            synchronized (XsimpleUserUtil.class) {
                if(util==null){
                    util = new XsimpleUserUtil();
                }
            }
        }
        return util;
    }
    /**
     * 根据明文密码和salt的key值,将明文密码进行加密后返回
     * @param password 明文密码
     * @param salt 加密key值
     * @return 加密后的密码串
     */
    public String encodeHexPassword(String password,String salt){
        byte[] hashPassword=Digests.sha1(password.getBytes(),Encodes.decodeHex(salt),Setting.HASH_INTERATIONS);
        return Encodes.encodeHex(hashPassword);
    }
    /**
     * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
     * 当用户提供明文密码是
     *
     * @param password 用户输入密码
     */
    public  UserPasswordKey entryptPassword(String password){
        return entryptPassword(password,false);
    }
    /**
     * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
     * 当用户提供明文密码是
     *
     * @param password 用户输入密码
     * @param flag     是否设置默认密码true表示设置,false表示不设置
     */
    public  UserPasswordKey entryptPassword(String password,boolean flag){
        UserPasswordKey map=new UserPasswordKey();
        if(flag){
            password=Strings.isNullOrEmpty(password)?Setting.PASSWORD:password;
        }else{
            password=Strings.isNullOrEmpty(password)?"":password;
        }
        byte[] salt=Digests.generateSalt(Setting.SALT_SIZE);
        byte[] hashPassword=Digests.sha1(password.getBytes(),salt,Setting.HASH_INTERATIONS);
        password=Encodes.encodeHex(hashPassword);
        map.setPassword(password);
        map.setSalt(Encodes.encodeHex(salt));
        return map;
    }
    public class UserPasswordKey{
        private String password;
        private String salt;
        public String getPassword(){
            return password;
        }
        public void setPassword(String password){
            this.password=password;
        }
        public String getSalt(){
            return salt;
        }
        public void setSalt(String salt){
            this.salt=salt;
        }
    }
}
