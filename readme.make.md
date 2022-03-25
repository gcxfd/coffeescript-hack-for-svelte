# @rmw/coffee-svelte-hack

Make coffeescript support :label syntax, so it can be used for [svelte](https://svelte.dev).

It's too hard to modify the compiler based on lex, ast, and I did this based on string substitution.

Just a quick note, this is a crude hack, but it does work.

I look forward to coffee officially adding this syntax.

##  Install

```yarn add @rmw/coffee-svelte-hack ``` or ``` npm install @rmw/coffee-svelte-hack```

## Use

```coffee
#include ./test/index.coffee
```

output :

```js
#include ./test.out.js
```


## 中文说明

让 coffeescript 支持 :label 语法，这样就可以用于 [svelte](https://svelte.dev) 。

基于 lex 、 ast 去修改编译器太难了，我基于字符串替换做到这个功能。

说一声，这只是一个粗糙的hack。但它的确能工作。

期待coffee正式加入此语法。

## 关于

本项目隶属于**人民网络([rmw.link](//rmw.link))** 代码计划。

![人民网络](https://raw.githubusercontent.com/rmw-link/logo/master/rmw.red.bg.svg)
