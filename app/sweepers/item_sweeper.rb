class ItemSweeper < ActionController::Caching::Sweeper
  observe Item # This sweeper is going to keep an eye on the item model
 
  def after_save(item)
    expire_cache_for(item)
  end
  
  # If our sweeper detects that a Item was created call this
  def after_create(item)
          expire_cache_for(item)
  end
 
  # If our sweeper detects that a Item was updated call this
  def after_update(item)
          expire_cache_for(item)
  end
 
  # If our sweeper detects that a Item was deleted call this
  def after_destroy(item)
          expire_cache_for(item)
  end
  
  def after_sort(item)
    expire_cache_for(item)
  end
  
  def after_enable(item)
    expire_cache_for(item)
  end
  
  def after_disable(item)
    expire_cache_for(item)
  end
 
  private
  def expire_cache_for(item)
    # Expire the show page now that we made a change
    expire_action "/admin/items/#{item.id.to_s}"
    expire_action "/mod/items/#{item.id.to_s}"
    expire_action "/public/items/#{item.id.to_s}"
 
    # Expire the index page now that we made a change
    expire_action '/admin/items'
    expire_action '/mod/items'
    expire_action '/public/items'
 
  end
end