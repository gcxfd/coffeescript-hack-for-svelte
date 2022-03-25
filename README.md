<!-- 本文件由 ./readme.make.md 自动生成，请不要直接修改此文件 -->

# @rmw/coffeescript-hack-for-svelte

Make coffeescript support :label syntax, so it can be used for [svelte](https://svelte.dev).

It's too hard to modify the compiler based on lex, ast, and I did this based on string substitution.

Just a quick note, this is a crude hack, but it does work.

I look forward to coffee officially adding this syntax.

##  Install

```yarn add @rmw/coffeescript-hack-for-svelte ``` or ``` npm install @rmw/coffeescript-hack-for-svelte```

## Use

```
#!/usr/bin/env coffee

import CoffeeScript from "coffeescript"
import hack from '@rmw/coffee-svelte-hack'
hack CoffeeScript

console.log CoffeeScript.compile(
  """
=>
  :$ x=y*2

  :$ if y>2 then x+=y else x-=y

  :$
    if x > y
      x = y/2
    else
      x = y+9
    x += 1

  :out
  for i in [1,2,3]
    for j in [4,5,6]
      console.log i,j
      if i > 1
        break out
  """
  bare:true
)
```

output :

```
(() => {
  var i, j, k, len, ref, results, x;
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
  out:
  ref = [1, 2, 3];
  results = [];
  for (k = 0, len = ref.length; k < len; k++) {
    i = ref[k];
    results.push((function() {
      var l, len1, ref1, results1;
      ref1 = [4, 5, 6];
      results1 = [];
      for (l = 0, len1 = ref1.length; l < len1; l++) {
        j = ref1[l];
        console.log(i, j);
        if (i > 1) {
          results1.push(break out);
        } else {
          results1.push(void 0);
        }
      }
      return results1;
    })());
  }
  return results;
});
```


## 中文说明

让 coffeescript 支持 :label 语法，这样就可以用于 [svelte](https://svelte.dev) 。

基于 lex 、 ast 去修改编译器太难了，我基于字符串替换做到这个功能。

说一声，这只是一个粗糙的hack。但它的确能工作。

期待coffee正式加入此语法。

## 关于

本项目隶属于**人民网络([rmw.link](//rmw.link))** 代码计划。

![人民网络](https://raw.githubusercontent.com/rmw-link/logo/master/rmw.red.bg.svg)