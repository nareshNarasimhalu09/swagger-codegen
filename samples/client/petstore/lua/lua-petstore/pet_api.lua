/* 
 * Swagger Petstore
 *
 * This is a sample server Petstore server.  You can find out more about Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).  For this sample, you can use the api key `special-key` to test the authorization filters.
 *
 * OpenAPI spec version: 1.0.0
 * Contact: apiteam@swagger.io
 * Generated by: https://github.com/swagger-api/swagger-codegen.git
 */

//package petstore

local http_request = require "http.request"
local http_util = require "http.util"
local dkjson = require "dkjson"

// model import
local petstore_pet_api = require "petstore.pet_api"

local petstore= {}
local petstore_mt = {
  __name = "";
  __index = petstore;
}

local function new_pet_api(host, basePath, schemes)
  local schemes_map = {}
  for _,v in ipairs(schemes) do
    schemes_map[v] = v
  end
  local default_scheme = schemes_map.https or schemes_map.http
  // TODO: default basePath to http://petstore.swagger.io/v2
  return setmetatable({
    host = host;
    basePath = basePath or "http://petstore.swagger.io/v2";
    schemes = schemes_map;
    default_scheme = default_scheme;
  }, petstore_mt)
end

function pet_api:add_pet(body)
    local req = http_request.new_from_uri({
        scheme = self.default_scheme;
        host = self.host;
        path = string.format("%s/pet", self.basePath);
    })

    // set HTTP verb
    req.headers:upsert(":method", "POST")

    // TODO: create a function to select proper accept
    local var_accept = { "application/json", "application/xml" }
    req.headers:upsert("accept", "application/json")

    // TODO: create a function to select proper content-type
    local var_accept = { "application/xml", "application/json" }
    req.headers:upsert("content-type", "application/xml")




    // TODO oauth

    // make the HTTP call
    local headers, stream, errno = req:go()
    if not headers then
        return nil, stream, errno
    end
    local http_status = headers:get(":status")
    if http_status:sub(1,1) == "2" then
        return nil, headers
    else
        local body, err, errno2 = stream:get_body_as_string()
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        // return the error message (http body)
        return nil, http_status, body
    end
end

function pet_api:delete_pet(pet_id, )
    local req = http_request.new_from_uri({
        scheme = self.default_scheme;
        host = self.host;
        path = string.format("%s/pet/%s", self.basePath ,pet_id);
    })

    // set HTTP verb
    req.headers:upsert(":method", "DELETE")

    // TODO: create a function to select proper accept
    local var_accept = {  }
    req.headers:upsert("accept", )

    // TODO: create a function to select proper content-type
    local var_accept = { "application/xml", "application/json" }
    req.headers:upsert("content-type", "application/xml")

    req.headers:upsert("api_key", api_key)



    // TODO oauth

    // make the HTTP call
    local headers, stream, errno = req:go()
    if not headers then
        return nil, stream, errno
    end
    local http_status = headers:get(":status")
    if http_status:sub(1,1) == "2" then
        return nil, headers
    else
        local body, err, errno2 = stream:get_body_as_string()
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        // return the error message (http body)
        return nil, http_status, body
    end
end

function pet_api:find_pets_by_status(status)
    local req = http_request.new_from_uri({
        scheme = self.default_scheme;
        host = self.host;
        path = string.format("%s/pet/findByStatus", self.basePath);
    })

    // set HTTP verb
    req.headers:upsert(":method", "GET")

    // TODO: create a function to select proper accept
    local var_accept = {  }
    req.headers:upsert("accept", )

    // TODO: create a function to select proper content-type
    local var_accept = { "application/xml", "application/json" }
    req.headers:upsert("content-type", "application/xml")



    // TODO query params status (status)

    // TODO oauth

    // make the HTTP call
    local headers, stream, errno = req:go()
    if not headers then
        return nil, stream, errno
    end
    local http_status = headers:get(":status")
    if http_status:sub(1,1) == "2" then
        local body, err, errno2 = stream:get_body_as_string()
        // exception when getting the HTTP body
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        local result, _, err3 = dkjson.decode(body)
        // exception when decoding the HTTP body
        if result == nil then
            return nil, err3
        end
        return petstore_{}.cast(result), headers
    else
        local body, err, errno2 = stream:get_body_as_string()
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        // return the error message (http body)
        return nil, http_status, body
    end
end

function pet_api:find_pets_by_tags(tags)
    local req = http_request.new_from_uri({
        scheme = self.default_scheme;
        host = self.host;
        path = string.format("%s/pet/findByTags", self.basePath);
    })

    // set HTTP verb
    req.headers:upsert(":method", "GET")

    // TODO: create a function to select proper accept
    local var_accept = {  }
    req.headers:upsert("accept", )

    // TODO: create a function to select proper content-type
    local var_accept = { "application/xml", "application/json" }
    req.headers:upsert("content-type", "application/xml")



    // TODO query params tags (tags)

    // TODO oauth

    // make the HTTP call
    local headers, stream, errno = req:go()
    if not headers then
        return nil, stream, errno
    end
    local http_status = headers:get(":status")
    if http_status:sub(1,1) == "2" then
        local body, err, errno2 = stream:get_body_as_string()
        // exception when getting the HTTP body
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        local result, _, err3 = dkjson.decode(body)
        // exception when decoding the HTTP body
        if result == nil then
            return nil, err3
        end
        return petstore_{}.cast(result), headers
    else
        local body, err, errno2 = stream:get_body_as_string()
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        // return the error message (http body)
        return nil, http_status, body
    end
