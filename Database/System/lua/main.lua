package.loaded["init"] = nil
require "init"

function reload()
	package.loaded["main.lua"] = nil
end

-- 添加路径测试函数
function test_all_paths()
	print("=== 路径测试开始 ===")
	print("Package path: " .. package.path)
	
	-- 测试NPC路径
	if test_npc_path then
		print("--- NPC路径测试 ---")
		test_npc_path()
	end
	
	-- 测试Config路径
	if ConfigMgr then
		print("--- Config路径测试 ---")
		local config = ConfigMgr:Instance()
		local testConfig = config:GetConfig("Class")
		if testConfig then
			print("Config路径正常，成功加载Class配置")
		else
			print("Config路径异常，无法加载Class配置")
		end
	end
	
	print("=== 路径测试结束 ===")
end
