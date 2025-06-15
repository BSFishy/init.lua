;; begin indents
[
  (list_expression)
  (block_body)
] @indent.begin

(block_body "}" @indent.branch)

;; dedent when you hit the closing delimiters
[
  "}"
  ")"
] @indent.end

