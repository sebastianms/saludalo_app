require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def test_welcome_email
      user = users(:user_just_got_registered)

      # Send the email, then test that it got queued
      email = UserMailer.welcome_email(user).deliver
      assert !ActionMailer::Base.deliveries.empty?

      # Test the body of the sent email contains what we expect it to
      assert_equal [user.email], email.to
    end
    
    def test_invitation_email
        host = users(:user_just_got_registered)
        guest = users(:user_just_got_invited)
        cause = causes(:one)
        # Send the email, then test that it got queued
        email = UserMailer.invitation_email(host,guest,cause).deliver
        assert !ActionMailer::Base.deliveries.empty?

        # Test the body of the sent email contains what we expect it to
        assert_equal [guest.email], email.to
        assert_match(/<h1><strong>#{cause.affected_name}<\/strong> necesita tu ayuda<\/h1>/, email.encoded)
      end
  end
