module ApplicationHelper
	@@types = ['png' , 'jpeg' , 'jpg' , 'gif']
	 def checkImage(type)
	 	return true if @@types.include?(type)
		end

		def upload(file)
    upload_io = file
    puts upload_io.inspect
    filename = file.original_filename
   type = filename.split('.').last
   if type =='png' || type =='jpeg' || type =='jpg' || type == 'gif'
    fld = Time.now.to_i
    filename= "img#{fld}." + type
    File.open(Rails.root.join("public","upload",filename), "wb")  do |file|
    	file.write(upload_io.read)
     	return filename
    end
      else
      	return false
      end
  end
end
