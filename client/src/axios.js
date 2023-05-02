import qs from 'qs'
import axios from 'axios'

export default axios.create({
  baseURL: '/api',
  timeout: 60 * 1000, // 60 seconds to wait for server timeout
  maxRedirects: 1,
  paramsSerializer(params) {
    return qs.stringify(params)
  },
  withCredentials: true
})
