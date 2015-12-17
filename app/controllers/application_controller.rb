class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    def sections(str)
    	arr3 = [] 
   		if str.include? ("-") or str.include? (",")
    		arr1 = str.split(",")
     		arr2 = [] 
    		arr1.each do |x| 
       			if x.include?('-') 
         			arr2.push(x.split("-").map { |s| s.to_i }) 
     			else 
        			arr2.push(x.to_i) 
      			end 
    		end 
     	arr2.each do |x| 
       		if x.class == Array
         		for i in x[0]..x[1]
           			arr3.push(i) 
         		end 
       		else 
         		arr3.push(x) 
       		end 
     	end 
   		else 
     		for i in 1..str.to_i 
       			arr3.push(i) 
    		end 
   		end 
 		arr3.uniq.sort 
 	end 
 	helper_method :sections
end
