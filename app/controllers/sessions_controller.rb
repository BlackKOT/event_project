# Rails.root/app/controllers/sessions.rb
class SessionsController < Devise::SessionsController

  def create
    if current_user
      @cur_sess = SignTime.new()
      @cur_sess.user_id = current_user.id
      @cur_sess.sign = Time.now
      @cur_sess.login = true
      @cur_sess.save
    end
    super
  end
  def destroy
    @cur_sess = SignTime.new()
    @cur_sess.user_id = current_user.id
    @cur_sess.sign = Time.now
    @cur_sess.login = false
    @cur_sess.save
    super
  end
end