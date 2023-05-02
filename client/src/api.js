import axios from './axios'

export const CancelToken = axios.CancelToken
export const isCancel = axios.isCancel

const _api = createAPI()

export const api = _api
export default axios

axios.interceptors.response.use((response) => {
  return response.data
}, (error) => {
  if (error.response) {
    return Promise.reject(error.response.data)
  }

  console.log(error)
  console.log('error.response', error.response)
  return Promise.reject(error)
})

function createAPI() {
  return {
    books: books()
  }
}

function books() {
  async function get(isbn) {
    const response = await axios.get(`/books/${isbn}`)

    return response
  }

  async function convertIsbn(isbn) {
    const response = await axios.get(`/books/isbn_conversion/${isbn}`)

    return response
  }

  return {
    get,
    convertIsbn
  }
}


// import axios from 'axios';

// const BASE_URL = 'http://localhost:3000'

// export const retrieveBook = async (isbn) => {
//   try {
//     const response = await axios.get(`${BASE_URL}/books/${isbn}`);

//     return response.data;
//   } catch (error) {
//     // throw error.response.data.errors[0].detail;
//   }
// };


// export const getIsbn13 = async (isbn) => {
//   try {
//     const response = await axios.get(`${BASE_URL}/books/isbn_conversion/${isbn}`);

//     return response.data;
//   } catch (error) {
//     console.log(error)

//     throw error
//   }
// };
