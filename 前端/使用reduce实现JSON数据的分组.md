```javascript
const arr = [{...},{...}]
const jsn = arr.reduce((acc,item) => {
	if(!acc[item.key_name]){
		acc[item.key_name] = []
	}
	acc[item.key_name].push(item)
	return acc
},{})
```
