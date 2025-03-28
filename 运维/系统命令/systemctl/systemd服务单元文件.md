# 基础结构

1. **[Unit]**
    
    - **作用**：描述服务的元信息、依赖关系和启动顺序。
    - **关键参数**：
        - `Description`：服务的简短描述（必填）。
        - `After`/`Before`：指定服务启动顺序（如 `After=network.target` 表示在网络服务后启动）。
        - `Requires`/`Wants`：定义强依赖或弱依赖关系。
        
2. **[Service]**
    
    - **作用**：定义服务运行时的具体行为。
    - **核心参数**：
        - `Type`：启动类型，常见值包括：
            - `simple`（默认）：主进程直接启动。
            - `forking`：后台运行，父进程退出后子进程接管（需配合 `PIDFile` 使用）。
            - `oneshot`：单次执行任务后退出。
        - `ExecStart`/`ExecStop`：启动和停止服务的绝对路径命令（必须使用绝对路径）。
        - `Restart`：定义服务退出后的重启策略（如 `on-failure` 仅在异常退出时重启）。
        - `User`/`Group`：指定运行服务的用户和组。
        
3. **[Install]**
    
    - **作用**：控制服务的安装和开机启动行为。
    - **关键参数**：
        - `WantedBy`：指定服务所属的运行级别目标（如 `multi-user.target` 多用户模式）