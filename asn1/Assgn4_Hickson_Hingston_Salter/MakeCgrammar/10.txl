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

define print_statement
    printf([stringlit][opt variable_list]); [NL]
end define

define scan_statement
    scanf([stringlit],&[id]); [NL]
end define

define return_statement
    return [return_value]; [NL][EX]
end define

define if_statement
    if ([conditional]) [NL]
    [IN] [variable_assignment] [EX] 
    [opt else_statement]
end define

define else_statement
    else [NL]
    [IN] [variable_assignment] [EX]
end define

define conditional
    [id] > [number]
end define

define return_value
    [number]
end define

% Rules:
function main
    match [program]
    P[program]
end function
