function 武斗场_执行(地图)
    if 主程.当前时间 > 地图.节点计时 then
        地图.节点计时 = 主程.当前时间:AddSeconds(1)
        if 地图.玩家列表.Count == 0 then
            return
        end
        if 地图.地图节点 == 0 then
            地图.地图节点 = 地图.地图节点 + 1
            地图.节点计时 = 主程.当前时间:AddSeconds(5)
        elseif 地图.地图节点 == 1 then
            地图:地图公告("欢迎来到武斗场。")
            地图.地图节点 = 地图.地图节点 + 1
            地图.节点计时 = 主程.当前时间:AddSeconds(5)
        elseif 地图.地图节点 == 2 then
            if 当前小时 == 21 and 当前分钟 >= 30 or 当前小时 == 21 and 当前分钟 >= 30 then
                地图:地图公告("武斗场活动已经结束！")
                地图.地图节点 = 地图.地图节点 + 1
                地图.节点计时 = 主程.当前时间:AddSeconds(2)
            else
                local 玩家列表 = 地图:获取玩家列表()
                for i = 0, 玩家列表.Count - 1 do
                    local 玩家 = 玩家列表[i]
                    玩家:玩家武斗场增加经验(500,2500)
                end
                地图.节点计时 = 主程.当前时间:AddSeconds(5)
            end
        elseif 地图.地图节点 == 3 then
            地图:地图公告("5秒后玩家自动传出武斗场。")
            地图.地图节点 = 地图.地图节点 + 1
            地图.节点计时 = 主程.当前时间:AddSeconds(5)
        elseif 地图.地图节点 == 4 then
            地图:地图清理玩家()
            地图.地图节点 = 0
            地图.节点计时 = 主程.当前时间:AddSeconds(5)
        end
    end
end
