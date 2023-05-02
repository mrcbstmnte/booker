import {
  ActionIcon,
  Container,
  Footer,
  Group,
  Image,
  Stack,
  Text,
  TextInput,
} from '@mantine/core';

import Logo from '../assets/xyz-logo.svg';
import Facebook from '../assets/facebook.svg';
import Linkedin from '../assets/linkedin.svg';
import Twitter from '../assets/twitter.svg';

import './Foot.css'

const Foot = () => {
  const footerMenu = [
    {
      label: 'Shop All',
      link: '/#'
    },
    {
      label: 'About Us',
      link: '/#'
    },
    {
      label: 'Community',
      link: '/#'
    },
    {
      label: 'FAQs',
      link: '/#'
    }
  ].map((item) => (
    <a
      key={item.label}
      style={{ fontWeight: '500' }}
      href={item.link}
      className='footer--text'
    >
      {item.label}
    </a>
  ));

  const resources = [
    {
      label: 'Shipping & Returns',
      link: '/#'
    },
    {
      label: 'Help & FAQ',
      link: '/#'
    },
    {
      label: 'Terms & Conditions',
      link: '/#'
    },
    {
      label: 'Privacy Policy',
      link: '/#'
    },
    {
      label: 'Contact',
      link: '/#'
    },
    {
      label: 'Login',
      link: '/#'
    }
  ].map((item) => (
    <a
      key={item.label}
      style={{ fontWeight: '500' }}
      href={item.link}
      className='footer--text'
    >
      {item.label}
    </a>
  ));

  return (
    <Footer withBorder={false} style={{ marginTop: '6rem' }}>
      <Container size='lg' mb='xl'>
        <Group position='apart' style={{ alignItems: 'flex-start' }}>
          <Group>
            <Stack spacing="xl">
              <Image maw={125} src={Logo} />
              <Text>
                Lorem ipsum dolor sit amet, consetetur<br />
                sadipscing elitr, sed diam nonumy<br />
                eirmod
              </Text>
              <TextInput
                radius="lg"
                name="isbn-input"
                placeholder="Email address"
              />
            </Stack>
          </Group>
          <Group>
            <Stack>
              <Text fw={700}>Menu</Text>{footerMenu}
            </Stack>
          </Group>
          <Group>
            <Stack>
              <Text fw={700}>Support</Text>{resources}
            </Stack>
          </Group>
          <Group>
            <Stack>
              <Text fw={700}>Resources</Text>{resources}
            </Stack>
          </Group>
        </Group>
      </Container>

      <Container size="lg" style={{ marginTop: '6rem', marginBottom: '6rem' }}>
        <Group style={{ alignItems: 'center' }}>
          <Group style={{ flexGrow: 1 }}><Text>© 2022 Brainly.</Text></Group>
          <Group position="right">
            <ActionIcon variant="light" size="3rem" radius={30} color="#F2F2FF">
              <Image width={18} height={18} fit="contain" src={Facebook} /
              ></ActionIcon>
            <ActionIcon variant="light" size="3rem" radius={30} color="#F2F2FF">
              <Image width={18} height={18} fit="contain" src={Linkedin} /
              ></ActionIcon>
            <ActionIcon variant="light" size="3rem" radius={30} color="#F2F2FF">
              <Image width={18} height={18} fit="contain" src={Twitter} />
            </ActionIcon>
          </Group>
        </Group>
      </Container>
    </Footer>
  )
}

export default Foot
