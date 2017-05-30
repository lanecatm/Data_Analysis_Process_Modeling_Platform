
<div class="col-md-12">
    <% if @page.homeland_nodes.size != 0 %>
        <div class="panel panel-default">
            <div class="panel-heading">Topics</div>
            <div class="panel-body">
                <% @topics = @page.homeland_nodes[0].topics %>
                <%= render @topics %>
                <% @topic = Homeland::Topic.new %>
                <% @topic.node_id =  @page.homeland_nodes[0].id %>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">New Topic</div>
            <div class="panel-body">
                <%= form_for (@topic), url: homeland.topics_path do |f| %>
                    <%= f.hidden_field :node_id %>
                    <div class="form-group">
                        <label>Analytics Application </label>
                        <%= f.select :node_id, Homeland::Node.all.collect { |n| [n.name, n.id] }, {}, { class: 'form-control' } %>
                    </div>

                    <div class="form-group">
                        <%= f.label :title %>
                        <%= f.text_field :title, class: "form-control" %>
                    </div>

                    <div class="form-group">
                        <%= f.label :body %>
                        <%= f.text_area :body, class: "form-control", rows: "10" %>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary " data-disable-with="<%= t('homeland.submiting') %>"><%= t('homeland.submit') %></button>
                        <a href="<%= @topic.id.blank? ? homeland.topics_path : homeland.topic_path(@topic) %>" class="btn btn-default"><%= t('homeland.cancel') %></a>
                    </div>
                <% end %>
            </div>
        </div>

    <% else %>
        <p>No furum </p>
    <% end %>
</div>
