local M = {}

M.merge = function(...)
    local temp = {}
    for _, t in ipairs(...) do
        for _, v in ipairs(t) do
            table.insert(temp,v)
        end
    end
    return temp
end

return M
