module.exports = grammar({
  name: "mora",

  // Allow whitespace and comments between tokens
  extras: ($) => [
    /\s/, // whitespace
    $.comment, // line comments
  ],

  // Define the root of the syntax tree
  rules: {
    source_file: ($) => repeat($.item),

    // An item is either a simple statement or a block
    item: ($) => choice($.statement, $.block),

    // Simple assignments: identifier = expression;
    statement: ($) =>
      seq(field("name", $.identifier), "=", field("value", $.expression), ";"),

    // Blocks: ( ... ) { items... }
    block: ($) =>
      seq(field("header", repeat($.expression)), field("body", $.block_body)),

    // A list-expression: '(' expressions* ')'
    list_expression: ($) => seq("(", repeat($.expression), ")"),

    // Block body: '{' items* '}'
    block_body: ($) => seq("{", repeat($.item), "}"),

    // Expressions are atoms or list-expressions
    expression: ($) => choice($.atom, $.list_expression),

    // Atoms: identifier, string literal, or number
    atom: ($) => choice($.string, $.number, $.identifier),

    // Lexical definitions
    identifier: ($) => /[A-Za-z_]\w*/, // matches identifiers
    number: ($) => /-?\d+(?:\.\d+)?/, // integers and floats
    string: ($) =>
      token(seq('"', repeat(choice(/[^"\\]/, seq("\\", /./))), '"')), // double-quoted strings
    comment: ($) => token(seq("//", /.*/)), // line comments
  },
});
