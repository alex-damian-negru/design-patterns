# frozen_string_literal: true

module Notifications
  module Entities
    class Notification
      # @return [String]
      def content = raise NotImplementedError
    end

    class Push < Notification
      # @return [String]
      def content = "This is a Push Notification.\n"
    end

    class Email < Notification
      # @return [String]
      def content = "This is an Email Notification.\n"
    end
  end

  module Creators
    class Creator
      # @return [Notifications::Entities::Notification]
      def notification = raise NotImplementedError

      # @return [nil]
      def submit = puts notification.content
    end

    class Push < Creator
      # @return [Notifications::Entities::Push]
      def notification = Entities::Push.new
    end

    class Email < Creator
      # @return [Notifications::Entities::Email]
      def notification = Entities::Email.new
    end
  end
end

# @param creator [Notifications::Creators::Creator]
def notify(creator)
  creator.submit
end

notify Notifications::Creators::Push.new
notify Notifications::Creators::Email.new