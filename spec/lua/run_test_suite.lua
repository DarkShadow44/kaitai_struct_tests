#!/usr/bin/env lua

local luaunit = require("luaunit")

function srequire(t)
    local success, err = xpcall(require, require_err_handler(t), t)
    return success
end

function require_err_handler(t)
    return function(err)
        local first = t:sub(1, 1)
        local rest = t:sub(2)
        local class_name = first:upper() .. rest:gsub("_(%l)", function(c) return c:upper() end)
        _G[class_name] = {}
        _G[class_name][t] = function()
            luaunit.fail(err)
        end
    end
end

-- List all test files here
srequire("test_bcd_user_type_be")
srequire("test_bcd_user_type_le")
srequire("test_bits_byte_aligned")
srequire("test_bits_enum")
srequire("test_bits_simple")
srequire("test_buffered_struct")
srequire("test_bytes_pad_term")
srequire("test_cast_nested")
srequire("test_cast_to_imported")
srequire("test_cast_to_top")
srequire("test_debug_0")
srequire("test_debug_enum_name")
srequire("test_debug_switch_user")
srequire("test_default_big_endian")
srequire("test_default_endian_expr_exception")
srequire("test_default_endian_expr_inherited")
srequire("test_default_endian_expr_is_be")
srequire("test_default_endian_expr_is_le")
srequire("test_default_endian_mod")
srequire("test_docstrings_docref")
srequire("test_docstrings_docref_multi")
srequire("test_docstrings")
srequire("test_enum_0")
srequire("test_enum_1")
srequire("test_enum_deep")
srequire("test_enum_deep_literals")
srequire("test_enum_fancy")
srequire("test_enum_for_unknown_id")
srequire("test_enum_if")
srequire("test_enum_import")
srequire("test_enum_int_range_s")
srequire("test_enum_int_range_u")
srequire("test_enum_long_range_s")
srequire("test_enum_long_range_u")
srequire("test_enum_negative")
srequire("test_enum_of_value_inst")
srequire("test_enum_to_i")
srequire("test_enum_to_i_class_border_1")
srequire("test_eof_exception_bytes")
srequire("test_eof_exception_u4")
srequire("test_eos_exception_bytes")
srequire("test_eos_exception_u4")
srequire("test_expr_0")
srequire("test_expr_1")
srequire("test_expr_2")
srequire("test_expr_3")
srequire("test_expr_array")
srequire("test_expr_bytes_cmp")
srequire("test_expr_bytes_ops")
srequire("test_expr_calc_array_ops")
srequire("test_expr_enum")
srequire("test_expr_io_eof")
srequire("test_expr_io_pos")
srequire("test_expr_mod")
srequire("test_expr_sizeof_type_0")
srequire("test_expr_sizeof_type_1")
srequire("test_expr_sizeof_value_0")
srequire("test_expr_sizeof_value_sized")
srequire("test_expr_str_ops")
--srequire("test_fixed_contents")
--srequire("test_fixed_struct")
srequire("test_floating_points")
srequire("test_float_to_i")
srequire("test_hello_world")
srequire("test_if_instances")
srequire("test_if_struct")
srequire("test_if_values")
srequire("test_imports0")
srequire("test_imports_abs")
srequire("test_imports_abs_abs")
srequire("test_imports_abs_rel")
srequire("test_imports_rel_1")
srequire("test_index_sizes")
srequire("test_index_to_param_eos")
srequire("test_index_to_param_expr")
srequire("test_index_to_param_until")
srequire("test_instance_io_user")
srequire("test_instance_std")
srequire("test_instance_std_array")
srequire("test_instance_user_array")
srequire("test_io_local_var")
srequire("test_js_signed_right_shift")
srequire("test_meta_tags")
srequire("test_meta_xref")
srequire("test_multiple_use")
srequire("test_nav_parent")
srequire("test_nav_parent2")
srequire("test_nav_parent3")
srequire("test_nav_parent_false")
srequire("test_nav_parent_false2")
srequire("test_nav_parent_override")
srequire("test_nav_parent_switch")
srequire("test_nav_parent_switch_cast")
srequire("test_nav_parent_vs_value_inst")
srequire("test_nav_root")
srequire("test_nested_same_name")
srequire("test_nested_same_name2")
srequire("test_nested_types")
srequire("test_nested_types2")
srequire("test_nested_types3")
srequire("test_non_standard")
srequire("test_opaque_external_type")
srequire("test_opaque_external_type_02_parent")
srequire("test_opaque_with_param")
srequire("test_optional_id")
srequire("test_params_call_extra_parens")
srequire("test_params_call_short")
srequire("test_params_def")
srequire("test_params_enum")
srequire("test_params_pass_usertype")
srequire("test_position_abs")
srequire("test_position_in_seq")
srequire("test_position_to_end")
srequire("test_process_coerce_bytes")
srequire("test_process_coerce_switch")
srequire("test_process_coerce_usertype1")
srequire("test_process_coerce_usertype2")
srequire("test_process_custom")
srequire("test_process_custom_no_args")
srequire("test_process_repeat_bytes")
srequire("test_process_repeat_usertype")
srequire("test_process_rotate")
srequire("test_process_to_user")
srequire("test_process_xor4_const")
srequire("test_process_xor4_value")
srequire("test_process_xor_const")
srequire("test_process_xor_value")
srequire("test_recursive_one")
srequire("test_repeat_eos_bit")
srequire("test_repeat_eos_struct")
srequire("test_repeat_eos_u4")
srequire("test_repeat_n_struct")
srequire("test_repeat_n_strz_double")
srequire("test_repeat_n_strz")
srequire("test_repeat_until_complex")
srequire("test_repeat_until_s4")
srequire("test_repeat_until_sized")
srequire("test_str_combine")
--srequire("test_str_encodings")         -- Only ASCII and UTF-8 encodings supported
--srequire("test_str_encodings_default") -- Only ASCII and UTF-8 encodings supported
srequire("test_str_eos")
srequire("test_str_literals")
srequire("test_str_literals2")
srequire("test_str_pad_term")
srequire("test_str_pad_term_empty")
srequire("test_switch_bytearray")
srequire("test_switch_cast")
srequire("test_switch_else_only")
srequire("test_switch_integers")
srequire("test_switch_integers2")
srequire("test_switch_manual_enum")
srequire("test_switch_manual_enum_invalid")
srequire("test_switch_manual_enum_invalid_else")
srequire("test_switch_manual_int")
srequire("test_switch_manual_int_else")
srequire("test_switch_manual_int_size")
srequire("test_switch_manual_int_size_else")
srequire("test_switch_manual_int_size_eos")
srequire("test_switch_manual_str")
srequire("test_switch_manual_str_else")
srequire("test_switch_multi_bool_ops")
srequire("test_switch_repeat_expr")
srequire("test_term_bytes")
srequire("test_term_strz")
srequire("test_ts_packet_header")
srequire("test_type_ternary")
srequire("test_type_int_unary_op")
srequire("test_type_ternary_opaque")
srequire("test_user_type")
srequire("test_yaml_ints")

-- Execute the test cases
local runner = luaunit.LuaUnit.new()
os.exit(runner:runSuite())
