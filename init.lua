local timer = 0

-- 16進数カラーコード（#FFFFFF形式）をLuanti用の数値（0xFFFFFF形式）に変換する関数
local function hex_to_number(hex_str)
    if not hex_str then return nil end
    -- #を取り除き、大文字小文字を無視して16進数の文字列を数値に変換
    local clean_hex = hex_str:gsub("#", "")
    local num = tonumber(clean_hex, 16)
    return num
end

minetest.register_globalstep(function(dtime)
    timer = timer + dtime
    if timer < 0.5 then return end
    timer = 0

    -- Luantiの設定画面から設定値を安全に取得する（ドット繋ぎの関数を使用）
    local prot_x   = tonumber(minetest.settings:get("hud_fix_protector_x")) or 8
    local prot_y   = tonumber(minetest.settings:get("hud_fix_protector_y")) or -20
    local prot_col = hex_to_number(minetest.settings:get("hud_fix_protector_color") or "#FFFF22")

    local areas_x   = tonumber(minetest.settings:get("hud_fix_areas_x")) or 5
    local areas_y   = tonumber(minetest.settings:get("hud_fix_areas_y")) or -45
    local areas_col = hex_to_number(minetest.settings:get("hud_fix_areas_color") or "#FFFFFF")

    -- 全プレイヤーのHUDを走査
    for _, player in pairs(minetest.get_connected_players()) do
        local all_huds = player:hud_get_all() or {}
        
        for hud_id, def in pairs(all_huds) do
            if type(hud_id) == "number" and type(def) == "table" then
                
                -- 1. protector redo のHUD処理
                if def.name == "Protector Area" then
                    -- 位置、オフセット、色のいずれかが設定値と異なる場合に更新
                    if def.position and (def.position.y ~= 1 or def.offset.x ~= prot_x or def.offset.y ~= prot_y or def.number ~= prot_col) then
                        player:hud_change(hud_id, "position", { x = 0, y = 1 })
                        player:hud_change(hud_id, "offset", { x = prot_x, y = prot_y })
                        if prot_col then
                            player:hud_change(hud_id, "number", prot_col)
                        end
                    end
                    
                -- 2. areas のHUD処理
                elseif def.position and def.position.x == 0 and def.position.y == 1 and def.name ~= "Protector Area" then
                    -- 位置、オフセット、色のいずれかが設定値と異なる場合に更新
                    if def.offset and (def.offset.x ~= areas_x or def.offset.y ~= areas_y or def.number ~= areas_col) then
                        player:hud_change(hud_id, "offset", { x = areas_x, y = areas_y })
                        if areas_col then
                            player:hud_change(hud_id, "number", areas_col)
                        end
                    end
                end
                
            end
        end
    end
end)

minetest.log("action", "[hud_fix] 設定対応型・リアルタイムHUD調停システムを起動しました。")
