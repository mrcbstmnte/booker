import { useRouteError } from "react-router-dom";

import Head from '../components/Head'
import Error from './Error'

export default function RouterError() {
  const error = useRouteError();

  return (
    <div id="error-page">
      <Head />

      <Error error={error} />
    </div>
  );
}
