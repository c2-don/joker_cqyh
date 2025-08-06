print("重新加载map.lua")
---副本
package.loaded["Map/FB/yaota"] = nil
package.loaded["Map/FB/mota"] = nil
package.loaded["Map/FB/motamijing"] = nil
package.loaded["Map/FB/tumo"] = nil
package.loaded["Map/FB/mochongku"] = nil
package.loaded["Map/FB/xuegong"] = nil
package.loaded["Map/FB/zhizhuchanglang"] = nil
package.loaded["Map/FB/weizhiandian"] = nil
package.loaded["Map/FB/zhiyanmingsi"] = nil
package.loaded["Map/FB/chonggumilin"] = nil
package.loaded["Map/FB/diexuezhilu"] = nil
package.loaded["Map/FB/turutianmen"] = nil
package.loaded["Map/FB/xuewujianlao"] = nil
package.loaded["Map/FB/shilianhuanjing"] = nil
package.loaded["Map/FB/gonghuiwenquan"] = nil
package.loaded["Map/FB/molonghuanjing"] = nil
package.loaded["Map/FB/yaolinhuanjing"] = nil
---活动
package.loaded["Map/HD/xiuluoshouliechang"] = nil
package.loaded["Map/HD/xiuluojingjichang"] = nil
package.loaded["Map/HD/mibaozhanchang"] = nil
package.loaded["Map/HD/biqijiushi"] = nil
package.loaded["Map/HD/wudouchang"] = nil
package.loaded["Map/HD/huangshibaoku"] = nil
---副本
require "Map/FB/yaota"---九层妖塔
require "Map/FB/mota"---九层魔塔
require "Map/FB/motamijing"---魔塔秘境
require "Map/FB/tumo"---屠魔大厅
require "Map/FB/mochongku"---魔虫窟
require "Map/FB/xuegong"---学宫
require "Map/FB/zhizhuchanglang"---蜘蛛长廊
require "Map/FB/weizhiandian"---未知暗殿
require "Map/FB/zhiyanmingsi"---炙焰冥寺
require "Map/FB/chonggumilin"---虫谷密林
require "Map/FB/diexuezhilu"---喋血之路
require "Map/FB/turutianmen"---突入天门
require "Map/FB/xuewujianlao"---血污监牢
require "Map/FB/shilianhuanjing"---试炼幻境
require "Map/FB/gonghuiwenquan"---公会温泉
require "Map/FB/molonghuanjing"---魔龙幻境
require "Map/FB/yaolinhuanjing"---妖林幻境
---活动
require "Map/HD/xiuluoshouliechang"---修罗狩猎场
require "Map/HD/xiuluojingjichang"---修罗竞技场
require "Map/HD/mibaozhanchang"---秘宝战场
require "Map/HD/biqijiushi"---比奇旧世
require "Map/HD/wudouchang"---武斗场
require "Map/HD/huangshibaoku"---皇室宝库

---副本地图执行事件
function scene_instance_FB_run(地图)
  if 地图.地图编号 == 36 then
    魔龙幻境_执行(地图)
  end  
  if 地图.地图编号 == 41 then
    炙焰冥寺_执行(地图)
  end  
  if 地图.地图编号 == 42 then
    虫谷密林_执行(地图)
  end  
  if 地图.地图编号 == 43 then
    喋血之路_执行(地图)
  end  
  if 地图.地图编号 == 44 then
    突入天门_执行(地图)
  end  
  if 地图.地图编号 == 45 then
    血污监牢_执行(地图)
  end
  if 地图.地图编号 == 72 then
    魔虫窟_执行(地图)
  end
  if 地图.地图编号 == 73 then
    蜘蛛长廊_执行(地图)
  end
  if 地图.地图编号 == 76 then
    九层魔塔_执行(地图)
  end
  if 地图.地图编号 == 80 then
    屠魔大厅_执行(地图)
  end
  if 地图.地图编号 == 84 then
    学宫_执行(地图)
  end
  if 地图.地图编号 == 88 then
    未知暗殿_执行(地图)
  end  
  if 地图.地图编号 == 107 then
    妖林幻境_执行(地图)
  end
  if 地图.地图编号 == 120 then
    魔塔秘境_执行(地图)
  end
  if 地图.地图编号 == 122 then
    试炼幻境_执行(地图)
  end
  if 地图.地图编号 == 227 then
    九层妖塔_执行(地图)
  end  
  if 地图.地图编号 == 228 then
    公会温泉_执行(地图)
  end
end

---活动地图执行事件
function scene_instance_HD_run(地图)
  if 地图.地图编号 == 27 then
    修罗狩猎场_执行(地图)
  end
  if 地图.地图编号 == 28 then
    修罗竞技场_执行(地图)
  end
  if 地图.地图编号 == 32 then
    秘宝战场_执行(地图)
  end
  if 地图.地图编号 == 140 then
    比奇旧世_执行(地图)
  end
  if 地图.地图编号 == 183 then
    武斗场_执行(地图)
  end
  if 地图.地图编号 == 184 then
    皇室宝库_执行(地图)
  end
end

---地图创建事件
function scene_instance_create(地图)

end

---地图销毁事件
function scene_instance_destroy(地图)

end

---地图进入事件
function scene_instance_player_into(地图, 玩家)
 ---print(玩家.对象名字 .. "进入地图" .. 地图.地图模板.地图名字)
end

---地图退出事件
function scene_instance_player_leave(地图, 玩家)
  
end

---地图执行事件（统一入口）
function scene_instance_run(地图)
  scene_instance_FB_run(地图)  -- 副本地图执行
  scene_instance_HD_run(地图)  -- 活动地图执行
end

---从服务端怪物刷新文件夹中取某个刷怪区域，需要刷怪区域文件中包含"区域名字"的参数
---@param 地图 地图实例
---@param 区域名字 string
---@return nil
function 获取副本怪物区域(地图, 区域名字)
  local 刷怪列表 = 地图:获取怪物区域()
  for i = 0, 刷怪列表.Count - 1 do
    local 刷怪信息 = 刷怪列表[i]
    if 刷怪信息.区域名字 == 区域名字 then
      return 刷怪信息
    end
  end
  return nil
end

function 创建副本(模板编号)
  local 地图模板 = 游戏地图.数据表[模板编号]
  local 实例 = 地图处理网关.地图实例表[模板编号 * 16 + 1]
  if 地图模板 ~= nil and 地图模板.副本地图 then
    if 实例 ~= nil then
      local 副本 = 地图实例(地图模板, 实例)
      地图处理网关.副本实例表:Add(副本);
      return 副本
    end
  end
  return nil
end
