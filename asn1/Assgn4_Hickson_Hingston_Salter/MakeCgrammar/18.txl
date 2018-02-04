% Grammar:
define program
    [repeat c_include] [NL]

    [c_function]
end define

comments
    //
    /* */
end comments

define c_include
    '#'include<[id]'.h> [NL]
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
    && || == <= ++
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
    [code_block]
    [return_statement]
end define

define statement
    [variable_declaration]
    | [variable_assignment]
    | [scan_statement]
    | [print_statement]
    | [if_statement]
    | [switch_statement]
    | [loops]
    | break; [NL]
    | continue; [NL]
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
    | [id]++; [NL]
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
    > | == | <= | <
end define

define id_or_number
    [id]
    | [number]
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
    if ([conditional]) [NL][IN] [statement] [EX] [opt else_statement]
    | if ([conditional]) [NL] { [NL][IN] [code_block] [EX] } [NL] [opt else_statement]
end define

define else_statement
    else [NL][IN] [statement] [EX]
    | else [NL][IN] [code_block] [EX]
    | else [NL] { [NL][IN] [code_block] [EX] } [NL]
end define

define conditional
    [comparison]
    | [comparison] [and_or] [comparison]
end define

define comparison
    [id] [comparison_op] [number]
    | [id] [comparison_op] [id]
    | !([comparison])
end define

define code_block
    [repeat statement]
end define

define switch_statement
    switch ([id]) [NL] { [NL][IN] [repeat case_statement] [EX] } [NL]
end define

define case_statement
    case [charlit]: [NL][IN] [print_statement] break; [NL][EX]
    | default: [NL][IN] [print_statement] [EX]
end define

define loops
    [for_loop] | [while_loop]
end define

define for_loop
    for ([id] = [id_or_number];[comparison];[opt ++][id][opt ++]) [opt {] [NL][IN]
        [statement]
    [EX] [opt }]
    [opt statement] [NL]
end define

define while_loop
    while ([conditional]) [NL] { [NL][IN] [code_block] [EX]} [NL]
    | do [NL] { [NL][IN] [code_block] [EX] } [NL] while ([conditional]); [NL]
end define

% Rules:
function main
    match [program]
    P[program]
end function
