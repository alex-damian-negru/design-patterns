# frozen_string_literal: true

# Factory Method is a creational design pattern that provides an interface for creating objects in a superclass,
# but allows subclasses to alter the type of objects that will be created.
# Reference: https://refactoring.guru/design-patterns/factory-method

module Notifications
  module Entities
    class Notification
      def content = raise NotImplementedError
    end

    class Push < Notification
      def content = "This is a Push Notification.\n"
    end

    class Email < Notification
      def content = "This is an Email Notification.\n"
    end
  end

  module Creators
    class Creator
      def notification = raise NotImplementedError

      def submit = puts notification.content
    end

    class Push < Creator
      def notification = Entities::Push.new
    end

    class Email < Creator
      def notification = Entities::Email.new
    end
  end
end

def notify(creator)
  creator.submit
end

notify Notifications::Creators::Push.new
notify Notifications::Creators::Email.new
