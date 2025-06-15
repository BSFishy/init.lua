;; highlight identifiers as TSVariable
((identifier) @variable)

;; keywords
((identifier) @keyword
  (#any-of? @keyword
    "service"
    "config"
  )
)

;; make keywords inside of list expressions
((list_expression (expression (atom (identifier) @keyword)))
  (#any-of? @keyword
    "image"
    "config"
  )
)

;; numbers and floats
((number) @number)

;; string literals
((string) @string)

;; line comments
((comment) @comment)

;; operators (e.g. “=“)
("=") @operator

;; punctuation
("(") @punctuation.delimiter
(")") @punctuation.delimiter
("{" ) @punctuation.bracket
("}") @punctuation.bracket
(";" ) @punctuation.delimiter
