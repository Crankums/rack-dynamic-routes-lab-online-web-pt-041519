# class Application
#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)
#
#     if req.path.match(/items/)
#       item_name = req.path.split("/items/").last
#       item = @@items.find{|i| i.name == item_name} #why is this not a '=='?
#       if item != nil
#         resp.write item.price
#       else
#         resp.write "Item not found"
#         resp.status = 400
#       end
#     else
#       resp.write "Route not found"
#       resp.status = 404
#     end
#     resp.finish
#   end
# end
class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.include?("/items/")
      requested_item = req.path.split("/items/").last
      found_item = @@item.find {|i| i.name == requested_item }
      # binding.pry
      if found_item != nil
        resp.write "#{found_item.price}"
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
  end
end
