-- Table with all groups
groups = {}

-- Constructor
Group = {}
Group.__index = Group

-- Meta table for groups
setmetatable(Group, {
	__eq = function(self)
		return self.group
	end,
	__tostring = function(self)
		return self.group
	end,
	__call = function(self, group, inh)
		local gr = {}

		gr.group = group
		gr.inherits = inh

		groups[group] = gr

		for k, v in pairs(Group) do
			if type(v) == 'function' then
				gr[k] = v
			end
		end

		return gr
	end
})

-- To check if a certain group can target another
function Group:canTarget(gr)
	if(self.group == 'user')then
		if(gr == 'user')then
			return true
		else
			return false
		end
	else
		if(self.group == gr)then
			return true
		elseif(self.inherits == gr)then
			return true
		elseif(self.inherits == 'superadmin')then
			return true
		else
			if(self.inherits == 'user')then
				return false
			else
				return groups[self.inherits]:canTarget(gr)
			end
		end
	end
end

-- Default groups
user = Group("user", "")
admin = Group("admin", "user")
superadmin = Group("superadmin", "admin")

-- Custom groups
AddEventHandler("modest:addGroup", function(group, inherit, cb)
	if(inherit == 'user')then
		admin.inherits = group
	end

	local rtVal = Group(group, inherit)

	cb(rtVal)
end)

-- Get all groups
AddEventHandler("modest:getAllGroups", function(cb)
	cb(groups)
end)
