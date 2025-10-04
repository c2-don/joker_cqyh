function 公会温泉_执行(地图)
    if 主程.当前时间 > 地图.节点计时 then
        if 地图.所属行会 == nil then
            地图.节点计时 = os.time({year=1970, month=1, day=1})  -- 使用一个早期的时间作为初始值
            return
        end
       if 地图.副本节点 ~= 0 then
            return
       end
       -- 检查活动3是否存在
       if 地图.所属行会.行会活动[3] == nil then
           地图.节点计时 = os.time({year=1970, month=1, day=1})  -- 活动不存在，暂停执行
           return
       end
       if 地图.所属行会.行会活动[3].结束时间.V <= 主程.当前时间 then
       地图.节点计时 = os.time({year=1970, month=1, day=1})  -- 使用一个早期的时间作为初始值
       return
       end

       -- 🆕 添加日程进度：进入公会温泉获得10点活跃度（每天一次）
       if not Settings.屏蔽日程 then
           local 玩家列表 = 地图:获取玩家列表()
           for i = 0, 玩家列表.Count - 1 do
               local 玩家 = 玩家列表[i]
               if 玩家.角色数据.零点数字[数字_公会温泉每日领取记录] == 0 then
                   玩家.角色数据.日程进度.V = 玩家.角色数据.日程进度.V + 10
                   玩家:发送日程详情()
                   玩家.角色数据.零点数字[数字_公会温泉每日领取记录] = 1
               end
           end
       end

       地图:获得公会温泉经验()
       地图.节点计时 = 主程.当前时间:AddSeconds(2)
    end
end