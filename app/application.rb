
class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      puts "Item name: #{item_name}"
      found_item = Item.new
      found = false
      @@items.each do |i|
        if i.name == item_name
          puts "**********************************"
          puts "name: #{i.name}"
          puts "      item name: #{item_name}"
          puts "**********************************\n\n\n"
          found = true
          found_item = i
        end
      end
      #
      # puts "****************************"
      # puts "Items: #{@@items}"
      # puts "found: #{found}"
      # puts "item: #{found_item}"
      # puts "\n\n\n**************************"

      if found
        resp.write found_item.price
        resp.status = 200
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    # if req.path.match(/items/)
    #   @@items.each do |item|
    #     resp.write "#{item}\n"
    #   end
    # elsif req.path.match(/search/)
    #   search_term = req.params["q"]
    #   resp.write handle_search(search_term)
    # elsif req.path.match(/cart/)
    #   if @@cart == []
    #     resp.write "Your cart is empty"
    #   else
    #     @@cart.each do |item|
    #       resp.write "#{item}\n"
    #     end
    #   end
    #   elsif req.path.match(/add/)
    #     item_to_add = req.params["item"]
    #     if @@items.include? item_to_add
    #       @@cart << item_to_add
    #       resp.write "added #{item_to_add}"
    #     else
    #       resp.write "Route not found"
    #     end
    # else
    #   resp.write "Path Not Found"
    # end

    resp.finish
  end
end
