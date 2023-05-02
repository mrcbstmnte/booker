import {
  useState,
  useContext,
  useEffect
} from 'react';
import {
  Container,
  Group,
  Image,
  Skeleton,
  Stack,
  Text,
  Title,
} from '@mantine/core';
import { useParams } from 'react-router-dom';

import Head from '../components/Head'
import Error from './Error'

import { BookerContext } from '../App'
import { api } from '../api';

import './Book.css'

const Book = () => {
  const {
    error,
    book,
    isbn,
    setIsbn,
    setBook,
    setError
  } = useContext(BookerContext);
  const [isLoading, setIsLoading] = useState(true)
  const { id = '' } = useParams()

  useEffect(() => {
    if (id) {
      setIsbn(id)
    }
  }, [id])

  const getBook = async () => {
    try {
      const isnbs = await api.books.convertIsbn(isbn)
      const _book = await api.books.get(isnbs.isbn13)

      setIsLoading(false)
      setBook(_book)
      setError(null)
    } catch (error) {
      setIsLoading(false)
      setError(error)
    }
  }

  useEffect(() => {
    if (isbn) {
      getBook()
    }
  }, [isbn]);

  return (
    <>
      <Head />

      {error ? <Error error={error} /> :
        <Container size="lg" py={100}>
          <Skeleton visible={isLoading}>
            <Title px={60} order={1} color="#151C55">Search Result</Title>
            <Group px={60} py={50} spacing={80} style={{ alignItems: 'flex-start' }}>
              <Group>
                <Image radius="lg" src={book?.image_url} width={250} height={250} fit="fill" />
              </Group>
              <Group>
                <Stack>
                  <Title className='book-attributes__label' order={2}>{book?.title}</Title>
                  <Title className='book-attributes__label' py={10} order={5}> by {book?.authors}</Title>
                  <Stack spacing={0}>
                    <Text fw={600}>
                      <span className='book-attributes__label'>
                        Edition:
                      </span>
                      <span className='book-attributes__content'> {book?.edition}</span>
                    </Text>
                    <Text fw={600}>
                      <span className='book-attributes__label'>
                        Price:
                      </span>
                      <span className='book-attributes__content'> {book?.price}</span>
                    </Text>
                    <Text fw={600}>
                      <span className='book-attributes__label'>
                        ISBN:
                      </span>
                      <span className='book-attributes__content'> {book?.isbn}</span>
                    </Text>
                    <Text fw={600}>
                      <span className='book-attributes__label'>
                        Publication Year:
                      </span>
                      <span className='book-attributes__content'> {book?.publication_year}</span>
                    </Text>
                    <Text fw={600}>
                      <span className='book-attributes__label'>
                        Publisher:
                      </span>
                      <span className='book-attributes__content'> {book?.publisher}</span>
                    </Text>
                  </Stack>
                </Stack>
              </Group>
            </Group>
          </Skeleton>
        </Container>
      }


    </>
  )
}

export default Book
