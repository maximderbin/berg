class Admin::Application < Dry::Web::Application
  route "people" do |r|
    r.authorize do
      r.is do
        r.get do
          r.view "people.index", page: r[:page]
        end

        r.post do
          r.resolve "admin.people.operations.create" do |create_post|
            create_post.(r[:person]) do |m|
              m.success do
                flash[:notice] = t["admin.people.person_created"]
                r.redirect "/admin/people"
              end

              m.failure do |validation|
                r.view "people.new", validation: validation
              end
            end
          end
        end
      end

      r.get "new" do
        r.view "people.new"
      end

      r.on ":id" do |id|
        r.get "edit" do
          r.view "people.edit", id: id
        end

        r.post do
          r.resolve "admin.people.operations.update" do |update_post|
            update_post.(id, r[:post]) do |m|
              m.success do
                flash[:notice] = t["admin.people.post_updated"]
                r.redirect "/admin/people"
              end

              m.failure do |validation|
                r.view "people.edit", id: id, post_validation: validation
              end
            end
          end
        end
      end
    end
  end
end
