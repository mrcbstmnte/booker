import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom"

import Home from './Home'
import Book from './Book'
import RouterError from './RouterError'

import Foot from '../components/Foot'

const router = createBrowserRouter([
  {
    path: '/',
    element: <Home />,
    errorElement: <RouterError />
  },
  {
    path: '/book/:id',
    element: <Book />,
    errorElement: <RouterError />
  }
]);

const Main = () => {
  return (
    <div>
      <RouterProvider router={router} />
      <Foot />
    </div>
  )
}

export default Main
