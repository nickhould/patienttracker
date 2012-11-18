class MicropostsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
	before_filter :correct_user, only: :destroy

	def index 
	end

	def create
		@micropost = current_user.microposts.build(params[:micropost])
		# send an sms
		@twilio = Twilio::REST::Client.new 'ACbaa5ed8ed7b38cde658833406c15af39', 'dd615de6d80b331013da9d2c0eca7877'
		@twilio.account.sms.messages.create(
			:from => '+16305604592',
			#:to => '+13149225151', # Jason
			#:to => '+16365380326', # Shane
 			:to => '+16307247322', # Aziz
 			:body => 'Message from Patient Tracker: ' + params[:micropost]['content']
		)
		Mail.defaults do
		  delivery_method :smtp, { :address   => "smtp.sendgrid.net",
		                           :port      => 587,
		                           :domain    => "gmail.com",
		                           :user_name => "azizali88",
		                           :password  => "borrowme",
		                           :authentication => 'plain',
		                           :enable_starttls_auto => true }
		end

		# FIXME: this is very bad, bad.
		message_body = params[:micropost]['content']
		mail = Mail.deliver do
		  to 'aziz@qitch.com'
		  from 'Aziz Ali <aziz.ali88@gmail.com>'
		  subject 'Patient Tracker Update'
		  body message_body
		end

		# puts params[:micropost]['content']
		if @micropost.save
			flash[:success] = "Micropost created"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@micropost.destroy
		redirect_to root_url
	end

	private

		def correct_user
			@micropost = current_user.microposts.find_by_id(params[:id])
			redirect_to root_url if @micropost.nil?
		end
end