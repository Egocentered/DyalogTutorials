﻿ start;i

⍝ ⎕←'Let''s try something simple:'
⍝Intro:
⍝ 'Type ''1+1'' and press Enter...'
⍝ ⍝ TODO: Set proper traps
⍝ ⍝ Use safe executor
⍝ input←⍞
⍝ :If '1+1'≡input~' '
⍝     'Well done you!'
⍝     'one plus one is...'
⍝     ⎕←2
⍝     '... two!'
⍝ :ElseIf ∨/'÷-+×'∊input   ⍝ ^.*[÷-+×].*$
⍝     :Trap 0
⍝         ⎕←⍎input
⍝     :Else
⍝         →Intro
⍝     :EndTrap
⍝     ⎕←'Yeah, or you could do that I suppose.'
⍝ :Else
⍝     'Hmmmm...'
⍝     →Intro
⍝ :EndIf
⍝ 'That''s all for now!'

 Random←{⍵⊃⍨?≢⍵}
 ReactionTo←{1⊣⎕←(Random ⍺)⊣⎕←⍎⍵}
 Has←{×≢⍵ ⎕S 0⊢⍺}

 Gives←{
     patterns←,⊆⍵
     ⎕←⍺
     input←⍞
     '→'∊input:0
     input Has⊃patterns:PERFECT ReactionTo input
     input Has 1↓patterns:OK ReactionTo input
     ⎕←Random WRONG
     ⍺ ∇ ⍵
 }
 :For i :In ⍴PROMPT
     :If i⌷PROMPT Gives i⌷EXPECTED
     :AndIf 1
         ⎕←'Well done!'
     :Else
         ⎕←'Bye!'
     :EndIf
 :EndFor
 :If 'Type ''1+1'' and press Enter...'Gives'1\+1' '^.*[-÷+×].*$'
 :AndIf 1
     ⎕←'Well done!'
 :Else
     ⎕←'Bye!'
 :EndIf
