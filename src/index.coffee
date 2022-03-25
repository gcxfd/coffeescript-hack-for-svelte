#!/usr/bin/env coffee


coffee_label = (code)=>
  li = []
  code = code.split("\n")
  pre_indent = 0
  pre = 0
  -0
  `OUT: //`
  for line from code
    s = line.trimStart()
    indent = line.length - s.length
    if pre
      li.push ''.padEnd(pre_indent)+"if null #"+pre.trim()
      pre = 0

    if s.startsWith ':'
      pos = s.search /\s/
      if ~pos
        li.push ''.padEnd(indent)+'$|' + s[pos..]
      else
        pre_indent = indent
        pre = line
    else
      for word from ['break ','continue ']
        if s.startsWith(word)
          li.push line.replace(word,'`'+word)+'`'
          `continue OUT`
      li.push line
  li.join '\n'


export default hack_for_svelte = (CoffeeScript)=>
  {compile} = CoffeeScript
  compile.bind CoffeeScript
  CoffeeScript.compile = (code, ...args)=>
    code = coffee_label code

    #console.log code
    #return

    code = compile code,...args

    # console.log code

    li = []
    for line in code.split('\n')
      s = line.trimStart()
      indent = line.length - s.length
      push = (txt)=>
        li.push ''.padEnd(indent)+txt
        return

      if s.startsWith 'if (null) { //:'
        push s[15..]+' : {'
      else if s.startsWith '$ | ('
        push '$ : '+s[5...-2]+';'
      else if s.startsWith '(() => { //:'
        push s[12..]+' : ({'
      else
        li.push line
    li.join '\n'
