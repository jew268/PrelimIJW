function get_parameter_value(parameter_path_array::Array{String,1}, model_dictionary::Dict{String, Any})

# get a key symbol –
next_key_symbol = pop!(parameter_path_array)

# recursive descend –
if (typeof(get(model_dictionary,next_key_symbol,Nothing)) == Dict{String,Any})

# get dictionary, and go down again ...
next_dictionary = model_dictionary[next_key_symbol]
return get_parameter_value(parameter_path_array, next_dictionary)
elseif (typeof(get(model_dictionary,next_key_symbol,Nothing)) == String)

# return the value –
return model_dictionary[next_key_symbol]
else
return Nothing
 end
end
function set_parameter_value(parameter_path_array::Array{String,1}, model_dictionary::Dict{String, Any}, value::String)
# get a key symbol –
next_key_symbol = pop!(parameter_path_array)

# recursive descend –
if (typeof(get(model_dictionary,next_key_symbol,Nothing)) == Dict{String,Any})
# get dictionary, and go down again ...
next_dictionary = model_dictionary[next_key_symbol]        
return set_parameter_value(parameter_path_array, next_dictionary, value)

elseif (typeof(get(model_dictionary,next_key_symbol,Nothing)) == String)

# set the new value –
model_dictionary[next_key_symbol] = value
return true
else
   return false
 end
end

