/* eslint-disable react/prop-types */
import {
  Container,
  Title,
} from '@mantine/core';

export default function Error({ error }) {
  return (
    <Container size="lg" py={100}>
      {
        !error.internal ? '' :
          <Title align="center" px={60} order={1} color="#151C55">Sorry, an unexpected error has occurred.</Title>
      }

      <Title align="center" pt={10} order={3} color="#505F70">
        {error.statusText || error.message}
      </Title>
    </Container>
  )
}
