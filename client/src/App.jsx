import { useState, createContext } from "react";
import Main from "./views/Main";

export const BookerContext = createContext();

function App() {
  const [isbn, setIsbn] = useState('');
  const [book, setBook] = useState(null);
  const [error, setError] = useState(null);

  return (
    <BookerContext.Provider value={{ isbn, setIsbn, book, setBook, error, setError }}>
      <Main />
    </BookerContext.Provider>
  );
}

export default App;
