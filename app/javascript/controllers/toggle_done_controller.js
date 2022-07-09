import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-done"
export default class extends Controller {
  connect() {
  }
  toggle() {
    if (this.element.checked) {
      this.element.closest('.todo').classList.add('todo-done');
    } else {
      this.element.closest('.todo').classList.remove('todo-done');
    }
    let task_id = this.element.dataset.taskId;
    let todo_id = this.element.dataset.id;
    
    let url = `/tasks/${task_id}/todos/${todo_id}/toggle_done/todo`
	
    let data = JSON.stringify({
      todo: {
        id: todo_id,
        done: this.element.checked,
        task_id: task_id
      }
    });
    
    fetch(url, {
      method: "PATCH",
      credentials: "same-origin",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": getMetaValue("csrf-token"),
      },
      body: data
    })
  }
}

function getMetaValue(name) {
  const element = document.head.querySelector(`meta[name="${name}"]`)
  return element.getAttribute("content")
}