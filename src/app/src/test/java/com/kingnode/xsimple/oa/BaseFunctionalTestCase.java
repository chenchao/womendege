/*
package com.kingnode.xsimple.oa;

import com.kingnode.diva.test.data.DataFixtures;
import com.kingnode.diva.test.jetty.JettyFactory;
import com.kingnode.diva.test.spring.Profiles;
import com.kingnode.diva.utils.PropertiesLoader;
import org.eclipse.jetty.server.Server;
import org.junit.BeforeClass;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;

import java.net.URL;
import java.sql.Driver;

*/
/**
 * 功能测试基类.
 * <p/>
 * 在整个测试期间启动一次Jetty Server, 并在每个TestCase Class执行前中重新载入默认数据.
 *
 * @author Chirs Chou(chirs@zhoujin.com)
 *//*

public class BaseFunctionalTestCase {
    protected static String baseUrl;
    protected static Server jettyServer;
    protected static SimpleDriverDataSource dataSource;
    protected static PropertiesLoader propertiesLoader = new PropertiesLoader("classpath:/application.properties", "classpath:/application.functional.properties", "classpath:/application.functional-local.properties");
    private static Logger logger = LoggerFactory.getLogger(BaseFunctionalTestCase.class);

    @BeforeClass
    public static void initFunctionalTestEnv() throws Exception {
        baseUrl = propertiesLoader.getProperty("baseUrl");
        Boolean isEmbedded = new URL(baseUrl).getHost().equals("localhost") && propertiesLoader.getBoolean("embeddedForLocal");
        if (isEmbedded) {
            startJettyOnce();
        }
        buildDataSourceOnce();
        reloadSampleData();
    }

    */
/**
     * 启动Jetty服务器, 仅启动一次.
     *//*

    protected static void startJettyOnce() throws Exception {
        if (jettyServer == null) {
            System.out.println("[HINT] Don't forget to set -XX:MaxPermSize=128m");
            // 设定Spring的profile
            Profiles.setProfileAsSystemProperty(Profiles.FUNCTIONAL_TEST);
            jettyServer = JettyFactory.createServerInSource(new URL(baseUrl).getPort(), ShowcaseServer.CONTEXT);
            JettyFactory.setTldJarNames(jettyServer, ShowcaseServer.TLD_JAR_NAMES);
            jettyServer.start();
            logger.info("Jetty Server started at {}", baseUrl);
        }
    }

    */
/**
     * 构造数据源，仅构造一次.
     *//*

    protected static void buildDataSourceOnce() throws ClassNotFoundException {
        if (dataSource == null) {
            dataSource = new SimpleDriverDataSource();
            dataSource.setDriverClass((Class<? extends Driver>) Class.forName(propertiesLoader.getProperty("jdbc.driver")));
            dataSource.setUrl(propertiesLoader.getProperty("jdbc.url"));
            dataSource.setUsername(propertiesLoader.getProperty("jdbc.username"));
            dataSource.setPassword(propertiesLoader.getProperty("jdbc.password"));
        }
    }

    */
/**
     * 载入默认数据.
     *//*

    protected static void reloadSampleData() throws Exception {
        String dbType = propertiesLoader.getProperty("db.type", "h2");
        DataFixtures.executeScript(dataSource, "classpath:data/" + dbType + "/cleanup-data.sql", "classpath:data/" + dbType + "/import-data.sql");
    }
}
*/
