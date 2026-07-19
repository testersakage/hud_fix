local timer = 0

-- 16進数カラーコード（#FFFFFF形式）をLuanti用の数値（0xFFFFFF形式）に変換する関数
local function hex_to_number(hex_str)
    if not hex_str then return nil end
    local clean_hex = hex_str:gsub("#", "")
    local num = tonumber(clean_hex, 16)
    return num
end

minetest.register_globalstep(function(dtime)
    timer = timer + dtime
    if timer < 0.5 then return end
    timer = 0

    -- Luantiの設定画面から各設定値を安全に取得（新しい配置用の初期値を適用）
    local prot_x   = tonumber(minetest.settings:get("hud_fix_protector_x")) or 8
    local prot_y   = tonumber(minetest.settings:get("hud_fix_protector_y")) or -20
    local prot_col = hex_to_number(minetest.settings:get("hud_fix_protector_color") or "#FFFF22")

    local chunk_x   = tonumber(minetest.settings:get("hud_fix_chunk_x")) or 8
    local chunk_y   = tonumber(minetest.settings:get("hud_fix_chunk_y")) or -40
    local chunk_col = hex_to_number(minetest.settings:get("hud_fix_chunk_color") or "#FFFFFF")

    local areas_x   = tonumber(minetest.settings:get("hud_fix_areas_x")) or 5
    local areas_y   = tonumber(minetest.settings:get("hud_fix_areas_y")) or -85
    local areas_col = hex_to_number(minetest.settings:get("hud_fix_areas_color") or "#FFFFFF")

    -- 全プレイヤーのHUDを走査
    for _, player in pairs(minetest.get_connected_players()) do
        local all_huds = player:hud_get_all() or {}
        
        for hud_id, def in pairs(all_huds) do
            if type(hud_id) == "number" and type(def) == "table" then
                
                -- 1. protector redo のHUD処理 (画面左最下段 / 1行目)
                if def.name == "Protector Area" then
                    if def.position and (def.position.y ~= 1 or def.offset.x ~= prot_x or def.offset.y ~= prot_y or def.number ~= prot_col) then
                        player:hud_change(hud_id, "position", { x = 0, y = 1 })
                        player:hud_change(hud_id, "offset", { x = prot_x, y = prot_y })
                        if prot_col then player:hud_change(hud_id, "number", prot_col) end
                    end
                    
                -- 2. chunk_protect のHUD処理 (画面左下 / 2行目)
                elseif def.text and string.find(def.text, "^Chunk:") then
                    if def.position and (def.position.x ~= 0 or def.position.y ~= 1 or def.offset.x ~= chunk_x or def.offset.y ~= chunk_y or def.number ~= chunk_col) then
                        player:hud_change(hud_id, "position", { x = 0, y = 1 })
                        player:hud_change(hud_id, "alignment", { x = 1, y = -1 })
                        player:hud_change(hud_id, "offset", { x = chunk_x, y = chunk_y })
                        if chunk_col then player:hud_change(hud_id, "number", chunk_col) end
                    end

                -- 3. areas のHUD処理 (画面左、chunkのさらに上 / 3行目以降)
                elseif def.position and def.position.x == 0 and def.position.y == 1 and def.name ~= "Protector Area" then
                    -- chunk_protect を誤検出しないようにテキスト先頭をチェック
                    if def.text and not string.find(def.text, "^Chunk:") then
                        if def.offset and (def.offset.x ~= areas_x or def.offset.y ~= areas_y or def.number ~= areas_col) then
                            player:hud_change(hud_id, "offset", { x = areas_x, y = areas_y })
                            if areas_col then player:hud_change(hud_id, "number", areas_col) end
                        end
                    end
                end
                
            end
        end
    end
end)

minetest.log("action", "[hud_fix] 指定順序（Protector -> Chunk -> Areas）での左下配置システムを起動しました。")
