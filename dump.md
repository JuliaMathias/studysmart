<section>
      <div class="content">
        <h2>Upcoming sessions</h2>
        <div class="row mt-6">

          <% @sessions.each do |session| %>
            <%= link_to session_path(session), class: "text-decoration-none" do %>

              <div class="col-4">
                <div class="card h-100 u-flex u-flex-column">

                  <div class="card-head">
                    <p class="card-head-title gray-700"><%= session.name %></p>
                  </div>

                  <div class="content">
                    <p class="gray-900"><%= session.content.truncate(140) %></p>
                  </div>

                  <div class="card-footer level content"><%= session.date %></div>

                </div>
              </div>
            <% end %>
          <% end %>


        </div>
      </div>
    </section>
