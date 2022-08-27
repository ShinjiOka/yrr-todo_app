// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import React, {StrictMode} from 'react';
import { createRoot } from 'react-dom/client';
import App from './components/App';
import { BrowserRouter } from "react-router-dom";

const container = document.getElementById('root');
const root = createRoot(container);

document.addEventListener('DOMContentLoaded', () => {
  root.render(
    <StrictMode>
      <BrowserRouter>
        <App />
      </BrowserRouter>
    </StrictMode>
  );
});