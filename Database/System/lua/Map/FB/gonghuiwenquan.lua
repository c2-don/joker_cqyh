function 公会温泉_执行(地图)
    if 主程.当前时间 > 地图.节点计时 then
        if 地图.所属行会 == nil then
            地图.节点计时 = os.time({year=1970, month=1, day=1})  -- 使用一个早期的时间作为初始值
            return
        end
       if 地图.副本节点 ~= 0 then
            return
       end
       if 地图.所属行会.行会活动[3].结束时间.V <= 主程.当前时间 then
       地图.节点计时 = os.time({year=1970, month=1, day=1})  -- 使用一个早期的时间作为初始值
       return
       end
       地图:获得公会温泉经验()
       地图.节点计时 = 主程.当前时间:AddSeconds(2)
    end
end