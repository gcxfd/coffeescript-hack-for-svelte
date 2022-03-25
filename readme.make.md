# @rmw/coffee-label-patch

Make coffeescript support :label syntax (similar to [livescript](https://livescript.net)) so that it can be used for [svelte](https://svelte.dev).

It's too hard to modify the compiler based on lex, ast, and I did this based on string substitution.

This is just a crude hack, but it does work.

Expect coffee to officially add this syntax.

##  Install

```yarn add @rmw/coffee-label-patch ``` or ``` npm install @rmw/coffee-label-patch```

## Use

```coffee
#include ./test/index.coffee
```

output :

```js
#include ./test.out.js
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
