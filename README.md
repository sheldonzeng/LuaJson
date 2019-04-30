# LuaJson
`lua专用的json,encode性能略差于cjson，decode性能和cjson无差别`  
`encode/decode一个8000行540个元素的table 100次的总耗时和平均耗时：`  
>encode count: 	100	, sum time: 	1.99	, avg time: 	0.0199  
>decode count: 	100	, sum time: 	0.48	, avg time: 	0.0048  
