require "berg/form"

module Admin
  module Projects
    module Forms
      class CreateForm < Berg::Form
        include Admin::Import["admin.persistence.repositories.projects"]

        prefix :project

        define do
          text_field :title, label: "Title"
          text_field :client, label: "Client"
          text_field :url, label: "URL"
          text_area :intro, label: "Introduction"
          text_area :body, label: "Body"
          text_field :tags, label: "Tags"
        end
      end
    end
  end
end
