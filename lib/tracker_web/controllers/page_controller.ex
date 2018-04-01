defmodule TrackerWeb.PageController do
  use TrackerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, params) do
  	render conn, "show.html"
  end

  def feed(conn, _params) do
  	tasks = Enum.reverse(Tracker.Taskfeed.feed_tasks_for(conn.assigns[:current_user]))
    changeset = Tracker.Taskfeed.change_task(%Tracker.Taskfeed.Task{})
    render conn, "feed.html", tasks: tasks, changeset: changeset
  end
end
