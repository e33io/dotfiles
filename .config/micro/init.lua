local micro = import("micro")

-- Quit all other panes (splits) except active pane,
-- bind with "lua:initlua.quitAllOther"
function quitAllOther(bp)
    local other = {}
    local iter = micro.CurTab().Panes()
    for _, p in iter do
        if p:ID() ~= bp:ID() then
            table.insert(other, p)
        end
    end
    for _, p in pairs(other) do
        p:Quit()
    end
end
