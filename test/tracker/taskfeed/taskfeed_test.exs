defmodule Tracker.TaskfeedTest do
  use Tracker.DataCase

  alias Tracker.Taskfeed

  describe "tasks" do
    alias Tracker.Taskfeed.Task

    @valid_attrs %{description: "some description", is_completed: true, time_taken: ~T[14:00:00.000000], title: "some title"}
    @update_attrs %{description: "some updated description", is_completed: false, time_taken: ~T[15:01:01.000000], title: "some updated title"}
    @invalid_attrs %{description: nil, is_completed: nil, time_taken: nil, title: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Taskfeed.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Taskfeed.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Taskfeed.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Taskfeed.create_task(@valid_attrs)
      assert task.description == "some description"
      assert task.is_completed == true
      assert task.time_taken == ~T[14:00:00.000000]
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Taskfeed.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Taskfeed.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.description == "some updated description"
      assert task.is_completed == false
      assert task.time_taken == ~T[15:01:01.000000]
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Taskfeed.update_task(task, @invalid_attrs)
      assert task == Taskfeed.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Taskfeed.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Taskfeed.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Taskfeed.change_task(task)
    end
  end

  describe "tasks" do
    alias Tracker.Taskfeed.Task

    @valid_attrs %{description: "some description", is_completed: true, time_taken: 42, title: "some title"}
    @update_attrs %{description: "some updated description", is_completed: false, time_taken: 43, title: "some updated title"}
    @invalid_attrs %{description: nil, is_completed: nil, time_taken: nil, title: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Taskfeed.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Taskfeed.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Taskfeed.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Taskfeed.create_task(@valid_attrs)
      assert task.description == "some description"
      assert task.is_completed == true
      assert task.time_taken == 42
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Taskfeed.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Taskfeed.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.description == "some updated description"
      assert task.is_completed == false
      assert task.time_taken == 43
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Taskfeed.update_task(task, @invalid_attrs)
      assert task == Taskfeed.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Taskfeed.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Taskfeed.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Taskfeed.change_task(task)
    end
  end
end
