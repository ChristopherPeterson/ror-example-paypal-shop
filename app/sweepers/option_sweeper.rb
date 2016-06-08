class OptionSweeper < ActionController::Caching::Sweeper
  observe Option # This sweeper is going to keep an eye on the Item model
 
  def after_save(option)
    expire_cache_for(option)
  end
  
  # If our sweeper detects that a Item was created call this
  def after_create(option)
          expire_cache_for(option)
  end
 
  # If our sweeper detects that a Item was updated call this
  def after_update(option)
          expire_cache_for(option)
  end
 
  # If our sweeper detects that a Item was deleted call this
  def after_destroy(option)
          expire_cache_for(option)
  end
  
  def after_sort(option)
    expire_cache_for(option)
  end
  
  def after_enable(option)
    expire_cache_for(option)
  end
  
  def after_disable(option)
    expire_cache_for(option)
  end
 
  private
  def expire_cache_for(option)
    # Expire the show page now that we made a change
    expire_action "/admin/options/#{option.id.to_s}"
    expire_action "/mod/options/#{option.id.to_s}"
    expire_action "/public/options/#{option.id.to_s}"
    
    # Expire the index page now that we made a change
    expire_action '/admin/options'
    expire_action '/mod/options'
    expire_action '/public/options'
  
  end
end