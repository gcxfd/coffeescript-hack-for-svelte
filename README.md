<!-- 本文件由 ./readme.make.md 自动生成，请不要直接修改此文件 -->

# @rmw/coffee-label-patch

Make coffeescript support :label syntax (similar to [livescript](https://livescript.net)) so that it can be used for [svelte](https://svelte.dev).

It's too hard to modify the compiler based on lex, ast, and I did this based on string substitution.

This is just a crude hack, but it does work.

Expect coffee to officially add this syntax.

##  Install

```yarn add @rmw/coffee-label-patch ``` or ``` npm install @rmw/coffee-label-patch```

## Use

```coffee
#!/usr/bin/env coffee

import CoffeeScript from "coffeescript"
import hack from '@rmw/coffee-label-patch'
hack CoffeeScript

console.log CoffeeScript.compile(
  """
y = 0

:$ x=y*2

:$ if y>2 then x+=y else x-=y

:$
  if x > y
    x = y/2
  else
    x = y+9
  x += 1

do =>
  :out
    for i in [1,2,3]
      for j in [4,5,6]
        console.log i,j
        if i > 1
          break out
  return
  """
  bare:true
)
```

output :

```js
var x, y;

y = 0;

$ : x = y * 2;

$ : y > 2 ? x += y : x -= y;

$ : {
  if (x > y) {
    x = y / 2;
  } else {
    x = y + 9;
  }
  x += 1;
}

(() => {
  var i, j, k, l, len, len1, ref, ref1;
  out : {
    ref = [1, 2, 3];
    for (k = 0, len = ref.length; k < len; k++) {
      i = ref[k];
      ref1 = [4, 5, 6];
      for (l = 0, len1 = ref1.length; l < len1; l++) {
        j = ref1[l];
        console.log(i, j);
        if (i > 1) {
          break out;
        }
      }
    }
  }
})();
```

then `node test.out.js` , stdout is

```
1 4
1 5
1 6
2 4
```

## 中文说明

让 coffeescript 支持 :label 语法（类似 livescript），这样就可以用于 [svelte](https://svelte.dev) 。

基于 lex 、 ast 去修改编译器太难了，我基于字符串替换做到这个功能。

这只是一个粗糙的hack。但它的确能工作。

期待coffee正式加入此语法。

## 关于

本项目隶属于**人民网络([rmw.link](//rmw.link))** 代码计划。

![人民网络](https://raw.githubusercontent.com/rmw-link/logo/master/rmw.red.bg.svg)