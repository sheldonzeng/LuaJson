--luajson.lua
local LJson = {};

local tinsert = table.insert;
local function encode_base( v , text)
    if v == nil then
        return;
    end
    local objType = type(v);
    if objType == "number" then
        tinsert(text, v);
    elseif objType == "boolean" then
        tinsert(text, v);
    elseif objType == "string" then
        tinsert(text, "\""..v.."\"");
    elseif objType == "table" then
        tinsert(text, "{");
        for k,value in pairs(v) do
            tinsert(text, "[");
            encode_base(k, text);
            tinsert(text, "]=");
            encode_base(value, text);
            tinsert(text, ",");
        end
        tinsert(text, "}");
    end
end


local function encode( t )
    if t == nil then
        return "";
    end

    local objType = type(t);

    if objType ~= "table" then
        return "return ".. t;
    end

    local text = {};
    tinsert(text, "{");
    for k,v in pairs(t) do
    	if type(v) ~= "function" and type(k) ~= "function" then
	        tinsert(text, "[");
	        encode_base(k, text);
	        tinsert(text, "]=");
	        encode_base(v, text);
	        tinsert(text, ",");
	    end
    end
    tinsert(text, "}");

    return table.concat( text, "" );

end

local function decode( str )
    if str == nil or str == "" then
        return;
    end
    local f = load("return "..str);
    if f ~= nil then
	    return f();
	end
end

LJson.encode = encode;
LJson.decode = decode;

return LJson;