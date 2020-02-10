package com.example.shiro;

import com.jolbox.bonecp.BoneCPConfig;
import com.jolbox.bonecp.BoneCPDataSource;

public class CustomBoneCPDataSource extends BoneCPDataSource {
    public CustomBoneCPDataSource() {
        super();
        this.setDriverClass("com.mysql.cj.jdbc.Driver");
        this.setJdbcUrl("jdbc:mysql://localhost:3306/shiro?useTimezone=true&serverTimezone=UTC");
        this.setUsername("root");
        this.setMaxConnectionsPerPartition(10);
    }

    public CustomBoneCPDataSource(BoneCPConfig config) {
        super(config);
    }
}
