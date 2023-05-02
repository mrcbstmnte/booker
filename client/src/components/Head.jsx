import { useContext } from 'react';
import { useNavigate } from "react-router-dom";
import {
  BackgroundImage,
  Button,
  Center,
  Container,
  Group,
  Header,
  Image,
  Text,
  TextInput,
} from '@mantine/core';

import { BookerContext } from "../App"

import TopBanner from '../assets/top-banner.png';
import XyzLogo from '../assets/xyz-logo.svg';
import Globe from '../assets/globe.svg';

import './Head.css'

const Head = () => {
  const navigate = useNavigate();
  const { isbn, setIsbn } = useContext(BookerContext);

  function handleSubmit(event) {
    event.preventDefault()

    const formData = new FormData(event.target);
    const isbn = formData.get('isbn')

    setIsbn(isbn)

    navigate(`/book/${isbn}`)
  }

  function handleLogoClick(event) {
    event.preventDefault()

    setIsbn('')

    navigate('/')
  }

  const links = [
    {
      label: 'Home',
      link: '#'
    },
    {
      label: 'Rent Textbooks',
      link: '#'
    },
    {
      label: 'Buy TextBooks',
      link: '#'
    },
    {
      label: 'Sell TextBooks',
      link: '#'
    }
  ].map((link) => (
    <a
      key={link.label}
      href={link.link}
      className='navigation--text'
    >
      <Text fw={500}>{link.label}</Text>
    </a>
  ));

  return (
    <Header withBorder={false}>
      <BackgroundImage
        src={TopBanner}
      >
        <Center>
          <Text color="#fff" py={10}>Save up to $500 per year on millions of book titles!</Text>
        </Center>
      </BackgroundImage>
      <Container size="lg">
        <Group py={20} spacing={80}>
          <Group>
            <a href="#" onClick={handleLogoClick}>
              <Image src={XyzLogo} />
            </a>
          </Group>
          <Group style={{ flexGrow: 1 }}>
            <form method="post" onSubmit={handleSubmit}>
              <TextInput
                radius="lg"
                name="isbn"
                placeholder="Search"
                defaultValue={isbn}
              />
            </form>
          </Group>
          <Group>
            {links}
            <Text c='dimmed' mr={10}>|</Text>
            <a href='/#' className='navigation--text'><img style={{ verticalAlign: 'middle' }} src={Globe} />&nbsp;En</a>
            <Button
              radius="md"
              color="violet"
              style={{ backgroundColor: '#6260F5' }}>
              Contact
            </Button>
          </Group>
        </Group>
      </Container>
    </Header>
  )
}

export default Head
