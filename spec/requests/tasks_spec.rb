# frozen_string_literal: true

require 'rails_helper'

describe TasksController, type: :request do
  describe 'POST /tasks' do
    context 'with valid parameters' do
      it 'creates a new task' do
        expect do
          post tasks_url, params: { task: { title: 'New Task' } }
        end.to change(Task, :count).by(1)

        expect(response).to redirect_to(task_url(Task.last))
        follow_redirect!

        expect(response.body).to include('Task was successfully created.')
      end
    end

    context 'with invalid parameters' do
      it 'creates a new task' do
        expect do
          post tasks_url, params: { task: { title: '' } }
        end.to change(Task, :count).by(0)

        # expect(response).to redirect_to(task_url(Task.last))
        # follow_redirect!

        # expect(response.body).to include('Task was successfully created.')
      end
    end
  end
end
