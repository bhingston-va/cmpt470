% Grammar:
define program
    [c_function]
end define

define variable_type
    int 
    | float
    | char
end define

keys
    const unsigned signed
end keys

compounds
    && || ==
end compounds

define c_function
    [function_head] [NL]
    { [NL][IN]
      [function_body]
    }
end define

define function_head
    [return_type] [function_name]()
end define

define function_name
    [id]
end define

define function_body
    [repeat variable_declaration]
    [repeat scan_statement]
    [repeat variable_assignment]
    [repeat if_statement]
    [repeat print_statement]
    [return_statement]
end define

define return_type
    int
end define

define variable_declaration
    [opt key] [variable_type] [id][repeat variable_list]; [NL]
end define

define variable_list
    ,[id]
end define

define variable_assignment
    [opt key] [opt variable_type] [id] = [expression]; [NL]
    | [opt key] [opt variable_type] [id] = [charlit]; [NL]
end define

define expression
    [id]
    | [number]
    | [id] [op] [number]
end define

define op
    +|-|*
end define

define and_or
    '&& | '||
end define

define comparison_op
    > | ==
end define

define print_statement
    printf([stringlit][opt variable_list]); [NL]
end define

define scan_statement
    scanf([stringlit],&[id]); [NL]
end define

define return_statement
    return [return_value]; [NL][EX]
end define

define return_value
    [number]
end define

define if_statement
    if ([conditional]) [NL][IN] [code_block] [EX] [opt else_statement]
    | if ([conditional]) [NL] { [NL][IN] [code_block] [EX] } [NL] [opt else_statement]
end define

define else_statement
    else [NL][IN] [code_block] [EX]
    | else [NL] { [NL][IN] [code_block] [EX] } [NL]
end define

define conditional
    [comparison]
    | [comparison] [and_or] [comparison]
end define

% TODO should be `(!(a > 0) && !(b > 0))` but is `(! (a > 0) && ! (b > 0))`
define comparison
    [id] [comparison_op] [number]
    | !([comparison])
end define

define code_block
    [opt variable_assignment]
    [opt print_statement]
end define

% Rules:
function main
    match [program]
    P[program]
end function