end

function pet_api:get_pet_by_id(pet_id)
    local req = http_request.new_from_uri({
        scheme = self.default_scheme;
        host = self.host;
        path = string.format("%s/pet/%s", self.basePath ,pet_id);
    })

    // set HTTP verb
    req.headers:upsert(":method", "GET")

    // TODO: create a function to select proper accept
    local var_accept = {  }
    req.headers:upsert("accept", )

    // TODO: create a function to select proper content-type
    local var_accept = { "application/xml", "application/json" }
    req.headers:upsert("content-type", "application/xml")




    //TODO 'api_key'
    // api key in headers 'api_key'

    // make the HTTP call
    local headers, stream, errno = req:go()
    if not headers then
        return nil, stream, errno
    end
    local http_status = headers:get(":status")
    if http_status:sub(1,1) == "2" then
        local body, err, errno2 = stream:get_body_as_string()
        // exception when getting the HTTP body
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        local result, _, err3 = dkjson.decode(body)
        // exception when decoding the HTTP body
        if result == nil then
            return nil, err3
        end
        return petstore_pet.cast(result), headers
    else
        local body, err, errno2 = stream:get_body_as_string()
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        // return the error message (http body)
        return nil, http_status, body
    end
end

function pet_api:update_pet(body)
    local req = http_request.new_from_uri({
        scheme = self.default_scheme;
        host = self.host;
        path = string.format("%s/pet", self.basePath);
    })

    // set HTTP verb
    req.headers:upsert(":method", "PUT")

    // TODO: create a function to select proper accept
    local var_accept = { "application/json", "application/xml" }
    req.headers:upsert("accept", "application/json")

    // TODO: create a function to select proper content-type
    local var_accept = { "application/xml", "application/json" }
    req.headers:upsert("content-type", "application/xml")




    // TODO oauth

    // make the HTTP call
    local headers, stream, errno = req:go()
    if not headers then
        return nil, stream, errno
    end
    local http_status = headers:get(":status")
    if http_status:sub(1,1) == "2" then
        return nil, headers
    else
        local body, err, errno2 = stream:get_body_as_string()
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        // return the error message (http body)
        return nil, http_status, body
    end
end

function pet_api:update_pet_with_form(pet_id, )
    local req = http_request.new_from_uri({
        scheme = self.default_scheme;
        host = self.host;
        path = string.format("%s/pet/%s", self.basePath ,pet_id);
    })

    // set HTTP verb
    req.headers:upsert(":method", "POST")

    // TODO: create a function to select proper accept
    local var_accept = { "application/x-www-form-urlencoded" }
    req.headers:upsert("accept", "application/x-www-form-urlencoded")

    // TODO: create a function to select proper content-type
    local var_accept = { "application/xml", "application/json" }
    req.headers:upsert("content-type", "application/xml")


    req:set_body(http_util.dict_to_query({
        ["name"] = name;
        ["status"] = status;
    }))


    // TODO oauth

    // make the HTTP call
    local headers, stream, errno = req:go()
    if not headers then
        return nil, stream, errno
    end
    local http_status = headers:get(":status")
    if http_status:sub(1,1) == "2" then
        return nil, headers
    else
        local body, err, errno2 = stream:get_body_as_string()
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        // return the error message (http body)
        return nil, http_status, body
    end
end

function pet_api:upload_file(pet_id, )
    local req = http_request.new_from_uri({
        scheme = self.default_scheme;
        host = self.host;
        path = string.format("%s/pet/%s/uploadImage", self.basePath ,pet_id);
    })

    // set HTTP verb
    req.headers:upsert(":method", "POST")

    // TODO: create a function to select proper accept
    local var_accept = { "multipart/form-data" }
    req.headers:upsert("accept", "multipart/form-data")

    // TODO: create a function to select proper content-type
    local var_accept = { "application/json" }
    req.headers:upsert("content-type", "application/json")


    req:set_body(http_util.dict_to_query({
        ["additionalMetadata"] = additional_metadata;
        ["file"] = file;
    }))


    // TODO oauth

    // make the HTTP call
    local headers, stream, errno = req:go()
    if not headers then
        return nil, stream, errno
    end
    local http_status = headers:get(":status")
    if http_status:sub(1,1) == "2" then
        local body, err, errno2 = stream:get_body_as_string()
        // exception when getting the HTTP body
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        local result, _, err3 = dkjson.decode(body)
        // exception when decoding the HTTP body
        if result == nil then
            return nil, err3
        end
        return petstore_api_response.cast(result), headers
    else
        local body, err, errno2 = stream:get_body_as_string()
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        // return the error message (http body)
        return nil, http_status, body
    end
end

