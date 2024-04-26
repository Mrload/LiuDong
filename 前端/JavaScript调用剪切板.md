
## navigator

[解释]([Navigator：clipboard 属性 - Web API | MDN (mozilla.org)](https://developer.mozilla.org/zh-CN/docs/Web/API/Navigator/clipboard))

**必须在安全域名下才可以**
http  localhost

## 用dom

```javascript
const input = document.createElement('input') 
input.value = text 
document.body.appendChild(input) 
input.select() 
document.execCommand('copy') 
document.body.removeChild(input)
```
