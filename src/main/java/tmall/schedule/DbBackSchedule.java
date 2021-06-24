package tmall.schedule;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @author bernie
 * @date 2021/2/19
 */

@Component
public class DbBackSchedule {

    @Scheduled(cron = "0/1 * * * * ? ") // 每隔10分钟隔行一次   0 0/10 * * * ?
    public void schedule() {

        //输出时间测试
        try {
            Runtime.getRuntime().exec("/Users/bernie/o2o/mysql_backup.sh").waitFor();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}