;; highlight identifiers as TSVariable
((identifier) @variable)

;; keywords
((identifier) @keyword (#match? @keyword "^service$"))
((identifier) @keyword (#match? @keyword "^config$"))

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
