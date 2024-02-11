const todoForm = document.getElementById("todo-form");
const todoInput = document.getElementById("todo-input");
const todoList = document.getElementById("todo-list");

todoForm.addEventListener("submit", function(event) {
    event.preventDefault();
    addTodo();
});

todoList.addEventListener("click", function(event) {
    if (event.target.classList.contains("delete-button")) {
        const todoItem = event.target.parentElement;
        removeTodoItem(todoItem);
    }
});

function addTodo() {
    const todoText = todoInput.value.trim();
    if (todoText !== "") {
        const todoItem = createTodoItem(todoText);
        todoList.appendChild(todoItem);
        todoInput.value = "";
    }
}

function createTodoItem(todoText) {
    const todoItem = document.createElement("li");
    todoItem.textContent = todoText;
    const deleteButton = document.createElement("button");
    deleteButton.textContent = "Delete";
    deleteButton.classList.add("delete-button");
    
      todoItem.style.backgroundColor = "white";
      todoItem.style.width = "30px";
      todoItem.style.height="30px"
  	  todoItem.style.borderRadius = "5px";

    todoItem.appendChild(deleteButton);
    return todoItem;
}

function removeTodoItem(todoItem) {
    todoItem.remove();
}