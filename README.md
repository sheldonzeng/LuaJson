# LuaJson
lua专用的json,'encode'性能略差于cjson，'decode'性能和cjson无差别  
encode/decode一个'8000行540个元素的table'，'100'次的总耗时和平均耗时：  
>encode count: 	100	, sum time: 	1.99	, avg time: 	0.0199  
>decode count: 	100	, sum time: 	0.48	, avg time: 	0.0048  
