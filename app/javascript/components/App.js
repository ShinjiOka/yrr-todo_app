import React from 'react';
import { Switch, Route, Link } from 'react-router-dom';
import { AddTodo } from './AddTodo'
import { TodoList } from './TodoList'
import { EditTodo } from './EditTodo'
import './App.css'


const App = () => {
    return (
        <nav>
            <div>
                Todo
            </div>
            <ul>
                <li>
                    <Link to="/todos">
                        Todos
                    </Link>
                </li>
                <li>
                    <Link to="/todos/new">
                        New Todo
                    </Link>
                </li>
            </ul>
            <div>
                <Switch>
                    <Route exact path="/todos" components={TodoList} />
                    <Route exact path="/todos/new" components={AddTodo} />
                    <Route path="/todos/:id/edit" components={EditTodo} />
                </Switch>
            </div>
        </nav>
    )
}
    
export default App;