module FlashHelper
  def flash_style(flash_key)
    flash_key.to_sym == :notice ? 
                        'bg-green-50 mb-5 text-green-500 border border-1 border-green-300' : 
                        'bg-rose-50 mb-5 text-red-500 border border-1 border-rose-300' 
  end
end
