class CategorySweeper < ActionController::Caching::Sweeper
  observe Category # This sweeper is going to keep an eye on the Category model
  
  def after_save(category)
      expire_cache_for(category)
  end
  
  # If our sweeper detects that a Item was created call this
  def after_create(category)
          expire_cache_for(category)
  end
 
  # If our sweeper detects that a Item was updated call this
  def after_update(category)
          expire_cache_for(category)
  end
 
  # If our sweeper detects that a Item was deleted call this
  def after_destroy(category)
          expire_cache_for(category)
  end
  
  def after_sort(category)
    expire_cache_for(category)
  end
  
  def after_enable(category)
    expire_cache_for(category)    
  end
 
  def after_disable(category)
    expire_cache_for(category)
  end
  
  private
  def expire_cache_for(category)
    # Expire the show page now that we made a change
    expire_action "/admin/categories/#{category.id}"
    expire_action "/mod/categories/#{category.id}"
    expire_action "/public/categories/#{category.id}"
 
    # Expire the about page now that we made a change
    expire_action '/admin/about'
    expire_action '/mod/about'
    expire_action '/public/about'
    
    # Expire the index page now that we made a change
    expire_action '/admin/categories'
    expire_action '/mod/categories'
    expire_action '/public/categories'
    expire_action '/public/categories.xml'
 
  end
end