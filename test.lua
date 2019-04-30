--test.lua
LJson = require "luajson"

local itemInfo = require "item"

local text = LJson.encode(itemInfo);

local t1 = LJson.decode(text);

local count = 100;
local time = os.clock();
for i=1,count do
	LJson.encode(itemInfo);
end
time = os.clock()-time;
print("encode count: ",count, ", sum time: ", time, ", avg time: ", time/count)

time = os.clock();
for i=1,count do
	LJson.decode(text);
end
time = os.clock()-time;
print("decode count: ",count, ", sum time: ", time, ", avg time: ", time/count)
