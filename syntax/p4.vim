" Vim syntax file
" Language: P4
" Maintainer: Antonin Bas, Barefoot Networks Inc
" Latest Revision: 5 August 2014

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Use case sensitive matching of keywords
syn case match

syn keyword p4TypeKeyword   typedef const bit int varbit void extern enum struct error match_kind
syn keyword p4ObjectKeyword parser table state
syn keyword p4ObjectKeyword header_type header action 
syn keyword p4ObjectKeyword field_list field_list_calculation calculated_field
syn keyword p4ObjectKeyword control package
syn keyword p4ObjectKeyword parser_value_set
syn keyword p4ObjectKeyword counter meter register

syn keyword p4SpecialKeyword start accept reject packet_in packet_out in out inout default
syn keyword p4SpecialKeyword next last latest

" Tables
syn keyword p4ObjectAttributeKeyword reads key actions default_action min_size max_size size 
" Header types
syn keyword p4ObjectAttributeKeyword fields length max_length
" Field list calculation
syn keyword p4ObjectAttributeKeyword input algorithm output_width
" Counters and meters
syn keyword p4ObjectAttributeKeyword type direct static
syn keyword p4ObjectAttributeKeyword instance_count min_width saturating

" Predefined Types, Enums, ...
syn keyword p4PredefinedEnumKeyword  exact ternary lpm range valid selector
syn keyword p4PredefinedEnumKeyword  bytes packets packets_and_bytes
syn keyword p4PredefinedEnumKeyword  crc32 crc32_custom crc16 crc16_custom random identity csum16 xor16
syn keyword p4PredefinedEnumKeyword  I2E E2E
syn keyword p4PredefinedErrorKeyword NoError PacketTooShort NoMatch StackOutOfBounds HeaderTooShort ParserTimeout ParserInvalidArgument

" Comments
syn keyword p4TODO contained FIXME TODO XXX NOTE
syn match   p4Comment  "//.*$"  contains=p4TODO
syn region  p4BlockComment  start="/\*"  end="\*/" contains=p4TODO

" Integers
syn match   p4DecimalInt "\<\d\+\([Ee]\d\+\)\?\>"
syn match   p4HexadecimalInt "\<0x\x\+\>"

" Preproc
syn region  p4File start=/</ end=/>/ contained
syn region  p4File start=/"/ end=/"/ contained
syn region  p4Preprocessor start=/#\<.\+\>/ skip=/ \\$/ end=/[^\\]*$/ contains=p4File

" header type or struct type
syn match   p4TypeDefined /\<[0-9a-z_A-Z]\+_t\>/

" @xxxx
syn match   p4Namespace /@[0-9a-zA-Z_]\+/
syn region  p4String start=/"/ skip=/\\"/ end=/"/

syn keyword p4Builtin hit miss
syn keyword p4Builtin update apply lookahead advance length emit NoAction
syn keyword p4Builtin verify extract transition set_metadata
syn keyword p4Builtin clone clone3 truncate assert assume

syn keyword p4Primitives add_header copy_header remove_header
syn keyword p4Primitives modify_field add_to_field
syn keyword p4Primitives set_field_to_hash_index

" legacy, to remove later
syn keyword p4Primitives modify_field_with_hash_based_offset
syn keyword p4Primitives count meter
syn keyword p4Primitives generate_digest
syn keyword p4Primitives resubmit recirculate
syn keyword p4Primitives clone_ingress_pkt_to_ingress
syn keyword p4Primitives clone_egress_pkt_to_ingress
syn keyword p4Primitives clone_ingress_pkt_to_egress
syn keyword p4Primitives clone_egress_pkt_to_egress

syn keyword p4Conditional if else select switch
syn keyword p4Statement return

syn keyword p4Constants P4_PARSING_DONE


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Apply highlight groups to syntax groups defined above
hi def link p4TypeKeyword               Type
hi def link p4ObjectKeyword             Type
hi def link p4Comment                   Comment
hi def link p4BlockComment              Comment
hi def link p4TODO                      Todo
hi def link p4Preprocessor              Macro
hi def link p4File                      String
hi def link p4ObjectAttributeKeyword    Keyword
hi def link p4CounterTypeKeyword        Keyword
hi def link p4DecimalInt                Number
hi def link p4HexadecimalInt            Number
hi def link p4Builtin                   Function
hi def link p4Conditional               Conditional
hi def link p4Statement                 Statement
hi def link p4Constants                 Constant
hi def link p4Primitives                Function
hi def link p4SpecialKeyword            Statement
hi def link p4String                    String
hi def link p4Namespace                 Macro
hi def link p4PredefinedEnumKeyword     LineNr
hi def link p4PredefinedErrorKeyword    WarningMsg
hi def link p4TypeDefined               MoreMsg

let b:current_syntax = "p4"
