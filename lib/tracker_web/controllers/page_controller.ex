defmodule TrackerWeb.PageController do
  use TrackerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def feed(conn, _params) do
    tasks = Tracker.Taskfeed.list_tasks()
    changeset = Tracker.Taskfeed.change_task(%Tracker.Taskfeed.Task{})
    render conn, "feed.html", tasks: tasks, changeset: changeset
  end
end
