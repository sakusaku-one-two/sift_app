import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import { BrowserRouter } from 'react-router-dom'
import Store from './strore.tsx'
import App from './App.tsx'
import BasicLayout from './basicLayout.tsx'
createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <Store>
        <BasicLayout>
          <BrowserRouter>
            <App />
          </BrowserRouter>
        </BasicLayout>
    </Store>
  </StrictMode>,
)
