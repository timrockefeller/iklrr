local function class(className, super)
    local clazz = { __cname = className, super = super }
    local meta = {}
    meta.__call = function(...)
        local instance = {}
        setmetatable(instance, { __index = clazz })
        if clazz.Ctor then
            clazz.Ctor(instance, ...)
        end
        return instance
    end
    if super then
        meta.__index = super
    end
    setmetatable(clazz, meta)
    return clazz
end

_G.Class = class
