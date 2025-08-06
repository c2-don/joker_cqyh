ConfigMgr = {
	--实例对象
	_instance = nil,
	--缓存表格数据
	_cacheConfig = {},
	--具有id的表的快速索引缓存，结构__fastIndexConfig["LanguageCfg"][100]
	_quickIndexConfig = {},
}
ConfigMgr.__index = ConfigMgr
setmetatable(ConfigMgr, Class)

-- 数据配置文件的路径  从package.path中动态获取，确保可移植性
local function get_config_base_path()
	local path = package.path
	-- 查找包含System/lua的路径
	for pattern in string.gmatch(path, "[^;]+") do
		local base = string.match(pattern, "(.*/System/lua)/")
		if base then
			return base .. "/Config/%s.lua"
		end
	end
	-- 如果没找到，使用相对路径作为后备
	return "Config/%s.lua"
end

local cfgPath = get_config_base_path()

-- 构造器
function ConfigMgr:new()
	local self = {}
	self = Class:new()
	setmetatable(self, ConfigMgr)
	return self
end

-- 获取单例
function ConfigMgr:Instance()
	if ConfigMgr._instance == nil then
		ConfigMgr._instance = ConfigMgr:new()
	end
	return ConfigMgr._instance
end

-- 获取对应的表格数据
function ConfigMgr:GetConfig(name)
	local tmpCfg = self._cacheConfig[name]
	if nil ~= tmpCfg then
		return tmpCfg
	else
		local fileName = string.format(cfgPath, name)
		--print("----------->Read Config File"..fileName)
		-- 读取配置文件
		local cfgData = dofile(fileName)

		-- 对读取到的配置做缓存处理
		self._cacheConfig[name] = {}
		self._cacheConfig[name].items = cfgData;
		return self._cacheConfig[name]
	end
	return nil
end

-- 获取表格中指定的ID项
function ConfigMgr:GetItem(name, id)
	if nil == self._quickIndexConfig[name] then
		local cfgData = self:GetConfig(name)
		if cfgData and cfgData.items and cfgData.items[1] then
			-- 如果是空表的话不做处理
			local _id = cfgData.items[1].id
			if _id then
				-- 数据填充
				self._quickIndexConfig[name] = {}
				for _, v in ipairs(cfgData.items) do
					self._quickIndexConfig[name][v.id] = v
					--print("---->"..v.id)
				end
			else
				--print(string.format("Config: %s don't contain id: %d!",name,id))
			end
		end
	end
	if self._quickIndexConfig[name] then
		return self._quickIndexConfig[name][id]
	end
	return nil
end
