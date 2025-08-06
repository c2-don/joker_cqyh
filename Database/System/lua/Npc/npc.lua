-- 从package.path中提取基础路径，确保可移植性
local function get_lua_base_path()
	local path = package.path
	-- 查找包含System/lua的路径
	for pattern in string.gmatch(path, "[^;]+") do
		local base = string.match(pattern, "(.*/System/lua)/")
		if base then
			return base
		end
	end
	-- 如果没找到，使用相对路径作为后备
	return "."
end

local lua_base = get_lua_base_path()
local npcPath = lua_base .. "/Npc/NpcFace/%s.lua"

-- 添加路径测试函数
function test_npc_path()
	print("Package path: " .. package.path)
	print("Lua base path: " .. lua_base)
	local testId = "6112"
	local fileName = string.format(npcPath, testId)
	print("测试路径: " .. fileName)
	print("文件存在: " .. tostring(file_exists(fileName)))
end

NPC界面函数表 = {}

function file_exists(path)
  local file = io.open(path, "rb")
  if file then
    file:close()
  end
  return file ~= nil
end

function 获取界面函数(玩家, Id)
	local tmpCfg = NPC界面函数表[Id]
	if nil ~= tmpCfg and not 玩家.管理员模式 then
		return tmpCfg
	else
		local fileName = string.format(npcPath, Id)
		print("尝试加载NPC脚本: " .. fileName .. " (ID: " .. Id .. ")")
    if not file_exists(fileName) then
      print("NPC脚本文件不存在: " .. fileName)
      return nil
    end
		print("找到NPC脚本文件，开始加载: " .. fileName)
		local success, npcFunction = pcall(dofile, fileName)
		if not success then
			print("NPC脚本加载失败: " .. fileName .. " 错误: " .. tostring(npcFunction))
			return nil
		end
		print("NPC脚本加载成功，类型: " .. type(npcFunction))
		NPC界面函数表[Id] = npcFunction;
		return NPC界面函数表[Id]
	end
	return nil
end

界面层数 = 0
上次选择 = 0

function npctalk(玩家, 对话守卫)
  if 玩家.管理员模式 then
    local 开区节点 = 0
    if 主程.开区节点 == 0 then
      开区节点 = 0
    elseif 主程.开区节点 == 1 then
      开区节点 = 1
    elseif 主程.开区节点 == 3 then
      开区节点 = 3
    elseif 主程.开区节点 == 4 then
      开区节点 = 4
    elseif 主程.开区节点 == 6 then
      开区节点 = 6
    elseif 主程.开区节点 == 7 then
      开区节点 = 7
    end
    玩家:发送系统消息("你点击了" .. 对话守卫.对象名字 .. "-" .. 对话守卫.模板编号.. "当前开放节点：".. 开区节点)
  end

  界面层数 = 0
  local 界面函数 = 获取界面函数(玩家, 对话守卫.模板编号)
  if type(界面函数) == "function" then
    return 界面函数(玩家, 对话守卫, 0, 0)
  elseif type(界面函数) == "string" then
    return 界面函数
  else
    return "<#Dft>"
  end
end

function npclick(玩家, 对话守卫, 选项编号)
  local 界面函数 = 获取界面函数(玩家, 对话守卫.模板编号)
  界面层数 = 界面层数 + 1
  if 界面函数 then
    玩家.对话页面 = 玩家.对话页面 * 10 + 选项编号
    返回值 = 界面函数(玩家, 对话守卫, 选项编号, 界面层数)
    上次选择 = 选项编号
    return 返回值
  end
end

-- function npc_create(守卫)

-- end

function npc_run(守卫)
  --8220-冥海信标
  --8221-刺杀信标
  if 守卫.模板编号 == 8220 or 守卫.模板编号 == 8221 then
    --守卫.当前地图:地图公告("aa ")
    if 主程.当前时间 > 守卫.脚本计时 then
      if 守卫.脚本计次 <= 14 then
        守卫.脚本计次 = 守卫.脚本计次 + 1
        守卫.脚本计时 = 主程.当前时间:AddMinutes(1.0)
        local 坐标 = 计算类.点阵坐标转游戏坐标(守卫.当前坐标)
        if 守卫.模板编号 == 8220 then
          网络服务网关.发送公告("<#P0:" ..
            FormatNum(坐标.X // 100) .. "><#P1:" .. FormatNum(坐标.Y // 100) .. "><#T:990597>")
          刷新怪物从地图实例("幽冥先锋01", 守卫.当前地图, 0, 守卫.当前坐标.X, 守卫.当前坐标
            .Y, true, true)
          刷新怪物从地图实例("幽冥先锋01", 守卫.当前地图, 0, 守卫.当前坐标.X, 守卫.当前坐标
            .Y, true, true)
          刷新怪物从地图实例("幽冥先锋01", 守卫.当前地图, 0, 守卫.当前坐标.X, 守卫.当前坐标
            .Y, true, true)
          刷新怪物从地图实例("幽冥先锋01", 守卫.当前地图, 0, 守卫.当前坐标.X, 守卫.当前坐标
            .Y, true, true)
          刷新怪物从地图实例("幽冥先锋01", 守卫.当前地图, 0, 守卫.当前坐标.X, 守卫.当前坐标
            .Y, true, true)
        else
          网络服务网关.发送公告("<#P0:" ..
            FormatNum(坐标.X // 100) .. "><#P1:" .. FormatNum(坐标.Y // 100) .. "><#T:990598>")
          刷新怪物从地图实例("背誓刺客01", 守卫.当前地图, 0, 守卫.当前坐标.X, 守卫.当前坐标
            .Y, true, true)
          刷新怪物从地图实例("背誓刺客01", 守卫.当前地图, 0, 守卫.当前坐标.X, 守卫.当前坐标
            .Y, true, true)
          刷新怪物从地图实例("背誓刺客01", 守卫.当前地图, 0, 守卫.当前坐标.X, 守卫.当前坐标
            .Y, true, true)
          刷新怪物从地图实例("背誓刺客01", 守卫.当前地图, 0, 守卫.当前坐标.X, 守卫.当前坐标
            .Y, true, true)
          刷新怪物从地图实例("背誓刺客01", 守卫.当前地图, 0, 守卫.当前坐标.X, 守卫.当前坐标
            .Y, true, true)
        end
        if not 守卫.对象死亡 and 守卫.脚本计次 >= 14 then
          守卫:自身死亡处理(守卫, false)
          守卫.消失时间 = 主程.当前时间
          local 掉落宝箱 = 物品实例(1500706, 守卫.当前地图, 守卫.当前坐标, nil, 1)
          掉落宝箱.强制时间 = true
        end
      end
    end
  end
end
